import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class OTravelSwitch extends StatefulWidget {
  final bool isEnabled;
  final String? origin;
  final String? destination;
  final String originStop;
  final String destinationStop;
  final bool isOriginIitg;
  final Function(bool isOriginIitg, String originStop, String destinationStop)?
  onSwap;

  const OTravelSwitch({
    super.key,
    required this.isEnabled,
    this.origin,
    this.destination,
    required this.originStop,
    required this.destinationStop,
    required this.isOriginIitg,
    this.onSwap,
  });

  @override
  State<OTravelSwitch> createState() => _OTravelSwitchState();
}

class _OTravelSwitchState extends State<OTravelSwitch> {
  bool _isPressed = false;
  bool _isOriginIitg = false;
  String _originStop = '';
  String _destinationStop = '';

  @override
  void initState() {
    super.initState();
    _isOriginIitg = widget.isOriginIitg;
    _originStop = widget.originStop;
    _destinationStop = widget.destinationStop;
  }

  @override
  void didUpdateWidget(OTravelSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isOriginIitg != widget.isOriginIitg ||
        oldWidget.originStop != widget.originStop ||
        oldWidget.destinationStop != widget.destinationStop) {
      setState(() {
        _isOriginIitg = widget.isOriginIitg;
        _originStop = widget.originStop;
        _destinationStop = widget.destinationStop;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildLocation(
          isIitg: _isOriginIitg,
          location: _isOriginIitg ? "IIT G" : widget.origin,
          stop: _originStop,
        ),
        const SizedBox(width: OSpacing.s),
        SizedBox(
          width: 30,
          child: Divider(color: OColor.gray400, thickness: 1),
        ),
        GestureDetector(
          onTapDown: (_) {
            if (widget.isEnabled) {
              setState(() => _isPressed = true);
            }
          },
          onTapUp: (_) {
            setState(() => _isPressed = false);
            _swapOriginDestination();
          },
          onTapCancel: () {
            setState(
              () => _isPressed = false,
            ); // Resets state if gesture is cancelled
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: EdgeInsets.all(OSpacing.xs),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(OCornerRadius.l),
              border: Border.all(color: OColor.gray300),
              color: _isPressed ? OColor.gray200 : OColor.white,
            ),
            child: Row(
              children: [
                Icon(TablerIcons.arrows_diff, color: OColor.green600, size: 16),
                const SizedBox(width: OSpacing.xxs),
                OText(
                  text: "Swap",
                  style: OTextStyle.labelSmall.copyWith(color: OColor.green600),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 30,
          child: Divider(color: OColor.gray400, thickness: 1),
        ),
        const SizedBox(width: OSpacing.s),
        _buildLocation(
          isIitg: !_isOriginIitg,
          location: _isOriginIitg ? widget.destination : "IIT G",
          stop: _destinationStop,
        ),
      ],
    );
  }

  Widget _buildLocation({
    required bool isIitg,
    required String?  location,
    required String stop,
  }) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor:
                  isIitg
                      ? Color.fromRGBO(111, 113, 237, 1)
                      : Color.fromRGBO(68, 177, 165, 1),
              radius: 12,
              child: Icon(
                isIitg ? TablerIcons.school : TablerIcons.train,
                color: OColor.white,
                size: 16,
              ),
            ),
            const SizedBox(width: OSpacing.xxs),
            OText(
              text: location ?? " ",
              style: OTextStyle.headingMedium.copyWith(color: OColor.gray800),
            ),
          ],
        ),
        const SizedBox(height: OSpacing.xxs),
        OText(
          text: stop.toUpperCase(),
          style: OTextStyle.bodyXSmall.copyWith(color: OColor.gray600),
        ),
      ],
    );
  }

  void _swapOriginDestination() {
    setState(() {
      _isOriginIitg = !_isOriginIitg;
      final temp = _originStop;
      _originStop = _destinationStop;
      _destinationStop = temp;
    });

    // Notify parent widget if callback provided
    widget.onSwap?.call(_isOriginIitg, _originStop, _destinationStop);
  }
}
