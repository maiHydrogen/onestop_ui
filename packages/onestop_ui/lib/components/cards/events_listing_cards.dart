import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

enum EventCardSize { small, medium, large }

enum EventCardType { user, admin }

class OEventListingCard extends StatefulWidget {
  final String title;
  final String? date;
  final EventCardSize size;
  final EventCardType type;
  final VoidCallback? onTap;
  final bool isDisabled;
  final bool? isSaved;
  final String? eventImageUrl;
  final String startTime;
  final String? endtime;
  final String location;
  final String? tag1;
  final String? tag2;
  final int? attendance;
  final int? likes;
  final int? views;
  final int? feedbacks;
  final IconData? tagIcon1;
  final IconData? tagIcon2;
  final String? hostImageUrl;
  final String? hostName;
  final VoidCallback? delete;
  final VoidCallback? edit;

  const OEventListingCard._({
    super.key,
    required this.title,
    this.date,
    required this.size,
    required this.type,
    required this.onTap,
    this.eventImageUrl,
    this.isDisabled = false,
    this.isSaved,
    required this.startTime,
    this.endtime,
    required this.location,
    this.tag1,
    this.tag2,
    this.attendance,
    this.likes,
    this.feedbacks,
    this.views,
    this.tagIcon1,
    this.tagIcon2,
    this.hostImageUrl,
    this.hostName,
    this.delete,
    this.edit,
  });
  const OEventListingCard.small({
    Key? key,
    required String title,
    required String location,
    required EventCardType type,
    VoidCallback? onTap,
    bool isDisabled = false,
    required String startTime,
    bool isSaved = false,
    required String eventImageUrl,
    String? tag1,
    String? tag2,
  }) : this._(
         key: key,
         title: title,
         location: location,
         size: EventCardSize.small,
         startTime: startTime,
         type: type,
         onTap: onTap,
         isDisabled: isDisabled,
         isSaved: isSaved,
         eventImageUrl: eventImageUrl,
         tag1: tag1,
         tag2: tag2,
       );
  const OEventListingCard.medium({
    Key? key,
    required String title,
    required String date,
    required String location,
    required EventCardType type,
    VoidCallback? onTap,
    bool isDisabled = false,
    required String startTime,
    bool isSaved = false,
    required String eventImageUrl,
    int? attendance,
    String? endtime,
  }) : this._(
         key: key,
         title: title,
         date: date,
         size: EventCardSize.medium,
         location: location,
         type: type,
         onTap: onTap,
         isDisabled: isDisabled,
         startTime: startTime,
         isSaved: isSaved,
         eventImageUrl: eventImageUrl,
         attendance: attendance,
         endtime: endtime,
       );
  const OEventListingCard.large({
    Key? key,
    required String title,
    required String date,
    required String location,
    required EventCardType type,
    VoidCallback? onTap,
    bool isDisabled = false,
    required String startTime,
    bool isSaved = false,
    required String eventImageUrl,
    int? attendance,
    int? likes,
    int? views,
    int? feedbacks,
    String? tag1,
    String? tag2,
    IconData? tagIcon1,
    IconData? tagIcon2,
    String? hostImageUrl,
    String? hostName,
    VoidCallback? delete,
    VoidCallback? edit,
    String? endtime,
  }) : this._(
         key: key,
         title: title,
         date: date,
         size: EventCardSize.large,
         startTime: startTime,
         type: type,
         location: location,
         onTap: onTap,
         isDisabled: isDisabled,
         isSaved: isSaved,
         eventImageUrl: eventImageUrl,
         attendance: attendance,
         likes: likes,
         views: views,
         feedbacks: feedbacks,
         tag2: tag2,
         tag1: tag1,
         delete: delete,
         edit: edit,
         tagIcon1: tagIcon1,
         tagIcon2: tagIcon2,
         endtime: endtime,
         hostImageUrl: hostImageUrl,
         hostName: hostName,
       );

  @override
  State<OEventListingCard> createState() => _OEventListingCardState();
}

