import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_hidden_photo/Data/Model/image_processor.dart';

part 'home_cubit_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  Image image1 = Image.asset("assets/images/placeholder.png");
  Image image2 = Image.asset("assets/images/placeholder.png");
  PickedFile? file1;
  PickedFile? file2;

  bool decode1Available = false;
  bool decode2Available = false;
  bool codeAvailable = false;
  int codeDirection = 0;

  int bitsToUse = 2;
  int maxSideLength = 1000;

  late ImageProcessor _imageProcessor;

  HomeCubit() : super(HomeCubitState.loadingDefault()) {
    this._imageProcessor = ImageProcessor();
    emitMainState();
  }

  /// Emits HomeCubitState.main with the data stored in this object.
  void emitMainState() {
    emit(HomeCubitState.main(
        image1, image2, decode1Available, decode2Available, codeAvailable, codeDirection, bitsToUse, maxSideLength));
  }

  void imagePicked(PickedFile image, int slot) async {
    if (slot == 1) {
      file1 = image;
      image1 = Image.memory(await image.readAsBytes());
      decode1Available = true;
    } else {
      file2 = image;
      image2 = Image.memory(await image.readAsBytes());
      decode2Available = true;
    }
    if (decode1Available && decode2Available) {
      codeAvailable = true;
    }

    emitMainState();
  }

  void changeCodeDirection() {
    codeDirection = codeDirection == 0 ? 1 : 0;
    emitMainState();
  }

  void decode(int slot) {
    emit(HomeCubitState.computing(0));

    if (slot == 1) {
      // We know that file1 is not null, otherwise the user wouldn't have been able to press the decode button.
      _imageProcessor.decodeImage(file1!, bitsToUse).then((value) => emit(HomeCubitState.goToResults(value)));
    } else {
      _imageProcessor.decodeImage(file2!, bitsToUse).then((value) => emit(HomeCubitState.goToResults(value)));
    }
  }

  void code() async {
    emit(HomeCubitState.computing(0));
    late Image output;
    if (codeDirection == 0) {
      output = await _imageProcessor.encodeImage(file1!, file2!, bitsToUse, maxSideLength);
    } else {
      output = await _imageProcessor.encodeImage(file2!, file1!, bitsToUse, maxSideLength);
    }
    emit(HomeCubitState.goToResults(output));
  }

  /// Updates the encoding bytes number.
  ///
  /// - value : new value. Must be between 1 and 8 included.
  void bitNumberChanged(double value) {
    bitsToUse = value.floor();
    emitMainState();
  }

  void maxSideLengthChanged(double value) {
    maxSideLength = value.floor();
    emitMainState();
  }
}
