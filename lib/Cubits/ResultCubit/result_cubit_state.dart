part of 'result_cubit.dart';

@freezed
class ResultCubitState with _$ResultCubitState {
  factory ResultCubitState.loadingResult(int percentage) = _loadingResult;
  factory ResultCubitState.loaded(Image image) = _loaded;
}
