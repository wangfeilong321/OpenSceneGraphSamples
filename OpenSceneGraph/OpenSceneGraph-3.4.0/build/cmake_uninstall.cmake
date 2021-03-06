IF(NOT EXISTS "E:/Workspace/OpenSceneGraph-Samples/OpenSceneGraph/OpenSceneGraph-3.4.0/build/install_manifest.txt")
    MESSAGE(FATAL_ERROR "Cannot find install manifest: \"E:/Workspace/OpenSceneGraph-Samples/OpenSceneGraph/OpenSceneGraph-3.4.0/build/install_manifest.txt\"")
ENDIF()

FILE(READ "E:/Workspace/OpenSceneGraph-Samples/OpenSceneGraph/OpenSceneGraph-3.4.0/build/install_manifest.txt" files)
STRING(REGEX REPLACE "\n" ";" files "${files}")

FOREACH(file ${files})
    MESSAGE(STATUS "Uninstalling \"${file}\"")
    IF(EXISTS "${file}")
        EXEC_PROGRAM(
            "D:/Program Files (x86)/CMake/bin/cmake.exe" ARGS "-E remove \"${file}\""
            OUTPUT_VARIABLE rm_out
            RETURN_VALUE rm_retval
            )
        IF(NOT "${rm_retval}" STREQUAL 0)
            MESSAGE(FATAL_ERROR "Problem when removing \"${file}\"")
        ENDIF()
    ELSEIF(IS_SYMLINK "${file}")
        EXEC_PROGRAM(
            "D:/Program Files (x86)/CMake/bin/cmake.exe" ARGS "-E remove \"${file}\""
            OUTPUT_VARIABLE rm_out
            RETURN_VALUE rm_retval
            )
        IF(NOT "${rm_retval}" STREQUAL 0)
            MESSAGE(FATAL_ERROR "Problem when removing \"${file}\"")
        ENDIF()
    ELSE()
        MESSAGE(STATUS "File \"${file}\" does not exist.")
    ENDIF()
ENDFOREACH()
