import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class Demo3 extends StatefulWidget {
  const Demo3({super.key});

  @override
  State<Demo3> createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {
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
        isProgressive: false,
        trailingIcon: TablerIcons.arrow_rotary_first_left,
        onIconTap: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IndicatorsDemo(),
              const SizedBox(height: 10),
              Divider(),
              const SizedBox(height: 10),
              OText(text: "Buttons Part"),
              SizedBox(height: 25),
              ButtonsDemo(),
            ],
          ),
        ),
      ),
    );
  }
}
