import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/core/usecase/erros/failures.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class TwoInputParams<Input1, Input2> extends Equatable {
  final Input1 input1;
  final Input2 input2;

  TwoInputParams(this.input1, this.input2);

  @override
  List<Object> get props => [];
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
