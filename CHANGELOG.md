## 0.8.1
- build(android): stop unconditionally applying the Kotlin Gradle Plugin. `kotlin-android` is now applied only when the consuming app's AGP major version is below 9; on AGP 9 and later, AGP's built-in Kotlin applies it and a second application fails the build. `android.kotlinOptions` is replaced by a `kotlin { compilerOptions { … } }` block scoped to the same legacy branch, because AGP 9 derives the Kotlin jvmTarget from `android.compileOptions` and registers no top-level `kotlin { }` extension at that point.
  **Consumers on AGP 9 can now drop the `android.builtInKotlin=false` and `android.newDsl=false` opt-outs** that Flutter's migrator added to `android/gradle.properties`. Consumers still on AGP 8 need no changes — that path is unaffected.
  Verified both ways: AGP 8.7.3 / Gradle 8.9 builds as before, and AGP 9.0.1 / Gradle 9.6.1 / Kotlin 2.3.20 with `android.builtInKotlin=true` now produces a real `:iterable_flutter:compileDebugKotlin` task and a compiled `IterableFlutterPlugin` class. See https://docs.flutter.dev/release/breaking-changes/migrate-to-built-in-kotlin
- build(example): apply the same conditional to the example app so it builds on either side of the AGP 9 boundary.
- chore: repository renamed `iterable-flutter` → `iterable_flutter`, so the repository name matches the Dart package name. Consumers should update `git: url:` to `https://github.com/SpringCare/iterable_flutter.git`; the old URL continues to redirect, so this is hygiene rather than a breaking change.
- chore: default branch renamed `master` → `main`.
- docs: **correct the SPM note under 0.8.0** — the repository name was never an SPM prerequisite. Flutter's generated `FlutterGeneratedPluginSwiftPackage/Package.swift` declares the dependency as `.package(name: "iterable_flutter", path: …)`, and SPM at swift-tools-version 5.9 honours that explicit name regardless of the directory basename. Confirmed two ways: an isolated `swift build` where the basename and package name deliberately differ, and Cherubi's own iOS CI passing with SPM enabled while still on the old hyphenated URL. Note pub does derive its cache directory name from the URL as written (`iterable-flutter-<sha>` vs `iterable_flutter-<sha>`) — that part is real, it just has no bearing on SPM resolution.

## 0.8.0
- feat: add Swift Package Manager support alongside CocoaPods. (An earlier note here stated that the repository had to be renamed to `iterable_flutter` for SPM identity resolution to work. That was incorrect — see the correction under 0.8.1.)
- chore: bump Iterable iOS SDK 6.6.4 → 6.7.3 and Iterable Android SDK 3.6.3 → 3.9.0
- refactor: restructure iOS sources to the SPM layout as a Swift-only target (dropped the Objective-C forwarding shim)
- build: modernise the example app for Flutter 3.44 (Gradle 8.9 / AGP 8.7.3; replaced abandoned flutter_config with flutter_dotenv)

## 0.5.9
- Update README with no longer maintaining message

## 0.5.8
- feat(Track): allow data fields params for track #61

## 0.5.7
- build(Dependencies): update iterable android and iOS dependencies #57

## 0.5.6
### Fix
- fix(UpdateUser): waiting for user update never ends on Android #54

## 0.5.5
### Fix
- fix(PayLoad Push): IOS SDK sends the push payload encoded sometimes.

## 0.5.4
### Features
- feat(Data Push): have a single delivery format of the push notification metadata. 🧾 #47.
- feat(Library Pubspec): add pubspec to the ignore file by recommendation #43
### Fix
- Fix Crash on API 31+ #46.
- fix(Open Push IOS): could not read push data when app was closed. #45
- fix(Last Push Payload): when you open the app, reload the latest data from the push notification #42
### Other work
- ci(Android): fix ci builds for android #44

## 0.3.0+1
Added to update pubspec info.

## 0.3.0
- Implement signOut on iOS (thanks to @Gabriel-Azevedo: https://github.com/la-haus/iterable-flutter/pull/37

## 0.1.1
- Add updateUser support and registerForPush in iOS

## 0.1.0
Initial release
