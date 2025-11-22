# vividos-ulibcpp port

This is a port of the [UlibCpp](https://github.com/vividos/UlibCpp) library.

The C++ `.vcxproj` project itself uses vcpkg in Manifest mode.

The advantage of using UlibCpp using vcpkg is that the user can choose which
C runtime (static vs. dynamic) is used for the library, by setting
`VCPKG_CRT_LINKAGE`. The NuGet package only provides dynamic C runtime
linkage.
