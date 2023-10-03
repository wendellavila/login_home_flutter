import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({required this.title, super.key});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(65.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65.0,
      title: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo/logo.png',
              height: 45,
            ),
            const VerticalDivider(
              color: Colors.white,
              thickness: 2,
              indent: 5,
              endIndent: 5,
              width: 30,
            ),
            Flexible(
                child: Text(
              title.toUpperCase(),
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      titleSpacing: 0,
    );
  }
}
