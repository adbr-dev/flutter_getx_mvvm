import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/models/search_image_model.dart';
import '../../../data/repositories/search_image_repository_impl.dart';
import '../../../domain/repositories/search_image_repository.dart';

class PhotosController extends GetxController {
  PhotosController({SearchImageRepository? repository})
      : _repository = repository ?? SearchImageRepositoryImpl();

  final SearchImageRepository _repository;
  final _query = ''.obs;
  final documents = <ImageDocument>[].obs;

  final _formKey = GlobalKey<FormState>();
  var _searchInitialized = false;
  var _isPagingEnd = false;

  GlobalKey<FormState> get formKey => _formKey;
  bool get showPagingIndicator {
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

  void _searchImage(query) async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    dismissKeyboard();

    log('[debounce] query $query (${documents.length})');
    final result = await _repository.searchImage(
      query: query,
      size: 30,
    );

    _searchInitialized = true;
    _isPagingEnd = result.isEnd;

    documents(result.documents);
  }

  void onSearchQuery(String query) {
    _query(query);
  }

  void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
