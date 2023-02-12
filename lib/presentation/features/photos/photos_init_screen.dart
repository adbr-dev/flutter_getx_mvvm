import 'package:flutter/cupertino.dart';

class PhotosInitScreen extends StatelessWidget {
  const PhotosInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        CupertinoIcons.arrow_up,
        size: 40,
      ),
    );
  }
}
