import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

class NavDemo extends StatelessWidget {
  const NavDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OAppBar(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ONavBar(),
        ),
      ],
    );
  }
}
