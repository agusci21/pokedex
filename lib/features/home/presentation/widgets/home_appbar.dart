import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        margin: const EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width * 0.5,
        child: Image.asset(
          'assets/images/pokemon-logo.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
