import 'package:flutter/material.dart';

class ParadiseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ParadiseAppBar({Key? key}) :preferedSize= const Size.fromHeight(56),super(key: key);
  final Size  preferedSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/images/paradise_logo.png',
        fit: BoxFit.contain,
        width: 80,
        height: 80,
      ),
      centerTitle: true,
      backgroundColor: Colors.white70,
    );
  }

  @override
  // TODO: implement preferredSize
  // Dunno why .. but i cannot implement the class without this override
  Size get preferredSize => this.preferedSize;
}
