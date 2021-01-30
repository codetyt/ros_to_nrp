#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <array>
#include <deque>
#include <numeric>

#include <chrono>
#include <iostream>
#include <sys/time.h>
#include <ctime>

#include "ros/ros.h"
#include "std_msgs/Float64.h"

using namespace std;

using std::cout; using std::endl;
using std::chrono::duration_cast;
using std::chrono::milliseconds;
using std::chrono::seconds;
using std::chrono::system_clock;

#define N 2
#define TAU_MBP 10.0
#define TAU_SYN 100.0
#define TAU_ADP 2000.0
#define W ( -2.0 )
#define E_LEAK ( -65.0 )
#define THRESHOLD ( -55.0 )
#define R_ADP 0.5
#define I_EXT 20.0
#define DT 1.0
#define WT 100

int main(int argc, char **argv)
{
  // initialize & stablize brain network
  double t = 0.0;
  double w [ N ] [N ] = { { 0.0, W }, { W, 0.0 } };
  double v [ N ] = { E_LEAK, E_LEAK - 5.0 };
  double i_syn [ N ] = { 0.0, 0.0 };
  double i_adp [ N ] = { 0.0, 0.0 };
  int s [ N ] = { 0, 0 };
  array < deque < double >, N > s_queues;
  double fwd [ 6 ] = {0.0, 1.0, 0.0, 1.0, 1.0, 0.0};
  double bwd [ 6 ] = {1.0, 0.0, 1.0, 0.0, 0.0, 1.0};
  double rate [ N ] = { 0.0, 0.0 };

  for ( int n = 0; n < WT; n++ ) {
    t = DT * n;
    for ( int i = 0; i < N; i++ ) {
      double r = 0;
      for ( int j = 0; j < N; j++ ) {
        r += w [ i ] [ j ] * s [ j ];
      }
      i_syn [ i ] = exp ( - DT / TAU_SYN ) * i_syn [ i ] + r;
      i_adp [ i ] = exp ( - DT / TAU_ADP ) * i_adp [ i ] + s [ i ];
    }
    for ( int i = 0; i < N; i++ ) {
      double dv = DT * ( - ( v [ i ] - E_LEAK ) + i_syn [ i ] - R_ADP * i_adp [ i ] + I_EXT ) / TAU_MBP;
      if ( v [ i ] > THRESHOLD ) {
        s [ i ] = 1;
        v [ i ] = E_LEAK;
      } else {
        s [ i ] = 0;
        v [ i ] += dv;
      }
      s_queues [i].push_front( s [ i ] );
    }
  }

  // initialize & setup rosnodes
  ros::init(argc, argv, "brain_model");
  ros::NodeHandle n;
  int muscle_count = 6;
  std::string muscle_names[muscle_count] = {"Foot1", "Foot2", "Humerus1", "Humerus2", "Radius1", "Radius2"};
  ros::Publisher pubs[muscle_count];
  for (int i=0; i<muscle_count; i++) { pubs[i] = n.advertise<std_msgs::Float64>("/gazebo_muscle_interface/robot/" + muscle_names[i] + "/cmd_activation", 1000); }
  ros::Rate loop_rate(1000);
  
  double nndata[muscle_count];
  std_msgs::Float64 activation;
  while (ros::ok())
//   for (int count=0; count<1000; count++)
  {
    for (int i=0; i<muscle_count; i++) { nndata[i] = 0.0; }

    t += DT;
    for ( int i = 0; i < N; i++ ) {
      double r = 0;
      for ( int j = 0; j < N; j++ ) {
        r += w [ i ] [ j ] * s [ j ];
      }
      i_syn [ i ] = exp ( - DT / TAU_SYN ) * i_syn [ i ] + r;
      i_adp [ i ] = exp ( - DT / TAU_ADP ) * i_adp [ i ] + s [ i ];
    }
    for ( int i = 0; i < N; i++ ) {
      double dv = DT * ( - ( v [ i ] - E_LEAK ) + i_syn [ i ] - R_ADP * i_adp [ i ] + I_EXT ) / TAU_MBP;
      if ( v [ i ] > THRESHOLD ) {
        s [ i ] = 1;
        v [ i ] = E_LEAK;
      } else {
        s [ i ] = 0;
        v [ i ] += dv;
      }
      s_queues [ i ].pop_back ();
      s_queues [i].push_front( s [ i ] );
      rate [ i ] = accumulate ( s_queues[i].begin(), s_queues[i].end(), 0) / 3.0;
    }
    for (int i=0; i<6; i++) {
      nndata[ i ] = rate [ 0 ]*fwd [ i ] + rate [ 1 ]*bwd [ i ]; 
      printf("%f ", nndata[ i ]);
    }
    auto millisec_since_epoch = duration_cast<milliseconds>(system_clock::now().time_since_epoch()).count();
    cout << "seconds since epoch: " << millisec_since_epoch << endl;
    for (int i=0; i<muscle_count; i++) {
      activation.data = nndata[i];
       pubs[i].publish(activation);
    } 
    ros::spinOnce();
    loop_rate.sleep();
  }
  return 0;
}