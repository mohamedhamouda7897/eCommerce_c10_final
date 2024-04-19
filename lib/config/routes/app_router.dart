import 'package:e_commerce_c10_monday/core/components/reuseable_components.dart';
import 'package:e_commerce_c10_monday/features/cart/presentation/pages/cart_screen.dart';
import 'package:e_commerce_c10_monday/features/home/presentation/pages/home.dart';
import 'package:e_commerce_c10_monday/features/login/presentation/pages/login.dart';
import 'package:e_commerce_c10_monday/features/signUp/presentation/pages/signup.dart';
import 'package:flutter/material.dart';

class AppRoutesName {
  static const String login = "/";
  static const String signUp = "signUp";
  static const String home = "home";
  static const String cart = "cart";
}

class AppRoute {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case AppRoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case AppRoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        ); case AppRoutesName.cart:
        return MaterialPageRoute(
          builder: (context) => CartScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }
}
