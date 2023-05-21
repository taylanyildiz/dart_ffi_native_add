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
