import 'package:get/get.dart';

import '../../../data/repositories/search_image_repository_impl.dart';
import '../../../domain/repositories/search_image_repository.dart';

class PhotosController extends GetxController {
  PhotosController({SearchImageRepository? repository})
      : _repository = repository ?? SearchImageRepositoryImpl();

  final SearchImageRepository _repository;
  final _query = ''.obs;

  @override
  void onInit() {
    super.onInit();

    debounce(
      _query,
      _searchImage,
      time: const Duration(seconds: 1),
    );
  }

  void _searchImage(query) async {
    print('[debounce] $query');
    final result = await _repository.searchImage(
      query: query,
      size: 30,
    );
    print('[debounce] ${result.documents.length}');
  }

  void onSearchQuery(String query) {
    _query(query);
  }
}
