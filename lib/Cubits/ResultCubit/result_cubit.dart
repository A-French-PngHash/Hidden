import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_cubit_state.dart';
part 'result_cubit.freezed.dart';

class ResultCubit extends Cubit<ResultCubitState> {
  final Image image;
  ResultCubit(this.image) : super(ResultCubitState.loadingResult(0));

  void download() {
    
  }
}
