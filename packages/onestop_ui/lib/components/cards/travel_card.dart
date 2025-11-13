import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class OTravelCard extends StatefulWidget {
  final Function()? onArrowPressed;
  final Map<String, int> ferryToCity;
  final Map<String, int> ferryFromCity;
  final Map<String, int> busToCity;
  final Map<String, int> busFromCity;
  final bool isFerry;
  final bool isEnabled;

  const OTravelCard({
    super.key,
    this.onArrowPressed,
    required this.ferryToCity,
    required this.ferryFromCity,
    required this.busToCity,
    required this.busFromCity,
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
    final dataToCity = widget.isFerry ? widget.ferryToCity : widget.busToCity;
    final dataFromCity =
        widget.isFerry ? widget.ferryFromCity : widget.busFromCity;

    return Padding(
      padding: const EdgeInsets.all(OSpacing.xxs),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) {
          if (widget.isEnabled) {
            setState(() => _isPressed = true);
          }
        },
        onTapUp: (_) {
          setState(() => _isPressed = false);
        },
        onTapCancel: () {
          setState(
            () => _isPressed = false,
          ); // Resets state if gesture is cancelled
        },
        child: Container(
          padding: const EdgeInsets.all(OSpacing.s),
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
                onArrowPressed: widget.isEnabled ? widget.onArrowPressed : null,
              ),
              const SizedBox(height: OSpacing.m),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OText(
                    text: "IITG",
                    style: OTextStyle.labelMedium.copyWith(
                      color: widget.isEnabled ? OColor.gray800 : OColor.gray600,
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
                      color: widget.isEnabled ? OColor.gray800 : OColor.gray600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: OSpacing.s),
              _buildTimingsList(dataToCity),
              const SizedBox(height: OSpacing.s),
              Divider(color: OColor.gray200, thickness: 1),
              const SizedBox(height: OSpacing.s),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OText(
                    text: "City",
                    style: OTextStyle.labelMedium.copyWith(
                      color: widget.isEnabled ? OColor.gray800 : OColor.gray600,
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
                      color: widget.isEnabled ? OColor.gray800 : OColor.gray600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: OSpacing.s),
              _buildTimingsList(dataFromCity),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimingsList(Map<String, int> data) {
    return Column(
      children:
          data.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: OSpacing.xxs),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OText(
                    text: entry.key.toUpperCase(),
                    style: OTextStyle.labelXSmall.copyWith(
                      color: OColor.gray600,
                    ),
                  ),
                  OText(
                    text: "In ${entry.value} mins",
                    style: OTextStyle.labelXSmall.copyWith(
                      color:
                          widget.isEnabled
                              ? _getTimingColor(entry.value)
                              : OColor.gray400,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }

  Color _getTimingColor(int minutes) {
    if (minutes >= 30) return OColor.green600;
    if (minutes >= 10) return OColor.yellow600;
    return OColor.red500;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
