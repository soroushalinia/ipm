import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      backgroundColor: Colors.blue[50],
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text("برنامه ریزی"),
        ),
        ListTile(
          title: const Text('اپراتور ها'),
          leading: const Icon(
            Icons.account_circle_rounded,
          ),
          onTap: () {
            Get.toNamed('/operator');
          },
        ),
      ],
    );
  }
}
