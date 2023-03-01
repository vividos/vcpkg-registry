vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vividos/UlibCpp
    REF version-4.4.0
    SHA512 8ebf70c834b9e878c6534f30a3f7a10d24dafff23f2cd8e49e38b17027137d739725a1fe1e1905076213902e9e640082d5ff6ea4981dbda2bb45d781d2861f5e
    PATCHES
        remove-nuget-restore-check.patch
        replace-solutiondir-in-props.patch
        runtime-library-property.patch
)

if(VCPKG_CRT_LINKAGE STREQUAL "static")
    set(RuntimeLibraryExt "")
else()
    set(RuntimeLibraryExt "DLL")
endif()

file(REMOVE ${SOURCE_PATH}/src/nupkg/nuget.exe)

vcpkg_install_msbuild(
    SOURCE_PATH ${SOURCE_PATH}
    PROJECT_SUBPATH src/ulib/ulib.vcxproj
    INCLUDES_SUBPATH src/include
    LICENSE_SUBPATH LICENSE.md
    USE_VCPKG_INTEGRATION
    OPTIONS_DEBUG "/p:RuntimeLibrary=MultiThreadedDebug${RuntimeLibraryExt}"
    OPTIONS_RELEASE "/p:RuntimeLibrary=MultiThreaded${RuntimeLibraryExt}"
)
