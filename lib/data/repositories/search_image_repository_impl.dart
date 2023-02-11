import 'package:http/http.dart';

import '../../domain/repositories/search_image_repository.dart';
import '../models/search_image_model.dart';
import '../sources/api_client.dart';

class SearchImageRepositoryImpl implements SearchImageRepository {
  final _api = ApiClient(client: Client());

  @override
  Future<SearchImageModel> searchImage({
    required String query,
    String? sort,
    int? page,
    int? size,
  }) {
    return _api.searchImage(
      query: query,
      sort: sort,
      page: page,
      size: size,
    );
  }
}
