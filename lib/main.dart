import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyD-MXw_uxlUUrif2X-X-7DYCY5cyj0KSAI",
        appId: "1:510565907569:android:bc60483c9b7915371d2fd0",
        messagingSenderId: "510565907569",
        projectId: "fir-food-app-478b6"),
  );
  await GetStorage.init();
  tz.initializeTimeZones();
  runApp(
    ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          fontFamily: "Poppins",
        ),
      ),
    ),
  );
}
