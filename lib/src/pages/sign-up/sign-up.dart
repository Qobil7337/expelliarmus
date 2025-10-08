import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // For now, just print them
      print('Name: $name');
      print('Email: $email');
      print('Password: $password');

      // TODO: perform sign-up API call or navigation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: Text(
                  'Xush kelibsiz',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                'Xarajatlaringizni osonlik bilan kuzating va pul sarflash odatlaringizni yaxshiroq tushuning',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: 60),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: "Ism",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(245, 240, 240, 1.0),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 12.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(245, 240, 240, 1.0),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 12.0,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email kiriting';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Yaroqli email kiriting';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Parol',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(245, 240, 240, 1.0),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 12.0,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Parol kiriting';
                        }
                        if (value.length < 6) {
                          return 'Parol kamida 6 ta belgidan iborat bo‘lishi kerak';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: _submit,
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEB2933),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Ro'yhatdan o'tish",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Kirish',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
