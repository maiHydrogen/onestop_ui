import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';
import '../../constants/spacing.dart';
import '../../constants/corner_radius.dart';
import '../text.dart';
import '../../utils/styles.dart';

class ToggleWidgetList extends StatefulWidget {
  final List<Map<String, String>> items;
  final Function(int, bool)? onToggle;
  final bool isDisabled;

  const ToggleWidgetList({
    Key? key,
    required this.items,
    this.onToggle,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  State<ToggleWidgetList> createState() => _ToggleWidgetListState();
}

class _ToggleWidgetListState extends State<ToggleWidgetList> {
  late List<bool> _states;

  @override
  void initState() {
    super.initState();
    _states = List.generate(widget.items.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.items.length, (index) {
        final bool isOn = _states[index];
        final title = widget.items[index]["title"] ?? "";
        final subtitle = widget.items[index]["subtitle"] ?? "";
        return Container(
          margin: EdgeInsets.all(OSpacing.s),
          padding: EdgeInsets.all(OSpacing.s),
          decoration: BoxDecoration(
            color: widget.isDisabled ? OColor.gray200 : OColor.white,
            borderRadius: BorderRadius.circular(OCornerRadius.m),
            border: Border.all(
              color: OColor.gray200,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OText(
                    text: title,
                    style: OTextStyle.labelMedium.copyWith(
                      color: OColor.gray800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  OText(
                    text: subtitle,
                    style: OTextStyle.bodySmall.copyWith(
                      color: OColor.gray600,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: widget.isDisabled ? null: () {
                  setState(() {
                    _states[index] = !_states[index];
                  });
                  widget.onToggle?.call(index, _states[index]);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  width: 36,
                  height: 20,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: widget.isDisabled ? OColor.gray200 : (isOn ? OColor.green600 : OColor.gray200),
                    borderRadius:
                    BorderRadius.circular(OCornerRadius.l),
                  ),
                  alignment: widget.isDisabled ? Alignment.centerLeft : (isOn ? Alignment.centerRight : Alignment.centerLeft),
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: OColor.white,
                      borderRadius:
                      BorderRadius.circular(OCornerRadius.s),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