class _OEventListingCardState extends State<OEventListingCard> {
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        widget.isDisabled ? null : setState(() => _isPressed = true);
        widget.isDisabled ? null : widget.onTap;
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(OCornerRadius.l),
          border: Border.all(color: OColor.gray200, width: 1),
          color: _isPressed ? OColor.gray200 : OColor.white,
        ),
        child: _buildCardContent(),
      ),
    );
  }

  Widget _buildCardContent() {
    // Build content based on size - larger cards show more info
    return switch (widget.size) {
      EventCardSize.small => Padding(
        padding: const EdgeInsets.all(OSpacing.s),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(OCornerRadius.xl),
                    color: OColor.gray400,
                    image: DecorationImage(
                      image: NetworkImage(widget.eventImageUrl!),
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
                        color:
                            widget.isDisabled ? OColor.gray600 : OColor.gray800,
                      ),
                    ),
                    if (widget.isSaved == true)
                      const SizedBox(height: OSpacing.xxs),
                    if (widget.isSaved == true)
                      OCardLabels(
                        label: "I'm Going",
                        icon: TablerIcons.check,
                        color:
                            widget.isDisabled
                                ? OColor.gray400
                                : OColor.green600,
                      ),
                    const SizedBox(height: OSpacing.xxs),
                    OText(
                      text: "${widget.startTime}, ${widget.location}",
                      style: OTextStyle.bodySmall.copyWith(
                        color:
                            widget.isDisabled ? OColor.gray400 : OColor.gray600,
                      ),
                    ),
                    if (widget.tag1 != null && widget.tag2 != null)
                      const SizedBox(height: OSpacing.xs),
                    if (widget.tag1 != null && widget.tag2 != null)
                      Row(
                        children: [
                          if (widget.tag1 != null)
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
                                    color:
                                        widget.isDisabled
                                            ? OColor.gray400
                                            : OColor.blue600,
                                  ),
                                ),
                              ),
                            ),
                          if (widget.tag2 != null)
                            const SizedBox(width: OSpacing.m),
                          if (widget.tag2 != null)
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
                                    color:
                                        widget.isDisabled
                                            ? OColor.gray400
                                            : OColor.green600,
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
            Icon(
              TablerIcons.chevron_right,
              color: widget.isDisabled ? OColor.gray400 : OColor.gray600,
              size: 24,
            ),
          ],
        ),
      ),
      EventCardSize.medium => Column(
        children: [
          Container(
            width: 210,
            height: 118,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(OCornerRadius.s),
                topRight: Radius.circular(OCornerRadius.s),
              ),
              color: OColor.gray400,
              image: DecorationImage(
                image: NetworkImage(widget.eventImageUrl!),
                fit: BoxFit.cover,
                opacity: 1,
              ),
            ),
          ),
          Container(
            width: 210,
            padding: const EdgeInsets.all(OSpacing.s),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(OCornerRadius.s),
                bottomRight: Radius.circular(OCornerRadius.s),
              ),
              border: Border.all(color: OColor.gray200, width: 1),
              color: _isPressed ? OColor.gray200 : OColor.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OText(
                  text: widget.title,
                  style: OTextStyle.bodyMedium.copyWith(
                    color: widget.isDisabled ? OColor.gray600 : OColor.gray800,
                  ),
                ),
                const SizedBox(width: OSpacing.xs),
                OText(
                  text:
                      "${widget.date}, ${widget.startTime} - ${widget.endtime}",
                  style: OTextStyle.bodySmall.copyWith(
                    color: widget.isDisabled ? OColor.gray400 : OColor.gray600,
                  ),
                ),
                const SizedBox(width: OSpacing.xxs),
                OText(
                  text: widget.location,
                  style: OTextStyle.bodySmall.copyWith(
                    color: widget.isDisabled ? OColor.gray400 : OColor.gray600,
                  ),
                ),
                const SizedBox(width: OSpacing.xs),
                if (widget.isSaved == true)
                  OCardLabels(
                    label: "Going",
                    icon: TablerIcons.check,
                    color: widget.isDisabled ? OColor.gray400 : OColor.green600,
                  ),
                if (widget.isSaved != true)
                  Row(
                    children: [
                      const SizedBox(width: OSpacing.m),
                      OText(
                        text: "+ ${widget.attendance} others",
                        style: OTextStyle.labelXSmall.copyWith(
                          color:
                              widget.isDisabled
                                  ? OColor.gray400
                                  : OColor.blue600,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
      EventCardSize.large => Padding(
        padding: const EdgeInsets.all(OSpacing.s),
        child: Column(
          children: [
            Container(
              height: 187.53,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(OCornerRadius.s),
                ),
                color: OColor.gray400,
                image: DecorationImage(
                  image: NetworkImage(widget.eventImageUrl!),
                  fit: BoxFit.cover,
                  opacity: 1,
                ),
              ),
            ),
            if (widget.type == EventCardType.admin)
              const SizedBox(height: OSpacing.s),
            if (widget.type == EventCardType.admin)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OCardLabels(
                    label: widget.likes.toString(),
                    icon: TablerIcons.heart_plus,
                    color: widget.isDisabled ? OColor.gray400 : OColor.blue500,
                    isSmall: true,
                  ),
                  const SizedBox(width: OSpacing.s),
                  OCardLabels(
                    label: widget.views.toString(),
                    icon: TablerIcons.eye,
                    color: widget.isDisabled ? OColor.gray400 : OColor.blue500,
                    isSmall: true,
                  ),
                  const SizedBox(width: OSpacing.s),
                  OCardLabels(
                    label: widget.feedbacks.toString(),
                    icon: TablerIcons.message_heart,
                    color: widget.isDisabled ? OColor.gray400 : OColor.blue500,
                    isSmall: true,
                  ),
                ],
              ),
            const SizedBox(height: OSpacing.s),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OText(
                  text: widget.title,
                  style: OTextStyle.headingSmall.copyWith(
                    color: widget.isDisabled ? OColor.gray600 : OColor.gray800,
                  ),
                ),
                Icon(
                  TablerIcons.chevron_right,
                  color: widget.isDisabled ? OColor.gray400 : OColor.gray600,
                  size: 24,
                ),
              ],
            ),
            const SizedBox(height: OSpacing.s),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: OSpacing.xs,
                    vertical: OSpacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: OColor.gray100,
                    borderRadius: BorderRadius.circular(OCornerRadius.xl),
                  ),
                  child: Center(
                    child: OCardLabels(
                      label: widget.tag1!.toUpperCase(),
                      icon: widget.tagIcon1!,
                      color:
                          widget.isDisabled ? OColor.gray400 : OColor.blue600,
                    ),
                  ),
                ),
                const SizedBox(width: OSpacing.m),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: OSpacing.xs,
                    vertical: OSpacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: OColor.gray100,
                    borderRadius: BorderRadius.circular(OCornerRadius.xl),
                  ),
                  child: Center(
                    child: OCardLabels(
                      label: widget.tag2!.toUpperCase(),
                      icon: widget.tagIcon2!,
                      color:
                          widget.isDisabled ? OColor.gray400 : OColor.green600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: OSpacing.s),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      TablerIcons.map_pin,
                      color:
                          widget.isDisabled ? OColor.gray400 : OColor.gray600,
                      size: 16,
                    ),
                    const SizedBox(width: OSpacing.xxs),
                    OText(
                      text: widget.location,
                      style: OTextStyle.labelSmall.copyWith(
                        color:
                            widget.isDisabled ? OColor.gray400 : OColor.gray600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: OSpacing.xxs),
                Row(
                  children: [
                    Icon(
                      TablerIcons.calendar,
                      color:
                          widget.isDisabled ? OColor.gray400 : OColor.gray600,
                      size: 16,
                    ),
                    const SizedBox(width: OSpacing.xxs),
                    OText(
                      text:
                          "${widget.date}, ${widget.startTime} - ${widget.endtime}",
                      style: OTextStyle.labelSmall.copyWith(
                        color:
                            widget.isDisabled ? OColor.gray400 : OColor.gray600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: OSpacing.s),
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(OCornerRadius.xl),
                    color: OColor.gray400,
                    image: DecorationImage(
                      image: NetworkImage(widget.hostImageUrl!),
                      fit: BoxFit.cover,
                      opacity: 1,
                    ),
                  ),
                ),
                const SizedBox(width: OSpacing.xs),
                OText(
                  text: widget.hostName!,
                  style: OTextStyle.labelSmall.copyWith(
                    color: widget.isDisabled ? OColor.gray600 : OColor.gray600,
                  ),
                ),
              ],
            ),
            _buildTypeSpecificContent(),
          ],
        ),
      ),
    };
  }

  Widget _buildTypeSpecificContent() {
    return switch (widget.type) {
      EventCardType.user => Column(
        children: [
          const SizedBox(height: OSpacing.s),
          Divider(color: OColor.gray200),
          const SizedBox(height: OSpacing.s),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: OSpacing.xxs),
              OText(
                text: "+ ${widget.attendance}",
                style: OTextStyle.labelXSmall.copyWith(
                  color: widget.isDisabled ? OColor.gray400 : OColor.blue600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: OSpacing.xs,
                  horizontal: OSpacing.s,
                ),
                decoration: BoxDecoration(
                  color: widget.isDisabled ? OColor.white : OColor.green600,
                  border: Border.all(
                    color:
                        widget.isDisabled ? OColor.gray400 : Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(OCornerRadius.l),
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {},
                  child: Center(
                    child: OCardLabels(
                      label: "I'm Going",
                      icon: TablerIcons.heart,
                      color: widget.isDisabled ? OColor.gray400 : OColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      EventCardType.admin => Column(
        children: [
          const SizedBox(height: OSpacing.xs),
          Divider(color: OColor.gray200),
          const SizedBox(height: OSpacing.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: widget.edit,
                icon: Icon(
                  TablerIcons.edit,
                  size: 16,
                  color: widget.isDisabled ? OColor.gray400 : OColor.green600,
                ),
                label: OText(
                  text: "Edit",
                  style: OTextStyle.labelSmall.copyWith(
                    color: widget.isDisabled ? OColor.gray400 : OColor.green600,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: widget.delete,
                icon: Icon(
                  TablerIcons.trash,
                  size: 16,
                  color: widget.isDisabled ? OColor.gray400 : OColor.red500,
                ),
                label: OText(
                  text: "Delete",
                  style: OTextStyle.labelSmall.copyWith(
                    color: widget.isDisabled ? OColor.gray400 : OColor.red500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    };
  }

  @override
  void dispose() {
    super.dispose();
  }
}
