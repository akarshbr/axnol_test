import 'package:clean_code_demo/presentation/login_screen/controller/login_controller.dart';
import 'package:clean_code_demo/presentation/login_screen/view/login_screen.dart';
import 'package:clean_code_demo/presentation/profile_screen/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => ProfileController()),
      ],
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
