import 'package:flutter/material.dart';
import 'package:login_home/ui/widgets/appbar.dart';
import 'package:login_home/ui/widgets/drawer.dart';
import 'package:login_home/ui/screens/item.dart';

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
      itemInfo.add({
        "title": "Título",
        "description": "Descrição",
        "image": "assets/img/photo/photo1-1x1.jpg"
      });
    }
    return itemInfo;
  }

  Widget _itemCard({required int itemIndex}) {
    final double cardWidth = MediaQuery.of(context).size.width > 420
        ? 380
        : MediaQuery.of(context).size.width;
    return SizedBox(
      width: cardWidth,
      child: Card(
        child: InkWell(
          highlightColor: Theme.of(context).colorScheme.primary,
          hoverColor: Theme.of(context).colorScheme.secondary,
          splashColor: Theme.of(context).colorScheme.primary,
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image(
                      image: AssetImage(_itemInfo[itemIndex]["image"]),
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, bottom: 5, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              _itemInfo[itemIndex]["title"],
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              _itemInfo[itemIndex]["description"],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeItemPage())),
        ),
      ),
    );
  }

  Widget _homeBody() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: ListView(
          children: [
            Align(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: List.generate(
                    _itemInfo.length, (index) => _itemCard(itemIndex: index)),
              ),
            )
          ],
        ));
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
      body: _homeBody(),
    );
  }
}
