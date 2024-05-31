import 'package:spotlight/core/networking/api_constants.dart';
import 'package:spotlight/core/networking/api_error_handler.dart';
import 'package:spotlight/core/networking/api_result.dart';
import 'package:spotlight/core/networking/api_service.dart';
import 'package:spotlight/features/articles_source/data/models/source_model.dart';

class SourceRepository {
  final ApiService service;
  SourceRepository(this.service);
  Future<ApiResult<Sources>> getSources({
    required String country,
    required String category,
  }) async {
    try {
      Sources sources = await service.getSources(
        apiKey: ApiConstants.apiKey,
        country: country,
        category: category,
      );
      return ApiResult.success(sources);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
