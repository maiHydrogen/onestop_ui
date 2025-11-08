import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';


class OAppBar extends StatefulWidget {
  const OAppBar({super.key});

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
            children: [IconButton(
              onPressed: () {},
              icon: Icon(
                TablerIcons.arrow_left,
                color: OColor.green600,
                size: 40,
              ),
            ),
              OText(
                text: "Title",
                style: OTextStyle.labelLarge.copyWith(color: OColor.gray600),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  TablerIcons.arrow_rotary_first_left,
                  color: OColor.green600,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: OSpacing.s),
        Divider(
          color: OColor.gray200 ,
        )
      ],
    );
  }
}
