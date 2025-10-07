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
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color(0xFFE0E0E0)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Parol',
                              border: OutlineInputBorder()
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
                child: Text(
                  'Hisobingiz yo‘qmi? Ro‘yxatdan o‘ting',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          )
      )
    );
  }
}
