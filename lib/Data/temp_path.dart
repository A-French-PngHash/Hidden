import 'package:path_provider/path_provider.dart';

String? _tempPath;

Future<String> get tempPath async {
  if (_tempPath == null) {
    final String dir = (await getTemporaryDirectory()).path;
    _tempPath = '$dir/hiddentemp.png';
  }
  return _tempPath!;
}
