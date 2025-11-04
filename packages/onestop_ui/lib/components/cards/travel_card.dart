import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class OTravelCard extends StatefulWidget {
  final Function()? onArrowPressed;
  final String mainText;
  final String? cardSubText;
  final Map<String, List<String>> dataMap;
  final double blockHeight;
  final double blockWidth;
  final bool isFerry;
  final bool isEnabled;

  const OTravelCard({
    super.key,
    this.onArrowPressed,
    required this.dataMap,
    required this.mainText,
    this.blockWidth = 150,
    this.blockHeight = 150,
    this.cardSubText,
    required this.isFerry,
    required this.isEnabled,
  });

  @override
  State<OTravelCard> createState() => _OTravelCardState();
}

class _OTravelCardState extends State<OTravelCard> {
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(OSpacing.xxs),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown:
            (_) => setState(
              () => _isPressed = true,
            ),
        onTapUp: (_) {
          setState(() => _isPressed = false);
        },
        child: Container(
          padding: const EdgeInsets.all(OSpacing.s,
          ),
          decoration: BoxDecoration(
            color: _isPressed ? OColor.gray200 : OColor.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(OCornerRadius.l),
            ),
            border: Border.all(color: OColor.gray200, width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OCardHeader(
                heading: widget.isFerry ? "Ferry" : "Bus",
                icon: widget.isFerry ? TablerIcons.ship : TablerIcons.bus,
                onClickArrow: true,
                onArrowPressed: widget.onArrowPressed,
              ),
              const SizedBox(height: OSpacing.m,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OText(
                    text: "IITG",
                    style: OTextStyle.labelMedium.copyWith(
                      color:
                          widget.isEnabled ? OColor.gray800 : OColor.gray600,
                    ),
                  ),
                  Icon(
                    TablerIcons.arrow_narrow_right,
                    color: OColor.gray500,
                    size: 24,
                  ),
                  OText(
                    text: "City",
                    style: OTextStyle.labelMedium.copyWith(
                      color:
                          widget.isEnabled ? OColor.gray800 : OColor.gray600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: OSpacing.s,),
              Divider(color: OColor.gray200),
              const SizedBox(height: OSpacing.s,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OText(
                    text: "City",
                    style: OTextStyle.labelMedium.copyWith(
                      color:
                          widget.isEnabled ? OColor.gray800 : OColor.gray600,
                    ),
                  ),
                  Icon(
                    TablerIcons.arrow_narrow_right,
                    color: OColor.gray500,
                    size: 24,
                  ),
                  OText(
                    text: "IITG",
                    style: OTextStyle.labelMedium.copyWith(
                      color:
                          widget.isEnabled ? OColor.gray800 : OColor.gray600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
