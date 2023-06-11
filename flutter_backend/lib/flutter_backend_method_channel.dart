import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_backend_platform_interface.dart';

/// An implementation of [FlutterBackendPlatform] that uses method channels.
class MethodChannelFlutterBackend extends FlutterBackendPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_backend');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
