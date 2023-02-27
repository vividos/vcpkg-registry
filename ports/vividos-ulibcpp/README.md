# vividos-ulibcpp port

This is a port of the [UlibCpp](https://github.com/vividos/UlibCpp) library.

The port has some specialities:
- The C++ `.vcxproj` project itself uses vcpkg in Manifest mode
- Its `.props` file uses `$(SolutionDir)`, but we're building the `.vcxproj`
  file alone, so a patch is necessary to remove that variable
- It uses some NuGet packages for SourceLink; the check for that packages also
  has to be disabled for the vcpkg build to succeed

The advantage of using UlibCpp using vcpkg is that the user can choose which
C runtime (static vs. dynamic) is used for the library, by setting
`VCPKG_CRT_LINKAGE`. The NuGet package only provides dynamic C runtime
linkage.
