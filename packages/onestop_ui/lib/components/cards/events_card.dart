import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class OEventCard extends StatefulWidget {
  final String heading;
  final String subLabel1;
  final String subLabel2;
  final IconData? subLabelIcon1;
  final IconData? subLabelIcon2;
  final bool isEnabled;
  final Function()? onArrowPressed;
  final String? buttonLabel;
  final IconData? buttonIcon;
  final Function()? pressedButton;
  final IconData? labelIcon;
  final String? label;

  const OEventCard({
    super.key,
    required this.heading,
    this.isEnabled = true,
    this.onArrowPressed,
    this.buttonLabel,
    this.buttonIcon,
    this.pressedButton,
    this.labelIcon,
    this.label,
    this.subLabel1 = 'N/A',
    this.subLabel2 = 'N/A',
    this.subLabelIcon1,
    this.subLabelIcon2,
  });

  @override
  State<OEventCard> createState() => _OEventCardState();
}

class _OEventCardState extends State<OEventCard> {
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(OSpacing.xs),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown:
                (_) =>
                    widget.isEnabled
                        ? setState(() => _isPressed = true)
                        : null, //engage behaviour when card is tapped
            onTapUp: (_) {
              setState(() => _isPressed = false);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: OSpacing.xs,
                vertical: OSpacing.xs,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(OCornerRadius.l),
                border: Border.all(color: OColor.gray200, width: 1),
                color: _isPressed ? OColor.gray200 : OColor.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(OSpacing.xs),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 4,
                          height: 25,
                          decoration: BoxDecoration(
                            color:
                                widget.isEnabled
                                    ? OColor.green600
                                    : OColor.gray600,
                            borderRadius: BorderRadius.circular(
                              OCornerRadius.xl,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: OSpacing.xs,
                          ),
                          child: OText(
                            text: widget.heading,
                            style: OTextStyle.headingSmall.copyWith(
                              color:
                                  widget.isEnabled
                                      ? OColor.gray800
                                      : OColor.gray600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: OSpacing.xs),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            OCardLabels(
                              label: widget.subLabel1,
                              icon: widget.subLabelIcon1!,
                              color:
                                  widget.isEnabled
                                      ? OColor.gray600
                                      : OColor.gray400,
                            ),
                            OCardLabels(
                              label: widget.subLabel2,
                              icon: widget.subLabelIcon2!,
                              color:
                                  widget.isEnabled
                                      ? OColor.gray600
                                      : OColor.gray400,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: OSpacing.xs,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(OSpacing.xs),
                            decoration: BoxDecoration(
                              color:
                                  widget.isEnabled
                                      ? OColor.green100
                                      : OColor.gray200,
                              borderRadius: BorderRadius.circular(
                                OCornerRadius.xl,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  widget.labelIcon,
                                  size: 16,
                                  color:
                                      widget.isEnabled
                                          ? OColor.green700
                                          : OColor.gray600,
                                ),
                                OText(
                                  text: widget.label,
                                  style: OTextStyle.labelXSmall.copyWith(
                                    color:
                                        widget.isEnabled
                                            ? OColor.green700
                                            : OColor.gray600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: OSpacing.xs),
                    child: Divider(
                      height: 2,
                      color: OColor.gray200,
                      thickness: 1,
                      indent: OSpacing.xs,
                      endIndent: OSpacing.xs,
                    ),
                  ),
                  SizedBox(height: OSpacing.xl + 5),
                ],
              ),
            ),
          ),
          TextButton.icon(
            onPressed:
                widget.isEnabled
                    ? () {
                      setState(() => _isPressed = false);
                      widget.pressedButton;
                    }
                    : null,
            icon: Icon(
              widget.buttonIcon,
              size: 16,
              color: widget.isEnabled ? OColor.red500 : OColor.gray400,
            ),
            label: OText(
              text: widget.buttonLabel,
              style: OTextStyle.labelSmall.copyWith(
                color: widget.isEnabled ? OColor.red500 : OColor.gray400,
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              icon: Icon(
                TablerIcons.chevron_right,
                color: widget.isEnabled ? OColor.gray600 : OColor.gray300,
              ),
              onPressed: widget.isEnabled ? widget.onArrowPressed : null,
              iconSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class OEventCardCompact extends StatefulWidget {
  final bool isEnabled;
  final bool isFeedbackOn;
  final String title;
  final String subText;
  final String? tag1;
  final String? tag2;
  final String savedTime;
  final Function(String feedback)?
  onFeedbackSubmit; // Callback for feedback submission

  const OEventCardCompact({
    super.key,
    required this.isEnabled,
    required this.isFeedbackOn,
    required this.title,
    required this.subText,
    this.tag1,
    this.tag2,
    required this.savedTime,
    this.onFeedbackSubmit,
  });

  @override
  State<OEventCardCompact> createState() => _OEventCardCompactState();
}

class _OEventCardCompactState extends State<OEventCardCompact> {
  bool isPressed = false;
  bool showFeedbackField = false;
  bool feedbackSubmitted = false;
  String submittedFeedback = '';
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void _handleFeedbackSubmit() {
    if (_feedbackController.text.trim().isNotEmpty) {
      setState(() {
        submittedFeedback = _feedbackController.text.trim();
        feedbackSubmitted = true;
        showFeedbackField = false;
      });

      // Call the callback if provided
      widget.onFeedbackSubmit?.call(submittedFeedback);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown:
          (_) => widget.isEnabled ? setState(() => isPressed = true) : null,
      onTapUp: (_) {
        setState(() => isPressed = false);
      },
      child: Container(
        padding: const EdgeInsets.all(OSpacing.s),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(OCornerRadius.l),
          border: Border.all(color: OColor.gray200, width: 1),
          color: isPressed ? OColor.gray200 : OColor.white,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(OCornerRadius.xl),
                        color: OColor.gray400,
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://variety.com/wp-content/uploads/2019/10/shutterstock_editorial_10435445et.jpg?w=1000&h=667&crop=1",
                          ),
                          fit: BoxFit.cover,
                          opacity: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: OSpacing.s),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OText(
                          text: widget.title,
                          style: OTextStyle.bodyMedium.copyWith(
                            color: OColor.gray800,
                          ),
                        ),
                        const SizedBox(height: OSpacing.xxs),
                        OText(
                          text: widget.subText,
                          style: OTextStyle.bodyMedium.copyWith(
                            color: OColor.gray600,
                          ),
                        ),
                        const SizedBox(height: OSpacing.xs),
                        Row(
                          children: [
                            Container(
                              width: 46,
                              height: 24,
                              decoration: BoxDecoration(
                                color: OColor.gray100,
                                borderRadius: BorderRadius.circular(
                                  OCornerRadius.xl,
                                ),
                              ),
                              child: Center(
                                child: OText(
                                  text: widget.tag1?.toUpperCase(),
                                  style: OTextStyle.labelXSmall.copyWith(
                                    color: OColor.blue600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: OSpacing.m),
                            Container(
                              width: 46,
                              height: 24,
                              decoration: BoxDecoration(
                                color: OColor.gray100,
                                borderRadius: BorderRadius.circular(
                                  OCornerRadius.xl,
                                ),
                              ),
                              child: Center(
                                child: OText(
                                  text: widget.tag2?.toUpperCase(),
                                  style: OTextStyle.labelXSmall.copyWith(
                                    color: OColor.green600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: OSpacing.m),
                        Row(
                          children: [
                            Icon(
                              TablerIcons.file,
                              size: 16,
                              color: OColor.green600,
                            ),
                            const SizedBox(width: OSpacing.xxs),
                            OText(
                              text: "Saved ${widget.savedTime} ago",
                              style: OTextStyle.labelXSmall.copyWith(
                                color: OColor.green600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  TablerIcons.chevron_right,
                  color: widget.isEnabled ? OColor.gray600 : OColor.gray400,
                  size: 24,
                ),
              ],
            ),
            if (widget.isFeedbackOn == true) const SizedBox(height: OSpacing.l),
            if (widget.isFeedbackOn == true)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Show submitted feedback message
                  if (feedbackSubmitted)
                    Divider(color: OColor.gray200),
                    if (feedbackSubmitted)
                    Container(
                      padding: const EdgeInsets.all(OSpacing.s),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OText(
                            text: "YOUR FEEDBACK",
                            style: OTextStyle.labelXSmall.copyWith(
                              color: OColor.gray800,
                            ),
                          ),
                          const SizedBox(height: OSpacing.xs),
                          Row(
                            children: [
                              Icon(
                                TablerIcons.message_heart,
                                size: 16,
                                color: OColor.green600,
                              ),
                              const SizedBox(width: OSpacing.xxs),
                              OText(
                                text: "\"$submittedFeedback\"",
                                style: OTextStyle.bodySmall.copyWith(
                                  color: OColor.gray600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  // Show feedback input field
                  else if (showFeedbackField)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OTextField(
                          label: "Leave A Feedback",
                          controller: _feedbackController,
                          isParagraph: true,
                        ),
                        const SizedBox(height: OSpacing.s),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showFeedbackField = false;
                                    _feedbackController.clear();
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: OSpacing.xs,
                                  ),
                                  decoration: BoxDecoration(
                                    color: OColor.white,
                                    border: Border.all(color: OColor.gray400),
                                    borderRadius: BorderRadius.circular(
                                      OCornerRadius.l,
                                    ),
                                  ),
                                  child: Center(
                                    child: OText(
                                      text: "Cancel",
                                      style: OTextStyle.labelSmall.copyWith(
                                        color: OColor.gray600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: OSpacing.s),
                            Expanded(
                              child: GestureDetector(
                                onTap: _handleFeedbackSubmit,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: OSpacing.xs,
                                  ),
                                  decoration: BoxDecoration(
                                    color: OColor.green600,
                                    borderRadius: BorderRadius.circular(
                                      OCornerRadius.l,
                                    ),
                                  ),
                                  child: Center(
                                    child: OText(
                                      text: "Submit",
                                      style: OTextStyle.labelSmall.copyWith(
                                        color: OColor.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  // Show initial feedback button
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OText(
                          text: "Enjoyed the event?",
                          style: OTextStyle.labelXSmall.copyWith(
                            color:
                                widget.isEnabled
                                    ? OColor.gray800
                                    : OColor.green600,
                          ),
                        ),
                        const SizedBox(height: OSpacing.xs),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap:
                              widget.isEnabled
                                  ? () {
                                    setState(() {
                                      showFeedbackField = true;
                                    });
                                  }
                                  : null,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: OSpacing.xs,
                              horizontal: OSpacing.s,
                            ),
                            decoration: BoxDecoration(
                              color: OColor.white,
                              border: Border.all(color: OColor.gray400),
                              borderRadius: BorderRadius.circular(
                                OCornerRadius.l,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OText(
                                    text: "Submit a Feedback",
                                    style: OTextStyle.labelSmall.copyWith(
                                      color:
                                          widget.isEnabled
                                              ? OColor.green600
                                              : OColor.gray400,
                                    ),
                                  ),
                                  const SizedBox(width: OSpacing.xs),
                                  Icon(
                                    TablerIcons.message_heart,
                                    color:
                                        widget.isEnabled
                                            ? OColor.green600
                                            : OColor.gray400,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
