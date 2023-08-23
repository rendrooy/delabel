import 'package:delabel_v3/app/config/theme.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/config/constants.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  var box = GetStorage();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Safety Net provider
    // 3. Play Integrity provider
    androidProvider: AndroidProvider.debug,
    // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Device Check provider
    // 3. App Attest provider
    // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
    appleProvider: AppleProvider.appAttest,
  );

  await box.initStorage;
  // var userData = box.read(kUserData);

  runApp(
    GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        inputDecorationTheme: theme,
        scaffoldBackgroundColor: bgColor,
        // textTheme: GoogleFonts.interTextTheme(),
        canvasColor: secondaryColor,
      ),
      title: "Delabel",
      initialRoute: box.read(kUserData) != null
          ? Routes.MAIN_SCREEN
          : Routes.LOGIN_SCREEN,
      // AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
