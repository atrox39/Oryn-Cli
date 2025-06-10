import 'package:pub_api_client/pub_api_client.dart';

/// This is Lucifer version, not Oryn version
final pubClient = PubClient();

class OrynVersion {
  String? _version;
  String? _cliVersion;

  get version async {
    if (_version == null) {
      final res = await pubClient.packageInfo('oryn');
      _version = res.version;
    }
    return _version;
  }
  get cliVersion async {
    if (_cliVersion == null) {
      final res = await pubClient.packageInfo('oryn_cli');
      _cliVersion = res.version;
    }
    return _cliVersion;
  }
}
