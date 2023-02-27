# vividos' custom vcpkg registry

This is my custom vcpkg registry for ports not suitable for the
[official vcpkg registry](https://github.com/microsoft/vcpkg).

The following custom ports are available:

- [vividos-ulibcpp](ports/vividos-ulibcpp/README.md) The [UlibCpp](https://github.com/vividos/UlibCpp) library

## Usage

Add a new `vcpkg-configuration.json` file to your project's root directory:

```json
{
    "registries": [
        {
            "kind": "git",
            "repository": "https://github.com/vividos/vcpkg-registry.git",
            "packages": [ "list the packages that you want to use from this registry here" ]
            "baseline": /* hash of the latest commit to this repository */
        }
    ]
}
```

After that, you can use the libraries in your `vcpkg.json` manifest file.

## License

This repository is licensed using the [MIT License](License.md). The libraries
from the ports may be licensed using different licenses.
