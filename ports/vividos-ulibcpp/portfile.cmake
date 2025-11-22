vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vividos/UlibCpp
    REF version-5.0.0
    SHA512 3a41afdd80e9fe4f21b7605292d2b078acb58c59826bc0ec5693dc02dd34f7d92b646038460a55e4936e1f1e286e44cb488d968fe7f39062f277456a11cfe438
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
    OPTIONS "/p:DisableNuGetPackageCheck=true"
    OPTIONS_DEBUG "/p:RuntimeLibrary=MultiThreadedDebug${RuntimeLibraryExt}"
    OPTIONS_RELEASE "/p:RuntimeLibrary=MultiThreaded${RuntimeLibraryExt}"
)
