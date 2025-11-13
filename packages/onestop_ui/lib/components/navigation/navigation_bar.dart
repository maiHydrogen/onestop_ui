import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class ONavBar extends StatefulWidget {
  const ONavBar({super.key});

  @override
  State<ONavBar> createState() => _ONavBarState();
}

class _ONavBarState extends State<ONavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(OSpacing.xxs),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(OCornerRadius.l)),
        color: OColor.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0),
            blurRadius: 30,
            offset: Offset(0, 40),
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.01),
            blurRadius: 27,
            offset: Offset(0, 32),
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.02),
            blurRadius: 23,
            offset: Offset(0, 12),
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.03),
            blurRadius: 17,
            offset: Offset(0, 16),
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.06),
            blurRadius: 9,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ONavButton(
            icon: TablerIcons.arrow_rotary_first_left,
            isAlert: false,
            label: "Arrrow",
            onTapped: () {},
          );
        },
      ),
    );
  }
}
