import 'package:flutter/material.dart';
import 'package:login_home/ui/screens/item/portrait_item_body.dart';
import 'package:login_home/ui/widgets/appbar.dart';

import 'landscape_item_body.dart';

class HomeItemPage extends StatefulWidget {
  const HomeItemPage({super.key});

  @override
  State<HomeItemPage> createState() => _HomeItemPage();
}

class _HomeItemPage extends State<HomeItemPage> {
  Widget _itemBody({required String assetName, required Widget child}) {
    return OrientationBuilder(
      builder: ((context, orientation) {
        if (orientation == Orientation.portrait) {
          return PortraitItemBody(context: context, assetName: assetName, child: child);
        } else {
          return LandscapeItemBody(context: context, assetName: assetName, child: child);
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: "TÍTULO"),
      body: _itemBody(
        assetName: 'assets/img/photo/photo1.jpg',
        child: const Text(
          "Título",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
