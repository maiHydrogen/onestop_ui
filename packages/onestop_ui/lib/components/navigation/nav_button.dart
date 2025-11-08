import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class ONavButton extends StatefulWidget {
  const ONavButton({super.key});

  @override
  State<ONavButton> createState() => _ONavButtonState();
}

class _ONavButtonState extends State<ONavButton> {
  bool _isPressed = false;

  var isAlert = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown:
          (_) => setState(
            () => _isPressed = true,
          ), //engage behaviour when button is tapped
      onTapUp: (_) {
        setState(() => _isPressed = false);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:OSpacing.l, vertical: OSpacing.xs),
        decoration: BoxDecoration(
          color: _isPressed ? OColor.green100 : OColor.white,
          borderRadius: BorderRadius.all(Radius.circular(OCornerRadius.m)),
        ),
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  TablerIcons.arrow_rotary_first_left,
                  color: _isPressed ? OColor.green600 : OColor.gray800,
                  size: 24,
                ),
                const SizedBox(height: OSpacing.xxs),
                OText(
                  text: "Label",
                  style: OTextStyle.bodyXSmall.copyWith(color: _isPressed ? OColor.green600 : OColor.gray800),
                ),
              ],
            ),
            if (isAlert == true)
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
