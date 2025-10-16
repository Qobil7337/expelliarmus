import 'package:expense_tracker/src/components/profile-card/profile-card.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
              child: Text(
                  'Profil',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              )),
        ),
        Row(
          children: [
            ProfileCard(imageUrl: 'https://avatar.iran.liara.run/public/boy?username=Ash', name: 'Kobil')
            // Name
          ],
        )
      ],
    );
  }
}
