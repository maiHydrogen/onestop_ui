import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';


class DropDownField extends StatefulWidget {
  final String label;
  final String hint;
  final List<String> items;
  final bool isEnabled;
  final String? value;
  final ValueChanged<String?>? onChanged;

  const DropDownField({
    Key? key,
    required this.label,
    required this.hint,
    required this.items,
    this.value,
    this.isEnabled = true,
    this.onChanged,
  }) : super(key: key);

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isExpanded = false;
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _toggleDropdown() {
    if (!_isExpanded) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    _overlayEntry = _createOverlayEntry();
    overlay.insert(_overlayEntry!);
    setState(() {
      _isExpanded = true;
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (_isExpanded) {
      setState(() {
        _isExpanded = false;
      });
    }
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height+8),
          child: Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(OCornerRadius.m),
            color: Colors.transparent,
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: 420,
              ),
              decoration: BoxDecoration(
                color: OColor.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(OCornerRadius.m),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(OCornerRadius.m),
                child: Scrollbar(
                  thumbVisibility: true,
                  radius: const Radius.circular(OCornerRadius.m),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.items.length,
                    itemBuilder: (context, index) {
                      final item = widget.items[index];
                      final isSelected = item == _selectedValue;

                      return InkWell(
                        onTap: () {
                          setState(() => _selectedValue = item);
                          widget.onChanged?.call(item);
                          _removeOverlay();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: OSpacing.m,
                            vertical: OSpacing.m,
                          ),
                          child: OText(
                            text: item,
                            style: OTextStyle.bodyLarge.copyWith(
                              color: isSelected ? OColor.green600:OColor.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final borderColor = _isExpanded ? OColor.green600:OColor.gray200;
    final backgroundColor = widget.isEnabled ? OColor.white:OColor.gray200;
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        // padding: EdgeInsetsGeometry.symmetric(vertical: 50),
        // height: 56,
        width: 358,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OText(
            text: widget.label,
            style: OTextStyle.bodyLarge
          ),
          const SizedBox(height: OSpacing.xs),
          GestureDetector(
            onTap: widget.isEnabled ? _toggleDropdown : null,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: OSpacing.m, vertical: OSpacing.m),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: borderColor, width: 2),
                borderRadius: BorderRadius.circular(OCornerRadius.m),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OText(
                    text: _selectedValue ?? widget.hint,
                    style: OTextStyle.labelMedium.copyWith(
                      color: OColor.green600,
                    ),
                  ),
                  Icon(
                    _isExpanded? Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,
                    color: OColor.green600,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
