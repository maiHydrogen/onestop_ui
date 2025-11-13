import 'package:flutter/material.dart';
import 'package:onestop_ui/components/images/image_gallery.dart';
import 'package:onestop_ui/components/images/image_preview.dart';
import 'package:onestop_ui/components/images/image_selector.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final demoImages = [
      'https://picsum.photos/400/200?image=1',
      'https://picsum.photos/400/200?image=2',
      'https://picsum.photos/400/200?image=3',
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          SingleImageGallery(
            imageUrl: 'https://picsum.photos/400/200?image=1',
            previewType: ImagePreviewType.circle, // only used on click
          ),
          SizedBox(height: 20),
          OnestopLargeImageGallery(
            imageUrls: demoImages,
            previewType: ImagePreviewType.square,
          ),
          Divider(),
          OnestopMediumImageGallery(
            imageUrls: demoImages,
            previewType: ImagePreviewType.rectangle,
          ),
          OnestopMediumImageGallery(
            imageUrls: demoImages,
            previewType: ImagePreviewType.rectangle,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                // SizedBox(width: 20,),
                ImageSelector(
                  imageUrl: 'https://picsum.photos/400/200?image=6',
                  // size: 40,
                ),
                ImageSelector(
                  imageUrl: 'https://picsum.photos/400/200?image=6',
                  // size: 40,
                ),
                ImageSelector(
                  imageUrl: 'https://picsum.photos/400/200?image=6',
                  // size: 40,
                ),
                ImageSelector(
                  imageUrl: 'https://picsum.photos/400/200?image=6',
                  // size: 40,
                ),
                ImageSelector(
                  imageUrl: 'https://picsum.photos/400/200?image=6',
                  // size: 40,
                ),
                // SizedBox(width: 20,),
              ]
          ),
          SizedBox(height: 8,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                // SizedBox(width: 20,),
                ImageSelector(
                  imageUrl: 'https://picsum.photos/400/200?image=6',
                  // size: 40,
                ),
                ImageSelector(
                  imageUrl: 'https://picsum.photos/400/200?image=6',
                  // size: 40,
                ),
                ImageSelector(
                  imageUrl: 'https://picsum.photos/400/200?image=6',
                  // size: 40,
                ),
                ImageSelector(
                  imageUrl: 'https://picsum.photos/400/200?image=6',
                  // size: 40,
                ),
                ImageSelector(
                  imageUrl: 'https://picsum.photos/400/200?image=6',
                  // size: 40,
                ),
                // SizedBox(width: 20,),
              ]
          ),
        ],
      ),
    );
  }
}