import 'package:e_commerce_application_full/admin_screens/addproduct.dart';
import 'package:e_commerce_application_full/screens/Mainscree.dart';
import 'package:e_commerce_application_full/screens/products/products_detials.dart';
import 'package:e_commerce_application_full/screens/products/productspage.dart';
import 'package:e_commerce_application_full/utils/custom_colors.dart';
import 'package:e_commerce_application_full/homepage.dart';
import 'package:e_commerce_application_full/loginpage.dart';
import 'package:e_commerce_application_full/splashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: primarycolor, fontFamily: "Students"),
      home: MainPage(),
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LogInPage.id: (context) => LogInPage(),
        ProfileInitPage.id: (context) => ProfileInitPage(),
        MainPage.id: (context) => MainPage(),
        AddProductPage.id: (context) => AddProductPage(),
        ProductPage.id: (context) => ProductPage(),
        ProductDetailPage.id: (context) => ProductDetailPage(),
      },
    );
  }
}
