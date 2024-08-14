
import 'package:dio/dio.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/explore/data/models/categories_response.dart';
import 'package:retrofit/retrofit.dart';
part 'explore_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ExploreApiService {

  factory ExploreApiService(Dio dio, {String baseUrl}) = _ExploreApiService;

  @GET('categories')
  Future<CategoriesResponse> getCategories();
}
