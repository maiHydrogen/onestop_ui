import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class NavDemo extends StatelessWidget {
  const NavDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OAppBar(
          title: 'App Bar',
          isProgressive: false,
          onIconTap: () {},
          trailingIcon: TablerIcons.arrow_rotary_first_left,
        ),
        OAppBar(
          title: 'App Bar',
          countSteps: 3,
          currentStep: 2,
          isProgressive: true,
          onIconTap: () {},
          stepNames: ["Step1", "Step2", "Step3"],
          trailingIcon: TablerIcons.arrow_rotary_first_left,
        ),
        Padding(padding: const EdgeInsets.all(12.0), child: ONavBar()),
      ],
    );
  }
}
