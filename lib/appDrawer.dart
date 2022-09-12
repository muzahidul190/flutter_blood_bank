import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Navigate to...'),
            automaticallyImplyLeading: false,
          ),
          const ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
          )
        ],
      ),
    );
  }
}
