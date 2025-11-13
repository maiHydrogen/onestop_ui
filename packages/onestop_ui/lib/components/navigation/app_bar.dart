import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class OAppBar extends StatefulWidget {
  final String title;
  final IconData? trailingIcon;
  final Function()? onIconTap;
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
}

class _OAppBarState extends State<OAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: OSpacing.l),
          color: OColor.white,
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
                onPressed: () {},
                icon: Icon(
                  widget.trailingIcon,
                  color: OColor.green600,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
        if (widget.isProgressive == true) SizedBox(height: OSpacing.xs),
        if (widget.isProgressive == true)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:OSpacing.xl),
            child: StepProgressIndicator(
              numberOfSteps: widget.countSteps!,
              currentStep: widget.currentStep!,
              stepNames: widget.stepNames!,
            ),
          ),
        SizedBox(height: OSpacing.s),
        Divider(color: OColor.gray200),
      ],
    );
  }
}
