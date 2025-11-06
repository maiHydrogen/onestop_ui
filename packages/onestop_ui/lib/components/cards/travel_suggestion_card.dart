import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class OTravelSuggestionCard extends StatefulWidget {
  final bool isEnabled;
  final VoidCallback? goToGuide;
  final String? warning;
  final String body;

  const OTravelSuggestionCard({
    super.key,
    required this.isEnabled,
    this.goToGuide,
    this.warning,
    required this.body,
  });

  @override
  State<OTravelSuggestionCard> createState() => _OTravelSuggestionCardState();
}

class _OTravelSuggestionCardState extends State<OTravelSuggestionCard> {
  bool _isPressed = false;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        padding:
            _isExpanded
                ? EdgeInsets.only(
                  right: OSpacing.s,
                  left: OSpacing.s,
                  top: OSpacing.s,
                )
                : EdgeInsets.all(OSpacing.s),
        decoration: BoxDecoration(
          color: _isPressed ? OColor.gray200 : OColor.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(OCornerRadius.l),
          ),
          border: Border.all(color: OColor.gray200, width: 1),
        ),
        child: Column(
          children: [
            OCardHeader(
              heading: "Travel by Ferry",
              icon: TablerIcons.ship,
              onArrowPressed: () {
                setState(() => _isExpanded = true);
              },
            ),
            if (_isExpanded == true) const SizedBox(height: OSpacing.s),
            if (_isExpanded == true)
              OText(
                text: widget.body,
                style: OTextStyle.labelSmall.copyWith(color: OColor.gray800),
              ),
            if (_isExpanded == true && widget.warning != null)
              const SizedBox(height: OSpacing.s),
            if (_isExpanded == true && widget.warning != null)
              Container(
                padding: const EdgeInsets.all(OSpacing.s),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(OCornerRadius.s),
                  color: OColor.yellow100,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      TablerIcons.alert_triangle,
                      size: 16,
                      color: OColor.black,
                    ),
                    const SizedBox(width: OSpacing.s),
                    Expanded(
                      child: OText(
                        text: widget.warning,
                        style: OTextStyle.headingXSmall.copyWith(
                          color: OColor.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (_isExpanded == true) const SizedBox(height: OSpacing.s),
            if (_isExpanded == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(TablerIcons.book, size: 16, color: OColor.green600),
                      const SizedBox(width: OSpacing.s),
                      OText(
                        text: "Travel Guide",
                        style: OTextStyle.labelSmall.copyWith(
                          color: OColor.green600,
                        ),
                      ),
                      IconButton(
                        onPressed: widget.goToGuide,
                        icon: Icon(
                          TablerIcons.arrow_up_right,
                          size: 16,
                          color: OColor.green600,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() => _isExpanded = false);
                    },
                    child: OText(
                      text: "Hide",
                      style: OTextStyle.labelSmall.copyWith(
                        color: OColor.gray600,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
