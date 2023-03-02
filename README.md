# vividos' custom vcpkg registry

This is my custom vcpkg registry for ports not suitable for the
[official vcpkg registry](https://github.com/microsoft/vcpkg).

The following custom ports are available:

- [vividos-ulibcpp](ports/vividos-ulibcpp/README.md):
  The [UlibCpp](https://github.com/vividos/UlibCpp) library

- [lame-latest-svn](ports/lame-latest-svn/README.md):
  [LAME](https://lame.sourceforge.io/) library with latest changes from SVN

## Usage

Add a new `vcpkg-configuration.json` file to your project's root directory:

```json
{
    "default-registry": /* specify a default registry here */
    "registries": [
        {
            "kind": "git",
            "repository": "https://github.com/vividos/vcpkg-registry.git",
            "packages": [ "list the packages that you want to use from this registry here" ],
            "baseline": /* hash of the latest commit to this repository */
        }
    ]
}
```

After that, you can use the libraries in your `vcpkg.json` manifest file. See
also here: [Use Registries](https://learn.microsoft.com/en-us/vcpkg/users/registries).

## Maintenance

Here's a little checklist on how to update a port `xx` in a custom vcpkg
registry:

1. Update port `xx` files
2. Test using `.\vcpkg install xx --overlay-ports=path\to\vcpkg-registry\ports\xx`
3. Commit changes
4. Run `git rev-parse HEAD:ports/xx`
5. Update git-tree object id in `versions/x-/xx.json`
6. Update version number in `baseline.json`

## License

This repository is licensed using the [MIT License](License.md). The libraries
from the ports may be licensed using different licenses.
