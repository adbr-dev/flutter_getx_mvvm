import '../../data/models/search_image_model.dart';

abstract class SearchImageRepository {
  /// search-image
  /// https://developers.kakao.com/docs/latest/ko/daum-search/dev-guide#search-image
  Future<SearchImageModel> searchImage(
      {required String query, String? sort, int? page, int? size});
}
