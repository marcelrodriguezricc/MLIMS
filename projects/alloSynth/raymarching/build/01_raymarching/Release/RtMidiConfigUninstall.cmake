if(NOT EXISTS "/Users/marcel/Desktop/AlloLib/allolib_playground/allolib/build/Release/external/rtmidi/install_manifest.txt")
  message(FATAL_ERROR "Cannot find install manifest: \"/Users/marcel/Desktop/AlloLib/allolib_playground/allolib/build/Release/external/rtmidi/install_manifest.txt\"")
endif(NOT EXISTS "/Users/marcel/Desktop/AlloLib/allolib_playground/allolib/build/Release/external/rtmidi/install_manifest.txt")

file(READ "/Users/marcel/Desktop/AlloLib/allolib_playground/allolib/build/Release/external/rtmidi/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")
foreach(file ${files})
  message(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
  if(EXISTS "$ENV{DESTDIR}${file}")
    exec_program(
      "/opt/homebrew/Cellar/cmake/3.28.1/bin/cmake" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
      OUTPUT_VARIABLE rm_out
      RETURN_VALUE rm_retval
      )
    if(NOT "${rm_retval}" STREQUAL 0)
      message(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
    endif(NOT "${rm_retval}" STREQUAL 0)
  else(EXISTS "$ENV{DESTDIR}${file}")
    message(STATUS "File \"$ENV{DESTDIR}${file}\" does not exist.")
  endif(EXISTS "$ENV{DESTDIR}${file}")
endforeach(file)
