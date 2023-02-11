import 'package:get/get.dart';

class PhotosController extends GetxController {
  final _query = ''.obs;

  @override
  void onInit() {
    super.onInit();

    debounce(
      _query,
      (v) => print('debounce $v'),
      time: const Duration(seconds: 1),
    );
  }

  void onSearchQuery(String query) {
    _query(query);
  }
}
