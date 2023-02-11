import 'package:flutter/material.dart';

import '../../utils/util_size.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: _inputDecoration,
          cursorHeight: 22.0,
        ),
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
