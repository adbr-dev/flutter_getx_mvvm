import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/features/photos/photos_page.dart';
import 'presentation/utils/util_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: UtilColors.main,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PhotosPage(),
    );
  }
}
