import 'package:flutter/material.dart';
import 'package:login_home/ui/screens/home/home_body.dart';
import 'package:login_home/ui/widgets/appbar.dart';
import 'package:login_home/ui/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Map> _itemInfo;

  List<Map> _populateItemInfo() {
    final List<Map> itemInfo = [];
    for (int i = 1; i < 7; i++) {
      itemInfo.add(
        {
          "title": "Título",
          "description": "Descrição",
          "image": "assets/img/photo/photo1-1x1.jpg",
        },
      );
    }
    return itemInfo;
  }

  @override
  Widget build(BuildContext context) {
    _itemInfo = _populateItemInfo();
    return Scaffold(
      appBar: const TopBar(title: "HOME"),
      drawer: const DrawerMenu(
        username: "USERNAME",
        isCurrentScreenHome: true,
      ),
      drawerScrimColor: Theme.of(context).colorScheme.onPrimary,
      body: HomeBody(context: context, itemInfo: _itemInfo),
    );
  }
}
