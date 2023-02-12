import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../data/models/search_image_model.dart';
import '../../../data/repositories/search_image_repository_impl.dart';
import '../../../domain/repositories/search_image_repository.dart';

class PhotosController extends GetxController {
  PhotosController({SearchImageRepository? repository})
      : _repository = repository ?? SearchImageRepositoryImpl();

  final SearchImageRepository _repository;

  final _query = ''.obs;
  final documents = <ImageDocument>[].obs;
  var showErrorScreen = false.obs;

  final _formKey = GlobalKey<FormState>();
  var _load = false;
  var _searchInitialized = false;
  var _isPagingEnd = false;
  var _page = 1;

  GlobalKey<FormState> get formKey => _formKey;
  bool get load => _load;
  bool get searchInitialized => _searchInitialized;
  bool get showPagingIndicator {
    if (showErrorScreen.value) return false;
    if (_isPagingEnd) return false;
    if (!_searchInitialized) return false;
    return true;
  }

  @override
  void onInit() {
    super.onInit();

    debounce(
      _query,
      _searchImage,
      time: const Duration(seconds: 1),
    );
  }

  void _searchImage(_) async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    dismissKeyboard();

    documents.clear();
    _page = 1;
    _fetchImage();
  }

  void onPaging(VisibilityInfo info) async {
    final downScroll = info.visibleFraction != 0.0;
    final canRequest = downScroll && !_isPagingEnd;

    if (canRequest) {
      _page++;
      _fetchImage();
    }
  }

  Future<void> _fetchImage() async {
    try {
      _load = true;
      showErrorScreen(false);

      final result = await _repository.searchImage(
        query: _query.value,
        size: 30,
        page: _page,
      );

      _searchInitialized = true;
      _isPagingEnd = result.isEnd;

      documents.addAll(result.documents);
    } catch (e) {
      showErrorScreen(true);

      e.printError();
    } finally {
      _load = false;
    }
  }

  void onSearchQuery(String query) {
    _query(query);
  }

  void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
