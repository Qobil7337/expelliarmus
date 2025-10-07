import 'package:flutter/material.dart';
import 'src/pages/sign-in/sign-in.dart';
import 'src/pages/sign-up/sign-up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense tracker',
      debugShowCheckedModeBanner: false,
      initialRoute: '/sign-in',
      routes: {
        '/sign-in': (context) => const SignIn(),
        '/sign-up': (context) => const SignUp()
      },
    );
  }
}
