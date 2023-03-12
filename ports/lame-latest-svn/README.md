# lame-latest-svn port

This is a port of the [LAME](https://lame.sourceforge.io/) library. Since some
years, the LAME library hasn't seen a new release, but there are several
commits in the SVN repository since the last version. This port provides a
Windows only build of the library based on the Visual C++ 2019 project files
found in the SVN repository.

As the port downloads the tarball of the latest revision, it may be that
SourceForge doesn't have that tarball cached anymore. You have to pre-generate
the tarball by visiting this URL:

    https://sourceforge.net/p/lame/svn/HEAD/tarball?path=

When building for dynamic linking, first the static library is built, since
the DLL just links to the static library project. To not confuse vcpkg what
the correct `.lib` file is, the static `.lib` files are removed in this case.

The following vcpkg triplets are supported:
- x86-windows
- x86-windows-static
- x86-windows-static-md
- x64-windows
- x64-windows-static
- x64-windows-static-md
