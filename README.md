A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

## Run C
- `cmake .`
- `make` 

### CMakeLists.txt
```txt
    cmake_minimum_required(VERSION 3.25)
    project(native)
    add_executable(native src/native_add.cpp )

    set_target_properties(native PROPERTIES
        OUTPUT_NAME "native"
        XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
    )
```

### Example .cpp
- name: `native_add.cpp`
```cpp
#include <cstdint>

extern "C"
{
    int main()
    {
        return 0;
    }

    __attribute__((visibility("default"))) __attribute__((used)) 
    int add(int32_t value1, int32_t value2)
    {
        return value1 + value2;
    }
}
```

### Implement In Dart

```dart
import 'dart:ffi';
import 'package:path/path.dart' as path;
import 'dart:io' show Directory;

class OpenCV {
  // Dynamic lib
  static final DynamicLibrary _dylib = DynamicLibrary.open(libraryPath);

  /// Directory path
  static get libraryPath => path.join(
        Directory.current.path,
        'includes',
        'native',
      );

  /// Add method
  static final Function(int a, int b) add = _asFunc("add");

  static Function(int a, int b) _asFunc(String method) {
    final d = _dylib.lookup<NativeFunction<Int Function(Int32 v1, Int32 v2)>>;
    final dl = d(method);
    return dl.asFunction<int Function(int a, int b)>();
  }
}
```