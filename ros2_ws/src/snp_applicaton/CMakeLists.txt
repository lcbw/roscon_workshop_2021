cmake_minimum_required(VERSION 3.5)
project(snp_application)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

if(CMAKE_VERSION VERSION_LESS "3.7.0")
  set(CMAKE_INCLUDE_CURRENT_DIR ON)
endif()

find_package(Eigen3 REQUIRED)
find_package(Qt5 COMPONENTS Widgets REQUIRED)

find_package(ament_cmake REQUIRED)
find_package(Eigen3 REQUIRED)
find_package(open3d_interface_msgs REQUIRED)
find_package(rclcpp REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(visualization_msgs REQUIRED)
find_package(snp_msgs REQUIRED)
find_package(std_srvs REQUIRED)
find_package(tesseract_command_language REQUIRED)
find_package(tesseract_common REQUIRED)
find_package(tesseract_msgs REQUIRED)
find_package(tesseract_rosutils REQUIRED)
find_package(tesseract_visualization REQUIRED)
find_package(tf2_eigen)

include_directories(
  include
  ${EIGEN3_INCLUDE_DIRS}
)

add_executable(roscon_app
  src/rosconwindow.ui
  src/rosconwindow.cpp
  src/main.cpp
  include/rosconwindow.h
)
target_link_libraries(roscon_app
  Qt5::Widgets
  tesseract::tesseract_command_language
  tesseract::tesseract_common
  tesseract::tesseract_visualization)
ament_target_dependencies(roscon_app
  open3d_interface_msgs
  rclcpp
  sensor_msgs
  geometry_msgs
  visualization_msgs
  snp_msgs
  std_srvs
  tesseract_msgs
  tesseract_rosutils
  tf2_eigen)

install(TARGETS roscon_app DESTINATION lib/${PROJECT_NAME}/)

ament_package()
