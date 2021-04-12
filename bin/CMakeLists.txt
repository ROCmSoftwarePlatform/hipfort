
cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
if ("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_CURRENT_SOURCE_DIR}")
  project(hipfort-tools)
endif()

# ensure mymcpu utility and Makefile.hipfort are available in build directory 
add_custom_command( OUTPUT bindir
   COMMAND /bin/mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/../bin
   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/gputable.txt)
add_custom_command( OUTPUT gputable.txt
   COMMAND /bin/cp -p ${CMAKE_CURRENT_SOURCE_DIR}/gputable.txt ${CMAKE_CURRENT_BINARY_DIR}/../bin/gputable.txt
   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/gputable.txt bindir)

string(REGEX REPLACE "[/]" "\\\\/" escaped_path ${HIPFORT_COMPILER})
set(sed_str s/gfortran/${escaped_path}/g)
string(REGEX REPLACE "[/]" "\\\\/" installed_path ${HIPFORT_INSTALL_DIR})
set(sed_str2 s/_HIPFORT_INSTALL_DIR_/${installed_path}/g)

add_custom_command( OUTPUT Makefile.hipfort
   COMMAND /bin/cp -p ${CMAKE_CURRENT_SOURCE_DIR}/Makefile.hipfort ${CMAKE_CURRENT_BINARY_DIR}/../bin/Makefile.hipfort.needs_edit
   COMMAND /bin/sed -e '${sed_str}' ${CMAKE_CURRENT_BINARY_DIR}/../bin/Makefile.hipfort.needs_edit > Makefile.hipfort
   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/Makefile.hipfort bindir)

add_custom_command( OUTPUT mymcpu
   COMMAND /bin/cp -p ${CMAKE_CURRENT_SOURCE_DIR}/mymcpu ${CMAKE_CURRENT_BINARY_DIR}/../bin/mymcpu.needs_edit
   COMMAND /bin/sed -e "s/X\\.Y\\-Z/${HIPFORT_VERSION}/g" ${CMAKE_CURRENT_BINARY_DIR}/../bin/mymcpu.needs_edit >mymcpu
   COMMAND /bin/chmod  755  ${CMAKE_CURRENT_BINARY_DIR}/../bin/mymcpu
   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/mymcpu bindir)

# The myarchgpu symbolic link is needed for test targets before installation
add_custom_command( OUTPUT myarchgpu
   COMMAND /bin/ln -sf mymcpu ${CMAKE_CURRENT_BINARY_DIR}/../bin/myarchgpu
   DEPENDS mymcpu)

add_custom_command( OUTPUT hipfc
   COMMAND /bin/cp -p ${CMAKE_CURRENT_SOURCE_DIR}/hipfc ${CMAKE_CURRENT_BINARY_DIR}/../bin/hipfc.needs_edit
   COMMAND /bin/sed -i -e '${sed_str}' ${CMAKE_CURRENT_BINARY_DIR}/../bin/hipfc.needs_edit
   COMMAND /bin/sed -i -e "s/X\\.Y\\-Z/${HIPFORT_VERSION}/g" ${CMAKE_CURRENT_BINARY_DIR}/../bin/hipfc.needs_edit
   COMMAND /bin/sed -e '${sed_str2}' ${CMAKE_CURRENT_BINARY_DIR}/../bin/hipfc.needs_edit > hipfc
   COMMAND /bin/chmod 755 hipfc
   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/hipfc bindir)

add_custom_target(util_scripts ALL DEPENDS bindir gputable.txt Makefile.hipfort hipfc mymcpu myarchgpu)

install(PROGRAMS
   # The first two are symlinks
   ${CMAKE_CURRENT_SOURCE_DIR}/mygpu
   ${CMAKE_CURRENT_SOURCE_DIR}/myarchgpu
   # These two have their version string edited
   ${CMAKE_CURRENT_BINARY_DIR}/../bin/hipfc
   ${CMAKE_CURRENT_BINARY_DIR}/../bin/mymcpu
   DESTINATION bin
)

install(FILES
   ${CMAKE_CURRENT_SOURCE_DIR}/gputable.txt
   ${CMAKE_CURRENT_BINARY_DIR}/../bin/Makefile.hipfort
   DESTINATION bin)
