import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class Demo2 extends StatefulWidget {
  const Demo2({super.key});

  @override
  State<Demo2> createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  late ThemeStore themeStore;

  @override
  void initState() {
    super.initState();
    themeStore = ThemeStore();
    themeStore.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    themeStore.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OAppBar(
        title: 'OneStop UI Demo',
        isProgressive: true,
        stepNames: ["Demo 1","Demo 2","Demo 3", "Demo 4"],
        currentStep: 2,
        countSteps: 4,
        trailingIcon: TablerIcons.arrow_rotary_first_left,
        onIconTap: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleDemo(),
              ImageDemo(),
              Divider(),
              const SizedBox(height: 20),
              ModalDemo(),
              const SizedBox(height: 20),
              CardsDemo(),
              const SizedBox(height: 20),
              TextfieldsDemo(),
            ],
          ),
        ),
      ),
    );
  }
}
