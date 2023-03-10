import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/animation/animation_preferences.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/util_size.dart';
import '../../utils/util_validator.dart';
import 'photos_controller.dart';
import 'photos_empty_screen.dart';
import 'photos_error_screen.dart';
import 'photos_init_screen.dart';

class PhotosPage extends GetView<PhotosController> {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.dismissKeyboard,
      child: Scaffold(
        body: Obx(
          (() => CustomScrollView(
                cacheExtent: Get.height * 2,
                slivers: [
                  SliverAppBar(
                    toolbarHeight: 90,
                    floating: true,
                    title: Form(
                      key: controller.formKey,
                      child: TextFormField(
                        autofocus: true,
                        decoration: _inputDecoration,
                        cursorHeight: 22.0,
                        validator: UtilValidator.displayNameValidator,
                        textInputAction: TextInputAction.search,
                        onChanged: controller.onSearchQuery,
                      ),
                    ),
                  ),
                  _buildBody(),
                  if (controller.showPagingIndicator)
                    SliverToBoxAdapter(
                      child: VisibilityDetector(
                        key: const Key('load-more-line'),
                        onVisibilityChanged: controller.onPaging,
                        child: const SizedBox(
                          height: 50,
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                    ),
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (!controller.searchInitialized) {
      return const SliverToBoxAdapter(
        child: PhotosInitScreen(),
      );
    }
    if (controller.showErrorScreen) {
      return const SliverToBoxAdapter(
        child: PhotosErrorScreen(),
      );
    }
    if (controller.showEmptyScreen) {
      return const SliverToBoxAdapter(
        child: PhotosEmptyScreen(),
      );
    }

    return SliverGrid(
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
    );
  }

  Widget _buildGridTile(_, int index) {
    final imageSize = Get.width * 1 / 3;
    final url = controller.documents[index].imageUrl;

    return GestureDetector(
      onTap: () => controller.onPushDetailPage(index),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2.0),
        child: ExtendedImage.network(
          url,
          cacheWidth: imageSize.toInt(),
          cacheHeight: imageSize.toInt(),
          cache: true,
          clearMemoryCacheIfFailed: true,
          clearMemoryCacheWhenDispose: true,
          compressionRatio: .5,
          loadStateChanged: (state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                return const Icon(CupertinoIcons.photo);
              case LoadState.completed:
                return FadeIn(
                  preferences: const AnimationPreferences(
                    duration: Duration(milliseconds: 500),
                  ),
                  child: ExtendedRawImage(
                    key: Key(url),
                    image: state.extendedImageInfo?.image,
                    fit: BoxFit.cover,
                    width: imageSize,
                    height: imageSize,
                  ),
                );
              case LoadState.failed:
                return const Icon(CupertinoIcons.eye_slash_fill);
            }
          },
        ),
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
      hintText: '????????? ???????????? ??????????????????.',
      enabledBorder: border,
      focusedBorder: border,
      errorBorder: border.copyWith(
        borderSide: BorderSide(color: Colors.red[600]!),
      ),
      border: border,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      prefixIcon: const Icon(
        CupertinoIcons.search,
        size: 16,
      ),
    );
  }
}
