# xmanager

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Buinding
flutter build apk --no-shrink

installing
flutter install

flutter run --release

# Objectbox
When changing the models run this command
    flutter pub run build_runner build
if it doesnt work use this:
    flutter pub run build_runner build --delete-conflicting-outputs


# localization
 flutter gen-l10n
flutter clean

# cache
Open android studio Tools->Flutter->Clean.
Go to File -> Invalidate Caches / Restart.
Or open terminal run "flutter clean"
Remove pubspec.lock.


# build splash screen 
 dart run flutter_native_splash:create --path=flutter_native_splash.yaml
  