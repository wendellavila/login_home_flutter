import 'package:flutter/material.dart';
import 'package:login_home/ui/screens/item/item.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.context,
    required this.item,
  });

  final BuildContext context;
  final Map item;

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width > 420 ? 380 : MediaQuery.of(context).size.width;
    return SizedBox(
      width: cardWidth,
      child: Card(
        child: InkWell(
          highlightColor: Theme.of(context).colorScheme.primary,
          hoverColor: Theme.of(context).colorScheme.secondary,
          splashColor: Theme.of(context).colorScheme.primary,
          customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image(
                      image: AssetImage(item["image"]),
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              item["title"],
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              item["description"],
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
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeItemPage(),
            ),
          ),
        ),
      ),
    );
  }
}
