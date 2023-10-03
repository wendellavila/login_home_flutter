import 'package:flutter/material.dart';
import 'package:login_home/ui/widgets/appbar.dart';

class HomeItemPage extends StatefulWidget {
  const HomeItemPage({super.key});

  @override
  State<HomeItemPage> createState() => _HomeItemPage();
}

class _HomeItemPage extends State<HomeItemPage> {
  Widget _landscapeItemBody(
      {required String assetName, required Widget child}) {
    return Stack(
      children: [
        Positioned(
          left: 0.0,
          child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(assetName), fit: BoxFit.cover)),
              width: 250,
              height: MediaQuery.of(context).size.height),
        ),
        Positioned.fill(
            left: 230.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(8.0)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: child,
              ),
            )),
      ],
    );
  }

  Widget _portraitItemBody({required String assetName, required Widget child}) {
    return Stack(
      children: [
        Positioned(
            top: 0.0,
            child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(assetName), fit: BoxFit.cover)),
                width: MediaQuery.of(context).size.width,
                height: 250)),
        Positioned.fill(
            top: 230.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: child,
              ),
            )),
      ],
    );
  }

  Widget _itemBody({required String assetName, required Widget child}) {
    return OrientationBuilder(builder: ((context, orientation) {
      if (orientation == Orientation.portrait) {
        return _portraitItemBody(assetName: assetName, child: child);
      } else {
        return _landscapeItemBody(assetName: assetName, child: child);
      }
    }));
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
            )));
  }
}
