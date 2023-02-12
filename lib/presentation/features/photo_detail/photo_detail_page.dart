import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/search_image_model.dart';

class PhotoDetailPage extends StatelessWidget {
  const PhotoDetailPage({super.key, required this.document});

  final ImageDocument document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ExtendedImage.network(
              document.imageUrl,
              fit: BoxFit.fitWidth,
              width: Get.width,
              cacheWidth: Get.width.toInt(),
              cache: true,
              clearMemoryCacheIfFailed: true,
              clearMemoryCacheWhenDispose: true,
            ),
            Visibility(
              visible: document.displaySitename.isNotEmpty,
              child: Text(
                '데이터 출처: ${document.displaySitename}',
              ),
            ),
            Visibility(
              visible: document.datetime.toString().isNotEmpty,
              child: Text(
                '문서 작성 시간: ${document.datetime.toString().split('.').first}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
