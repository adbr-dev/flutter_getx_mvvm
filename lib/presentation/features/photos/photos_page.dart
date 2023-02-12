import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/util_size.dart';
import 'photos_controller.dart';

class PhotosPage extends GetView<PhotosController> {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.dismissKeyboard,
      child: Scaffold(
        body: Obx(
          () => CustomScrollView(
            cacheExtent: Get.height * 2,
            slivers: [
              SliverAppBar(
                title: TextField(
                  autofocus: true,
                  decoration: _inputDecoration,
                  cursorHeight: 22.0,
                  onChanged: controller.onSearchQuery,
                ),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  _buildGridTile,
                  addRepaintBoundaries: true,
                  addSemanticIndexes: true,
                  addAutomaticKeepAlives: true,
                  childCount: controller.documents.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridTile(_, int index) {
    final imageSize = Get.width * 1 / 3;

    return ClipRRect(
      borderRadius: BorderRadius.circular(2.0),
      child: ExtendedImage.network(
        controller.documents[index].imageUrl,
        fit: BoxFit.cover,
        width: imageSize,
        height: imageSize,
        cacheWidth: imageSize.toInt(),
        cacheHeight: imageSize.toInt(),
        cache: true,
        clearMemoryCacheIfFailed: true,
        clearMemoryCacheWhenDispose: true,
        compressionRatio: .5,
      ),
    );
  }

  InputDecoration get _inputDecoration {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        UtilSize.borderRadius,
      ),
      borderSide: BorderSide.none,
    );

    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[100],
      hintText: '검색할 키워드를 입력해주세요.',
      enabledBorder: border,
      focusedBorder: border,
      border: border,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      prefixIcon: const Icon(
        CupertinoIcons.search,
        size: 16,
      ),
    );
  }
}
