import 'package:flutter/material.dart';
import 'package:vega/View/Pages/ProfilePage/Widgets/icons_widget.dart';

import '../../../Utils/AppTxetStyle/text_style.dart';

class ProfileTabPage extends StatelessWidget {
  const ProfileTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/image/man_phone.png'),
              ),
              const SizedBox(height: 10),
              const Text(
                'Shivam Patel',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Hi there! I\'m a passionate Flutter Developer with a love for Hybrid app development.\n I enjoy online gamming in my free time. Feel free to connect with me!',
                  textAlign: TextAlign.start,
                  style: AppTextStyle.offerDescription,
                ),
              ),
              const SizedBox(height: 20),
              const ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('sp5036018@email.com'),
              ),
              const ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                subtitle: Text('+91 6386342084'),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  IconLink(
                      icon: Icons.whatshot,
                      link: 'https://github.com/ShaimPatel/GoDriver'),
                  IconLink(
                      icon: Icons.link, link: 'https://www.linkedin.com/feed/'),
                  IconLink(
                      icon: Icons.telegram, link: 'https://web.telegram.org/'),
                  IconLink(
                      icon: Icons.email,
                      link: 'https://mail.google.com/mail/u/0/'),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
