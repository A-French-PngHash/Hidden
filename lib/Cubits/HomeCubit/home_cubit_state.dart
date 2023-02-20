part of 'home_cubit.dart';

@freezed
class HomeCubitState with _$HomeCubitState {
  factory HomeCubitState.loadingDefault() = _LoadingDefault;

  /// image1 : Displayed on the left.
  /// image2 : Displayed on the right.
  /// decode1Available : True if the left decode button should not be available.
  /// decode2Available :
  /// codeDirection : If 0 then the left image will be hidden into the right one, if 1 the other way.
  factory HomeCubitState.main(Image image1, Image image2, bool decode1Available, bool decode2Available,
      bool codeAvailable, int codeDirection, int bitsToUse, int maxSideLength) = _Main;

  factory HomeCubitState.computing(double percentage) = _Computing;
  factory HomeCubitState.goToResults(Image image) = _GoToResults;
}
