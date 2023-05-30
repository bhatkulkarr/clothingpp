import 'package:clothingapp/constants/colors.dart';
import 'package:clothingapp/screens/auth/login_screen.dart';
import 'package:clothingapp/screens/auth/user_registartion_screen.dart';
import 'package:clothingapp/screens/shop/navigations/cart_screen.dart';
import 'package:clothingapp/screens/shop/navigations/category_screen.dart';
import 'package:clothingapp/screens/shop/navigations/home_screen.dart';
import 'package:clothingapp/screens/shop/navigations/profile_screen.dart';
import 'package:clothingapp/screens/shop/product/product_listview_screen.dart';
import 'package:clothingapp/screens/shop/user_screen.dart';
import 'package:clothingapp/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryColor),
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: CustomColors.primaryColor
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/registerscreen' : (context) => const UserRegistrationScreen(),
        '/userscreen': (context) => const UserScreen(),
        '/homescreen' : (context) => const HomeScreen(),
        '/category' : (context) => const CategoryScreen(),
        '/cart' : (context) => const CartScreen(),
        '/profile' : (context) => const ProfileScreen(),
      },
    );
  }
}
