import 'package:flutter/material.dart';
import '../../constants/spacing.dart';
import '../../constants/corner_radius.dart';
import 'image_preview.dart';

class OnestopImageGallery extends StatelessWidget {
  final List<String> imageUrls;
  final double imageSize;
  final Axis scrollDirection;
  final BoxShape shape;
  final ImagePreviewType previewType;
  const OnestopImageGallery({
    super.key,
    required this.imageUrls,
    this.imageSize = 100,
    this.scrollDirection = Axis.horizontal,
    this.shape = BoxShape.rectangle,
    this.previewType = ImagePreviewType.square,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      padding: const EdgeInsets.all(OSpacing.s),
      child: Row(
        children: imageUrls
            .map(
              (url) => Padding(
            padding: const EdgeInsets.all(OSpacing.xs),
            child: OnestopImagePreview(
              imageUrl: url,
              height: imageSize,
              width: imageSize,
              shape: shape,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    backgroundColor: Colors.transparent,
                    child: Center(
                      child: OnestopImagePreview(
                        imageUrl: url,
                        previewType: previewType,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ).toList(),
      ),
    );
  }
}

class OnestopLargeImageGallery extends StatelessWidget {
  final List<String> imageUrls;
  final ImagePreviewType previewType;

  const OnestopLargeImageGallery({
    super.key,
    required this.imageUrls,
    required this.previewType,
    // this.previewType = ImagePreviewType.square,
  });

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final visibleImageWidth = totalWidth - 76;
    final controller = PageController(viewportFraction: visibleImageWidth / totalWidth);
    final imageHeight = previewType == ImagePreviewType.rectangle ? 200.0:300.0;
    return SizedBox(
      height: imageHeight,
      child: PageView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          final isCircle = previewType == ImagePreviewType.circle;
          final imageWidget = OnestopImagePreview(
            imageUrl: imageUrls[index],
            previewType: previewType,
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  backgroundColor: Colors.transparent,
                  child: Center(
                    child: OnestopImagePreview(
                      imageUrl: imageUrls[index],
                      previewType: previewType,
                    ),
                  ),
                ),
              );
            },
          );
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: OSpacing.xs),
            child: isCircle? imageWidget:ClipRRect(
              borderRadius: BorderRadius.circular(OCornerRadius.m),
              child: imageWidget,
            ),
          );
        },
      ),
    );
  }
}

class OnestopMediumImageGallery extends StatelessWidget {
  final List<String> imageUrls;
  final ImagePreviewType previewType;

  const OnestopMediumImageGallery({
    super.key,
    required this.imageUrls,
    required this.previewType,
    // this.previewType = ImagePreviewType.square,
  });

  @override
  Widget build(BuildContext context) {
    return OnestopImageGallery(
      imageUrls: imageUrls,
      imageSize: 108,
      previewType: previewType,
    );
  }
}

class SingleImageGallery extends StatelessWidget {
  final String imageUrl;
  final ImagePreviewType previewType;

  const SingleImageGallery({
    super.key,
    required this.imageUrl,
    required this.previewType,
    // this.previewType = ImagePreviewType.square,
  });

  @override
  Widget build(BuildContext context) {
    return OnestopImageGallery(
      imageUrls: [imageUrl],
      imageSize: 320,
      previewType: previewType,
    );
  }
}