import 'package:deliverylaundry/Halaman_Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(splashview());
}

class splashview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurple,
        colorScheme: ColorScheme.light(primary: Colors.deepPurple),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      ),
      home: SplashScreenView(
        navigateRoute: loginview(),
        duration: 6000,
        imageSize: 300,
        imageSrc: "file/logo.png",
        text: "DELIVERY LAUNDRY",
        textType: TextType.TyperAnimatedText,
        textStyle: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
        ),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}


