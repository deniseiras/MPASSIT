# FindPackage.cmake

# Define the CMake function to find packages installed by Spack
function(find_spack_package PACKAGE_NAME_MASK)
    # Set the Spack installation directory
    set(SPACK_INSTALL_DIR "/mnt/beegfs/monan/MPASSIT_spack")

    # Set the spack prefix directory where packages are installed
    set(PREFIX_DIR "${SPACK_INSTALL_DIR}/spack_mpassit/opt/spack/linux-rhel8-zen2/intel-2021.4.0")

    # Initialize list to store found package directories
    set(PACKAGE_FOUND_DIRS)

    # List all directories in the prefix directory
    file(GLOB PACKAGE_DIRS "${PREFIX_DIR}/*")
    
    # Iterate over each directory
    foreach(PACKAGE_DIR ${PACKAGE_DIRS})
        # message("Searching in =========== ${PACKAGE_DIR}")
        # Check if the directory name matches the package name mask
        if(IS_DIRECTORY "${PACKAGE_DIR}" AND "${PACKAGE_DIR}" MATCHES "${PACKAGE_NAME_MASK}*")
            # Add the directory to the list of found package directories
            list(APPEND PACKAGE_FOUND_DIRS ${PACKAGE_DIR})
	    # message("Found =========== ${PACKAGE_DIR}")
        endif()
    endforeach()

    # Return the list of found package directories
    set(${PACKAGE_NAME_MASK}_DIRS ${PACKAGE_FOUND_DIRS} PARENT_SCOPE)
endfunction()

