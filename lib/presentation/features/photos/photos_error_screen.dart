import 'package:flutter/material.dart';

class PhotosErrorScreen extends StatelessWidget {
  const PhotosErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '다른 검색어로 검색해주세요.',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
