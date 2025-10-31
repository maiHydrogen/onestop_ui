import 'package:flutter/material.dart';
import 'package:onestop_ui/constants/spacing.dart';
import 'package:onestop_ui/store/theme_store.dart';
import '../components/ListButtons/ToggleButton.dart';

class ToggleDemo extends StatelessWidget {
  const ToggleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final themeStore = ThemeStore.instance;
        final List<Map<String, String>> items = const [
      {
        "title": "Heading",
        "subtitle": "Description",
      },
      {
        "title": "Heading",
        "subtitle": "Description",
      },
      {
        "title": "Heading",
        "subtitle": "Description",
      },
    ];


    return SafeArea(
      child: Container(
        color: themeStore.backgroundColor,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ToggleWidgetList(
                  items: items,
                  onToggle: (index, isOn) {
                    debugPrint('${items[index]["title"]} toggled: $isOn');
                  },
                ),
                const SizedBox(height: OSpacing.l),
                const Divider(),
                const SizedBox(height: OSpacing.xs),
                ToggleWidgetList(
                  items: items,
                  isDisabled: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}