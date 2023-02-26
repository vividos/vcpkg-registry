vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

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
    OPTIONS
        "/p:SolutionDir=${SOURCE_PATH}/src/"
)

vcpkg_copy_pdbs()

file(
    COPY "${SOURCE_PATH}/src/include/ulib"
    DESTINATION "${CURRENT_PACKAGES_DIR}/include/"
    FILES_MATCHING PATTERN "*.hpp"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")
