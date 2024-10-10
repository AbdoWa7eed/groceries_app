import 'package:dio/dio.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/reviews/data/models/add_review_request.dart';
import 'package:groceries_app/features/reviews/data/models/reviews_response.dart';
import 'package:groceries_app/features/reviews/data/models/single_view_response.dart';
import 'package:retrofit/http.dart';

part 'reviews_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ReviewsApiService {
  factory ReviewsApiService(Dio dio, {String? baseUrl}) = _ReviewsApiService;

  @POST('reviews/')
  Future<SingleReviewResponse> addReview(
    @Body() ReviewRequest reviewRequest,
  );

  @GET('reviews/{productId}')
  Future<ReviewsResponse> getReviews(
    @Path('productId') String productId,
  );

  @PUT('reviews/{productId}')
  Future<SingleReviewResponse> editReview(
    @Path('productId') String productId,
    @Body() ReviewRequest reviewRequest,
  );

  @DELETE('reviews/{productId}')
  Future<SingleReviewResponse> deleteReview(
    @Path('productId') String reviewId,
  );
}
