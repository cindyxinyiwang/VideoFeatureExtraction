# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.3

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.3.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.3.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/cindywang/Documents/opencv/saliency

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/cindywang/Documents/opencv/saliency

# Include any dependencies generated for this target.
include CMakeFiles/saliency.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/saliency.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/saliency.dir/flags.make

CMakeFiles/saliency.dir/main.cpp.o: CMakeFiles/saliency.dir/flags.make
CMakeFiles/saliency.dir/main.cpp.o: main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/cindywang/Documents/opencv/saliency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/saliency.dir/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/saliency.dir/main.cpp.o -c /Users/cindywang/Documents/opencv/saliency/main.cpp

CMakeFiles/saliency.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/saliency.dir/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/cindywang/Documents/opencv/saliency/main.cpp > CMakeFiles/saliency.dir/main.cpp.i

CMakeFiles/saliency.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/saliency.dir/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/cindywang/Documents/opencv/saliency/main.cpp -o CMakeFiles/saliency.dir/main.cpp.s

CMakeFiles/saliency.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/saliency.dir/main.cpp.o.requires

CMakeFiles/saliency.dir/main.cpp.o.provides: CMakeFiles/saliency.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/saliency.dir/build.make CMakeFiles/saliency.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/saliency.dir/main.cpp.o.provides

CMakeFiles/saliency.dir/main.cpp.o.provides.build: CMakeFiles/saliency.dir/main.cpp.o


# Object files for target saliency
saliency_OBJECTS = \
"CMakeFiles/saliency.dir/main.cpp.o"

# External object files for target saliency
saliency_EXTERNAL_OBJECTS =

saliency: CMakeFiles/saliency.dir/main.cpp.o
saliency: CMakeFiles/saliency.dir/build.make
saliency: /usr/local/lib/libopencv_xphoto.3.0.0.dylib
saliency: /usr/local/lib/libopencv_tracking.3.0.0.dylib
saliency: /usr/local/lib/libopencv_surface_matching.3.0.0.dylib
saliency: /usr/local/lib/libopencv_structured_light.3.0.0.dylib
saliency: /usr/local/lib/libopencv_stereo.3.0.0.dylib
saliency: /usr/local/lib/libopencv_saliency.3.0.0.dylib
saliency: /usr/local/lib/libopencv_rgbd.3.0.0.dylib
saliency: /usr/local/lib/libopencv_reg.3.0.0.dylib
saliency: /usr/local/lib/libopencv_optflow.3.0.0.dylib
saliency: /usr/local/lib/libopencv_line_descriptor.3.0.0.dylib
saliency: /usr/local/lib/libopencv_dpm.3.0.0.dylib
saliency: /usr/local/lib/libopencv_dnn.3.0.0.dylib
saliency: /usr/local/lib/libopencv_datasets.3.0.0.dylib
saliency: /usr/local/lib/libopencv_ccalib.3.0.0.dylib
saliency: /usr/local/lib/libopencv_bioinspired.3.0.0.dylib
saliency: /usr/local/lib/libopencv_bgsegm.3.0.0.dylib
saliency: /usr/local/lib/libopencv_aruco.3.0.0.dylib
saliency: /usr/local/lib/libopencv_adas.3.0.0.dylib
saliency: /usr/local/lib/libopencv_videostab.3.0.0.dylib
saliency: /usr/local/lib/libopencv_superres.3.0.0.dylib
saliency: /usr/local/lib/libopencv_stitching.3.0.0.dylib
saliency: /usr/local/lib/libopencv_photo.3.0.0.dylib
saliency: /usr/local/lib/libopencv_hal.a
saliency: /usr/local/lib/libopencv_ximgproc.3.0.0.dylib
saliency: /usr/local/lib/libopencv_text.3.0.0.dylib
saliency: /usr/local/lib/libopencv_face.3.0.0.dylib
saliency: /usr/local/lib/libopencv_xobjdetect.3.0.0.dylib
saliency: /usr/local/lib/libopencv_xfeatures2d.3.0.0.dylib
saliency: /usr/local/lib/libopencv_shape.3.0.0.dylib
saliency: /usr/local/lib/libopencv_video.3.0.0.dylib
saliency: /usr/local/lib/libopencv_objdetect.3.0.0.dylib
saliency: /usr/local/lib/libopencv_calib3d.3.0.0.dylib
saliency: /usr/local/lib/libopencv_features2d.3.0.0.dylib
saliency: /usr/local/lib/libopencv_ml.3.0.0.dylib
saliency: /usr/local/lib/libopencv_highgui.3.0.0.dylib
saliency: /usr/local/lib/libopencv_videoio.3.0.0.dylib
saliency: /usr/local/lib/libopencv_imgcodecs.3.0.0.dylib
saliency: /usr/local/lib/libopencv_imgproc.3.0.0.dylib
saliency: /usr/local/lib/libopencv_flann.3.0.0.dylib
saliency: /usr/local/lib/libopencv_core.3.0.0.dylib
saliency: /usr/local/lib/libopencv_hal.a
saliency: /usr/local/share/OpenCV/3rdparty/lib/libippicv.a
saliency: CMakeFiles/saliency.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/cindywang/Documents/opencv/saliency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable saliency"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/saliency.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/saliency.dir/build: saliency

.PHONY : CMakeFiles/saliency.dir/build

CMakeFiles/saliency.dir/requires: CMakeFiles/saliency.dir/main.cpp.o.requires

.PHONY : CMakeFiles/saliency.dir/requires

CMakeFiles/saliency.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/saliency.dir/cmake_clean.cmake
.PHONY : CMakeFiles/saliency.dir/clean

CMakeFiles/saliency.dir/depend:
	cd /Users/cindywang/Documents/opencv/saliency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/cindywang/Documents/opencv/saliency /Users/cindywang/Documents/opencv/saliency /Users/cindywang/Documents/opencv/saliency /Users/cindywang/Documents/opencv/saliency /Users/cindywang/Documents/opencv/saliency/CMakeFiles/saliency.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/saliency.dir/depend

