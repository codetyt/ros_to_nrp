#include <chrono>
#include <iostream>
#include <fstream>
#include <iostream>
#include <ctime>
#include <tuple>
#include <cmath>
#include <math.h>

#include "ros/ros.h"
#include "cpg_to_cdp1/MyMuscleState.h"
#include "cpg_to_cdp1/MyMuscleStates.h"
#include "geometry_msgs/Vector3.h"


using std::cout; using std::endl;
using std::chrono::duration_cast;
using std::chrono::milliseconds;
using std::chrono::seconds;
using std::chrono::system_clock;

int c = 0;
double* calc_angular(cpg_to_cdp1::MyMuscleStates mmstates) {
    geometry_msgs::Vector3 F[2], R[2], H[2];
    F[0] = mmstates.muscles[0].path_points[0]; F[1] = mmstates.muscles[0].path_points[2];
    R[0] = mmstates.muscles[2].path_points[0]; F[1] = mmstates.muscles[2].path_points[1];
    H[0] = mmstates.muscles[4].path_points[0]; F[1] = mmstates.muscles[4].path_points[3];
     
    static double angular[3];
    for (int i=0; i<3; i++) { angular[i] = 0.0; }
    double theta_F = atan( (F[0].z - F[1].z) / (F[0].y - F[1].y) );
    double theta_R = atan( (R[0].z - R[1].z) / (R[0].y - R[1].y) );
    double theta_H = atan( (H[0].z - H[1].z) / (H[0].y - H[1].y) );
    
    angular[0] = (theta_F - theta_R > 0) ? theta_F - theta_R : M_PI + theta_F - theta_R;
    angular[1] = (theta_R - theta_H > 0) ? M_PI - (theta_R - theta_H) : -(theta_R - theta_H);
    angular[2] = theta_H > 0 ? M_PI - theta_H : -theta_H;
    return angular;
}
double angular_pre[3];
double DT = 1.0 / 200;
double* calc_angular_v_b(double angular_pre[3], double angular_now[3], double dt) {
    static double angular_v[3];
    if (angular_pre[0]==0.0 && angular_pre[1]==0.0 && angular_pre[2]==0.0) {
      for (int i=0; i<3; i++) { angular_v[i] = 0.0; }
      return angular_v; 
    }
    for (int i=0; i<3; i++) {
        angular_v[i] = (angular_now[i] - angular_pre[i]) / dt;
    }
    return angular_v;
}
void topicCallback(const cpg_to_cdp1::MyMuscleStates mmstates)
{
    //// show raw mmstates
    // std_msgs::Header h = mmstates.header;
    // for (int i=0; i<6; i++) {
    //   auto *muscle_name = mmstates.muscles[i].name.c_str();
    //   float f =  mmstates.muscles[i].force;
    //   float l =  mmstates.muscles[i].length;
    //   float dl =  mmstates.muscles[i].lengthening_speed;
    //   auto pps = mmstates.muscles[i].path_points;
    //   cout << "# " << muscle_name << endl;
    //   for (int j=0; j<(int)pps.size(); j++) {
    //     cout << pps[j].x << " " <<  pps[j].y << " " << pps[j].z << endl;
    //   }
    //   cout << pps[0].x " " << pps[0].y << " " << pps[0].z << " " << f <<  " " << l << " " << dl << endl << endl << endl;
    // }

    // show angular & angular_velocity
    double* angular = calc_angular(mmstates);
    double* angular_velocity = calc_angular_v_b(angular_pre, angular, DT);
    for (int i=0; i<3; i++) {
      cout << angular[i] << " " << angular_velocity[i] << " ";
      angular_pre[i] = angular[i];
    }

    // show Foot terminal position
    cout <<  mmstates.muscles[0].path_points[2].y;
    cout << endl;
}

int main(int argc, char **argv)
{
  for (int i=0; i<3; i++) { angular_pre[i] = 0.0; }
  ros::init(argc, argv, "MS_subscriber");
  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("gazebo_muscle_interface/robot/muscle_states", 1000, topicCallback);

  ros::spin();

  return 0;
}
