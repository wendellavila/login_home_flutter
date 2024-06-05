import 'package:flutter/material.dart';

class LandscapeItemBody extends StatelessWidget {
  const LandscapeItemBody({
    super.key,
    required this.context,
    required this.assetName,
    required this.child,
  });

  final BuildContext context;
  final String assetName;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0.0,
          child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(assetName), fit: BoxFit.cover)),
              width: 250,
              height: MediaQuery.of(context).size.height),
        ),
        Positioned.fill(
          left: 230.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(8.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
