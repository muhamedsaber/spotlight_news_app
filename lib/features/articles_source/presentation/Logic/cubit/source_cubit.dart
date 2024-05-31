import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/core/networking/api_result.dart';
import 'package:spotlight/core/utils/country_util.dart';
import 'package:spotlight/features/articles_source/data/models/source_model.dart';
import 'package:spotlight/features/articles_source/data/repository/source_repository.dart';
import 'package:spotlight/features/articles_source/presentation/Logic/cubit/source_state.dart';

class SourceCubit extends Cubit<SourceState> {
  SourceCubit(
    this.sourceRepository,
  ) : super(const SourceState.initial());
  final SourceRepository sourceRepository;

  Future<String> _getCountryNameFromDataBase() async {
    String countryName =
        await getIt<CountryUtil>().getCountryNameFromDataBase();
    return countryName;
  }

  getSources({String? category}) async {
    emit(const SourceState.loading());
    String countryName = await _getCountryNameFromDataBase();
    ApiResult<Sources> sources = await sourceRepository.getSources(
        country: countryName, category: category ?? "general");
    sources.when(
        success: (sources) => emit(SourceState.success(sources)),
        failure: (error) => emit(SourceState.error(
            error.apiErrorModel.message ?? "Error Occurred")));
  }
}
