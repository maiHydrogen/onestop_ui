import 'package:flutter/material.dart';

class ImageSelector extends StatefulWidget {
  final String imageUrl;
  final double size;
  final double borderWidth;
  const ImageSelector({
    super.key,
    required this.imageUrl,
    this.size = 40,
    this.borderWidth = 2,
  });
  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  bool _isSelected=false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected=!_isSelected;
        });
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          border: Border.all(
            color: _isSelected? Colors.green : Colors.transparent,
            width: widget.borderWidth,
          ),
          image: DecorationImage(
            image: NetworkImage(widget.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}