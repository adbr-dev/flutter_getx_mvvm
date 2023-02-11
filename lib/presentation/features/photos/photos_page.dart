import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../utils/util_size.dart';
import 'photos_controller.dart';

class PhotosPage extends GetView<PhotosController> {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: _inputDecoration,
          cursorHeight: 22.0,
          onChanged: controller.onSearchQuery,
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: 300,
        itemBuilder: (_, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              color: Colors.purpleAccent,
              child: Center(
                child: Text('$index'),
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration get _inputDecoration => InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
        hintText: '검색할 키워드를 입력해주세요.',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            UtilSize.borderRadius,
          ),
        ),
        focusedBorder: InputBorder.none,
      );
}
