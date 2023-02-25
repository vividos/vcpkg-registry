vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vividos/UlibCpp
    REF version-4.4.0
    SHA512 8ebf70c834b9e878c6534f30a3f7a10d24dafff23f2cd8e49e38b17027137d739725a1fe1e1905076213902e9e640082d5ff6ea4981dbda2bb45d781d2861f5e
    PATCHES remove-nuget-restore-check.patch
)

vcpkg_install_msbuild(
    SOURCE_PATH ${SOURCE_PATH}/src
    PROJECT_SUBPATH ulib/ulib.vcxproj
    INCLUDES_SUBPATH include/ulib
    OPTIONS
        "/p:SolutionDir=${SOURCE_PATH}/src/"
)

file(INSTALL "${SOURCE_PATH}/LICENSE.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/vividos-ulibcpp" RENAME copyright)
