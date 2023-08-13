import 'package:delabel_v3/app/config/theme.dart';
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
      title: "Application",
      initialRoute: box.read(kUserData) != null
          ? Routes.MAIN_SCREEN
          : Routes.LOGIN_SCREEN,
      // AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
