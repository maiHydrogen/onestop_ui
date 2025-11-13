import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

class ONavButton extends StatefulWidget {
  final String? label;
  final IconData? icon;
  final bool selected;
  final bool isAlert;
  final Function callbackFunction; // Consider typing as VoidCallback for clarity

  const ONavButton({
    super.key,
    required this.label,
    required this.icon,
    required this.isAlert,
    required this.callbackFunction,
    required this.selected,
  });

  @override
  State<ONavButton> createState() => _ONavButtonState();
}

class _ONavButtonState extends State<ONavButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        widget.callbackFunction(); // Fixed: Added () to invoke the function
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: OSpacing.l,
          vertical: OSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: widget.selected ? OColor.green100 : OColor.white,
          borderRadius: BorderRadius.all(Radius.circular(OCornerRadius.m)),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  color: widget.selected ? OColor.green600 : OColor.gray800,
                  size: 24,
                ),
                const SizedBox(height: OSpacing.xxs),
                OText(
                  text: widget.label,
                  style: OTextStyle.bodyXSmall.copyWith(
                    color: widget.selected ? OColor.green600 : OColor.gray800,
                  ),
                ),
              ],
            ),
            if (widget.isAlert)
              Positioned(
                top: 0,
                right: 0,
                child: OBadge(type: BadgeType.normalHint),
              ),
          ],
        ),
      ),
    );
  }
}
