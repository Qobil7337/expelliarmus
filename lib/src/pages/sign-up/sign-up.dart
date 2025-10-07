import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                                hintText: "To'liq ism",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(12.0))
                                ),
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
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(12.0))
                                ),
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
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(12.0))
                                ),
                                filled: true,
                                fillColor: Color.fromRGBO(245, 240, 240, 1.0),
                                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0)
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
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
                          "Ro'yhatdan o'tish",
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
                        children: [
                          TextSpan(
                              text: 'Kirish',
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
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
