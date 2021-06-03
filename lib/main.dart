import 'package:buy_now/app/core/utils/dependency_injection.dart';
import 'package:buy_now/app/modules/home/home_binding.dart';
import 'package:buy_now/app/modules/home/home_page.dart';
import 'package:buy_now/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  DependencyInjection.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Compras pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}

