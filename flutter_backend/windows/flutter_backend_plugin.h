#ifndef FLUTTER_PLUGIN_FLUTTER_BACKEND_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_BACKEND_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_backend {

class FlutterBackendPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterBackendPlugin();

  virtual ~FlutterBackendPlugin();

  // Disallow copy and assign.
  FlutterBackendPlugin(const FlutterBackendPlugin&) = delete;
  FlutterBackendPlugin& operator=(const FlutterBackendPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_backend

#endif  // FLUTTER_PLUGIN_FLUTTER_BACKEND_PLUGIN_H_
