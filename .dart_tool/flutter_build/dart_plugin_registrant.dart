//
// Generated file. Do not edit.
// This file is generated from template in file `flutter_tools/lib/src/flutter_plugins.dart`.
//

// @dart = 2.17

import 'dart:io'; // flutter_ignore: dart_io_import.
import 'package:geolocator_android/geolocator_android.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:image_picker_ios/image_picker_ios.dart';
import 'package:path_provider_ios/path_provider_ios.dart';
import 'package:package_info_plus_linux/package_info_plus_linux.dart';
import 'package:path_provider_linux/path_provider_linux.dart';
import 'package:path_provider_macos/path_provider_macos.dart';
import 'package:package_info_plus_windows/package_info_plus_windows.dart';
import 'package:path_provider_windows/path_provider_windows.dart';

@pragma('vm:entry-point')
class _PluginRegistrant {

  @pragma('vm:entry-point')
  static void register() {
    if (Platform.isAndroid) {
      try {
        GeolocatorAndroid.registerWith();
      } catch (err) {
        print(
          '`geolocator_android` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
        rethrow;
      }

      try {
        PathProviderAndroid.registerWith();
      } catch (err) {
        print(
          '`path_provider_android` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
        rethrow;
      }

    } else if (Platform.isIOS) {
      try {
        GeolocatorApple.registerWith();
      } catch (err) {
        print(
          '`geolocator_apple` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
        rethrow;
      }

      try {
        ImagePickerIOS.registerWith();
      } catch (err) {
        print(
          '`image_picker_ios` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
        rethrow;
      }

      try {
        PathProviderIOS.registerWith();
      } catch (err) {
        print(
          '`path_provider_ios` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
        rethrow;
      }

    } else if (Platform.isLinux) {
      try {
        PackageInfoLinux.registerWith();
      } catch (err) {
        print(
          '`package_info_plus_linux` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
        rethrow;
      }

      try {
        PathProviderLinux.registerWith();
      } catch (err) {
        print(
          '`path_provider_linux` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
        rethrow;
      }

    } else if (Platform.isMacOS) {
      try {
        PathProviderMacOS.registerWith();
      } catch (err) {
        print(
          '`path_provider_macos` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
        rethrow;
      }

    } else if (Platform.isWindows) {
      try {
        PackageInfoWindows.registerWith();
      } catch (err) {
        print(
          '`package_info_plus_windows` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
        rethrow;
      }

      try {
        PathProviderWindows.registerWith();
      } catch (err) {
        print(
          '`path_provider_windows` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
        rethrow;
      }

    }
  }
}