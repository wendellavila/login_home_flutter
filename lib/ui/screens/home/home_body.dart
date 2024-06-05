import 'package:flutter/material.dart';
import 'package:login_home/ui/screens/home/item_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.context,
    required this.itemInfo,
  });

  final BuildContext context;
  final List<Map> itemInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: ListView(
        children: [
          Align(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                itemInfo.length,
                (index) => ItemCard(context: context, item: itemInfo[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
