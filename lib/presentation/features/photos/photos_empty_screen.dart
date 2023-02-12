import 'package:flutter/material.dart';

class PhotosEmptyScreen extends StatelessWidget {
  const PhotosEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '검색 결과가 없습니다.',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
