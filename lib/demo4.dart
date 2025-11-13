import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class Demo4 extends StatefulWidget {
  const Demo4({super.key});

  @override
  State<Demo4> createState() => _Demo4State();
}

class _Demo4State extends State<Demo4> {
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
              OText(text: "List Demo"),
              SizedBox(height: 25),
              ListDemo(),
              const SizedBox(height: 25),
              OCalendar(),
              const SizedBox(height: 25),
              ClockTime(),
              const SizedBox(height: 25),
              DateMonthYearPicker(),
              const SizedBox(height: 25),
              MonthYearPicker(),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
