import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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

                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Text(
                  'Xarajatlaringizni osonlik bilan kuzating va pul sarflash odatlaringizni yaxshiroq tushuning',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 60),
              Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Email',
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color.fromRGBO(245, 240, 240, 1.0),
                              contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Parol',
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color.fromRGBO(245, 240, 240, 1.0),
                              contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0)
                          ),
                        ),
                      )
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEB2933),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Kirish',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
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
                    text: 'Hisobingiz yo‘qmi? ',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black
                    ),
                    children: [
                      TextSpan(
                        text: 'Ro‘yxatdan o‘ting',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/login');
                          }
                      )
                    ]
                  ),
                ),
              ),
            ],
          )
      )
    );
  }
}
