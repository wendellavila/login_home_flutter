import 'package:flutter/material.dart';
import 'package:login_home/ui/screens/home.dart';
import 'package:login_home/ui/screens/login.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu(
      {required this.username, this.isCurrentScreenHome = false, super.key});

  final bool isCurrentScreenHome;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: Text(
                username.toUpperCase(),
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ))
            ]),
          ),
          if (!isCurrentScreenHome)
            ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              minLeadingWidth: 10,
              title: const Text("Início"),
              visualDensity: VisualDensity.compact,
              onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                ModalRoute.withName('/'),
              ),
            ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            minLeadingWidth: 10,
            title: const Text("Sair"),
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              ModalRoute.withName('/'),
            ),
          ),
        ],
      ),
    );
  }
}
