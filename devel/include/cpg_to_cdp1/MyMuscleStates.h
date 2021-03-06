// Generated by gencpp from file cpg_to_cdp1/MyMuscleStates.msg
// DO NOT EDIT!


#ifndef CPG_TO_CDP1_MESSAGE_MYMUSCLESTATES_H
#define CPG_TO_CDP1_MESSAGE_MYMUSCLESTATES_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <cpg_to_cdp1/MyMuscleState.h>

namespace cpg_to_cdp1
{
template <class ContainerAllocator>
struct MyMuscleStates_
{
  typedef MyMuscleStates_<ContainerAllocator> Type;

  MyMuscleStates_()
    : header()
    , muscles()  {
    }
  MyMuscleStates_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , muscles(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::cpg_to_cdp1::MyMuscleState_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::cpg_to_cdp1::MyMuscleState_<ContainerAllocator> >::other >  _muscles_type;
  _muscles_type muscles;





  typedef boost::shared_ptr< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> const> ConstPtr;

}; // struct MyMuscleStates_

typedef ::cpg_to_cdp1::MyMuscleStates_<std::allocator<void> > MyMuscleStates;

typedef boost::shared_ptr< ::cpg_to_cdp1::MyMuscleStates > MyMuscleStatesPtr;
typedef boost::shared_ptr< ::cpg_to_cdp1::MyMuscleStates const> MyMuscleStatesConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator1> & lhs, const ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.muscles == rhs.muscles;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator1> & lhs, const ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cpg_to_cdp1

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> >
{
  static const char* value()
  {
    return "68a8a94a76f8e57fa8ecb44dba7bb6da";
  }

  static const char* value(const ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x68a8a94a76f8e57fULL;
  static const uint64_t static_value2 = 0xa8ecb44dba7bb6daULL;
};

template<class ContainerAllocator>
struct DataType< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cpg_to_cdp1/MyMuscleStates";
  }

  static const char* value(const ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"# broadcast all muscle states in world frame\n"
"MyMuscleState[] muscles\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: cpg_to_cdp1/MyMuscleState\n"
"# muscle state\n"
"string name\n"
"float32 force\n"
"float32 length\n"
"float32 lengthening_speed\n"
"geometry_msgs/Vector3[] path_points\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.muscles);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MyMuscleStates_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cpg_to_cdp1::MyMuscleStates_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "muscles[]" << std::endl;
    for (size_t i = 0; i < v.muscles.size(); ++i)
    {
      s << indent << "  muscles[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::cpg_to_cdp1::MyMuscleState_<ContainerAllocator> >::stream(s, indent + "    ", v.muscles[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CPG_TO_CDP1_MESSAGE_MYMUSCLESTATES_H
