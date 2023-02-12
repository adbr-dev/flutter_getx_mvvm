import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/features/photos/photos_controller.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: UtilColors.main,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: UtilColors.main,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialBinding: BindingsBuilder.put(() => PhotosController()),
      home: const PhotosPage(),
    );
  }
}
