import 'package:flutter/material.dart';
import '../../constants/corner_radius.dart';


enum ImagePreviewType {
  square,
  rectangle,
  circle,
}

class OnestopImagePreview extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxShape shape;
  final BoxFit fit;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final ImagePreviewType? previewType;
  final VoidCallback? onTap;
  const OnestopImagePreview({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.shape = BoxShape.rectangle,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.borderRadius,
    this.previewType,
    this.onTap,
  });

  double getHeight() {
    if (previewType != null) {
      switch (previewType!) {
        case ImagePreviewType.square:
          return 300;
        case ImagePreviewType.rectangle:
          return 200;
        case ImagePreviewType.circle:
          return 300;
      }
    }
    return height ?? 100;
  }

  double getWidth() {
    if (previewType != null) {
      switch (previewType!) {
        case ImagePreviewType.square:
        case ImagePreviewType.circle:
          return 300;
        case ImagePreviewType.rectangle:
          return 300;
      }
    }
    return width ?? 100;
  }

  BoxShape getShape() {
    if (previewType != null) {
      return previewType == ImagePreviewType.circle ? BoxShape.circle : BoxShape.rectangle;
    }
    return shape;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: getHeight(),
        width: getWidth(),
        decoration: BoxDecoration(
          shape: getShape(),
          borderRadius: getShape() == BoxShape.circle ? null : borderRadius ?? BorderRadius.circular(OCornerRadius.m),
          color: backgroundColor ?? Colors.grey[200],
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: fit,
          ),
        ),
      ),
    );
  }
}