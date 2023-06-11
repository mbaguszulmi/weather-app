import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_backend_method_channel.dart';

abstract class FlutterBackendPlatform extends PlatformInterface {
  /// Constructs a FlutterBackendPlatform.
  FlutterBackendPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterBackendPlatform _instance = MethodChannelFlutterBackend();

  /// The default instance of [FlutterBackendPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterBackend].
  static FlutterBackendPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterBackendPlatform] when
  /// they register themselves.
  static set instance(FlutterBackendPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
