import 'package:assignment1_mobile_application/Login_SignUp_Screens/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const ListTile(
            leading: CircleAvatar(
              radius: 34,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            title: Text(
              "John",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            subtitle: Text('Profile'),
          ),
          const Divider(height: 50),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.person,
                color: Colors.blue,
                size: 30,
              ),
            ),
            title: const Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notification_add_outlined,
                color: Colors.deepPurpleAccent,
                size: 30,
              ),
            ),
            title: const Text(
              "Notification",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.privacy_tip_outlined,
                color: Colors.indigo,
                size: 30,
              ),
            ),
            title: const Text(
              "Privacy",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.settings,
                color: Colors.green,
                size: 30,
              ),
            ),
            title: const Text(
              "General",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),
          const SizedBox(height: 20),


          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.info_outline,
                color: Colors.deepOrangeAccent,
                size: 30,
              ),
            ),
            title: const Text(
              "About Us",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),
          const SizedBox(height: 20),


          ListTile(
            onTap: () {
              // Log out and navigate to the login page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomePage()),
              );
            },
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.logout,
                color: Colors.red,
                size: 30,
              ),
            ),
            title: const Text(
              "Log Out",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
