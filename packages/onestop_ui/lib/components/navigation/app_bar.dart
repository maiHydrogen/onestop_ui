import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class OAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final IconData? trailingIcon;
  final VoidCallback? onIconTap;
  final bool isProgressive;
  final int? countSteps;
  final int? currentStep;
  final List<String>? stepNames;
  const OAppBar({
    super.key,
    required this.title,
    this.trailingIcon,
    this.onIconTap,
    required this.isProgressive,
    this.countSteps,
    this.currentStep,
    this.stepNames,
  });

  @override
  State<OAppBar> createState() => _OAppBarState();

  @override
  Size get preferredSize {
    double height = kToolbarHeight; // 56.0
    if (isProgressive && countSteps != null) {
      height += 70.0;
    }
    return Size.fromHeight(height);
  }
}

class _OAppBarState extends State<OAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: OSpacing.s),
          decoration: BoxDecoration(
            color: OColor.white,
            border:
                widget.isProgressive
                    ? null
                    : Border(bottom: BorderSide(color: OColor.gray200)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  TablerIcons.arrow_left,
                  color: OColor.green600,
                  size: 24,
                ),
              ),
              OText(
                text: widget.title,
                style: OTextStyle.labelLarge.copyWith(color: OColor.gray600),
              ),
              IconButton(
                onPressed:
                    widget.onIconTap != null ? () => widget.onIconTap!() : null,
                icon: Icon(
                  widget.trailingIcon,
                  color: OColor.green600,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
        if (widget.isProgressive == true) SizedBox(height: OSpacing.s),
        if (widget.isProgressive == true)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: OSpacing.xl),
            child: StepProgressIndicator(
              numberOfSteps: widget.countSteps!,
              currentStep: widget.currentStep!,
              stepNames: widget.stepNames!,
            ),
          ),
        if (widget.isProgressive == true) Divider(color: OColor.gray200),
      ],
    );
  }
}
