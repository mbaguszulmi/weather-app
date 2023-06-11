#include "include/flutter_backend/flutter_backend_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_backend_plugin.h"

void FlutterBackendPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_backend::FlutterBackendPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
