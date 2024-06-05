import 'package:flutter/material.dart';
import 'package:login_home/ui/screens/login/login.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Login",
        theme: ThemeData(
          useMaterial3: false,
          fontFamily: 'Lato',
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0XFFA0BF7F),
            onPrimary: Color(0XFF1d1b19),
            secondary: Color(0XFFDDC9BF),
            onSecondary: Color(0XFF1d1b19),
            tertiary: Color(0XFF9A7B6B),
            onTertiary: Color(0XFFffffff),
            surface: Color(0XFFDDC9BF),
            onSurface: Color(0XFF1d1b19),
            error: Color(0XFFff9090),
            onError: Color(0XFFC6504E),
          ),
          scaffoldBackgroundColor: const Color(0XFFfcf5ef),
        ),
        home: const LoginPage());
  }
}
