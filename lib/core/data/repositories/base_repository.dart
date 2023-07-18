import 'dart:ffi';

import 'package:my_app/core/data/datasources/i_base_datasource.dart';
import 'package:my_app/core/data/repositories/i_base_repository.dart';
import 'package:my_app/core/domain/base_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/core/domain/base_model_convert.dart';
import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/core/usecase/erros/failures.dart';

abstract class BaseRepository<T extends BaseEntity, M extends BaseEntity, ID>
    extends IBaseRepository<T, M, ID> {
  late final IBaseDatasource datasource;

  BaseRepository({required this.datasource});

  @override
  Future<Either<Failure, List<T>>> getAll() async {
    try {
      final result = await datasource.getAll();
      final ModelConvert<T, M> convert = getModelConvert();
      return Right(
          result.map((value) => convert.fromEntity(value as M)).toList());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, T>> get() async {
    try {
      final result = await datasource.get(ID);
      final ModelConvert<T, M> convert = getModelConvert();
      return Right(convert.fromEntity(result as M));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, T>> create(T t) async {
    try {
      final ModelConvert<T, M> convert = getModelConvert();
      final result = await datasource.create(convert.toModel(t));
      return Right(convert.fromEntity(result as M));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, T>> update(T t) async {
    try {
      final ModelConvert<T, M> convert = getModelConvert();
      final result = await datasource.update(convert.toModel(t));
      return Right(convert.fromEntity(result as M));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<void> delete(ID id) async {
    try {
      await datasource.delete(id);
    } on ServerException {
      Left(ServerFailure());
    }
  }
}
