import 'dart:ffi';

import 'package:my_app/core/data/datasources/i_base_datasource.dart';
import 'package:my_app/core/domain/base_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/core/domain/base_model_convert.dart';
import 'package:my_app/core/usecase/erros/failures.dart';

abstract class IBaseRepository<T extends BaseEntity, M extends BaseEntity, ID> {
  Future<Either<Failure, List<T>>> getAll();
  Future<Either<Failure, T>> get();
  Future<Either<Failure, T>> create(T t);
  Future<Either<Failure, T>> update(T t);
  Future<void> delete(ID id);
  ModelConvert<T, M> getModelConvert();
}
