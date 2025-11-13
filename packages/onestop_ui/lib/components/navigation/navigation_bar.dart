import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

class ONavBar extends StatefulWidget {
  final Function? onTabItemSelected;
  final String initialSelectedTab;
  final List<String?> labels;
  final List<IconData>? icons;
  final ONavBarController? controller;
  final double? height;

  ONavBar({
    super.key,
    this.height = 70,
    this.onTabItemSelected,
    required this.initialSelectedTab,
    required this.labels,
    this.icons,
    this.controller,
  }) : assert(labels.contains(initialSelectedTab)),
       assert(icons != null && icons.length == labels.length);

  @override
  State<ONavBar> createState() => _ONavBarState();
}

class _ONavBarState extends State<ONavBar> {
  late List<String?> labels;
  late Map<String?, IconData> icons;
  String? selectedTab;
  IconData? activeIcon;

  @override
  void initState() {
    super.initState();
    labels = widget.labels;
    // Optimized map: O(n) total time
    icons = {
      for (int i = 0; i < labels.length; i++) labels[i]: widget.icons![i],
    };

    selectedTab = widget.initialSelectedTab;
    activeIcon = icons[selectedTab];

    if (widget.controller != null) {
      // Validate length (final, no setter)
      if (widget.controller!.length != labels.length) {
        throw FlutterError(
          'Controller length (${widget.controller!.length}) must match labels (${labels.length}). Set in constructor.',
        );
      }
      // Set callback for controller notifications
      widget.controller!.onTabChange = (int index) {
        if (mounted) {
          setState(() {
            selectedTab = labels[index];
            activeIcon = icons[selectedTab];
          });
        }
      };
      // Sync initial
      final initialIndex = labels.indexOf(selectedTab);
      if (widget.controller!.index != initialIndex) {
        widget.controller!.animateTo(initialIndex);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: OSpacing.l,
        left: OSpacing.m,
        right: OSpacing.m,
      ),
      child: Container(
        padding: EdgeInsets.all(OSpacing.xxs),
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(OCornerRadius.l)),
          color: OColor.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0),
              blurRadius: 30,
              offset: Offset(0, 40),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.01),
              blurRadius: 27,
              offset: Offset(0, 32),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.02),
              blurRadius: 23,
              offset: Offset(0, 12),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.03),
              blurRadius: 17,
              offset: Offset(0, 16),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              blurRadius: 9,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: generateTabItems(),
        ),
      ),
    );
  }

  List<Widget> generateTabItems() {
    return labels.asMap().entries.map((entry) {
      final int tabIndex = entry.key;
      final String? tabLabel = entry.value;
      final IconData? icon = icons[tabLabel];
      final bool isSelected = selectedTab == tabLabel;

      return Expanded(
        // Prevents overflow by constraining each button equally
        child: ONavButton(
          label: tabLabel,
          selected: isSelected,
          isAlert: false, // Customize per tab if needed
          icon: icon,
          callbackFunction: () {
            setState(() {
              selectedTab = tabLabel;
              activeIcon = icon;
            });
            // Correct index for callback
            widget.onTabItemSelected?.call(tabIndex);
            // Controller sync with animation
            widget.controller?.animateTo(tabIndex);
          },
        ),
      );
    }).toList();
  }
}
