import 'package:dio/dio.dart';
import 'package:my_app/core/domain/base_entity.dart';
import 'package:my_app/core/domain/base_json_convert.dart';

abstract class IBaseDatasource<T extends BaseEntity, ID> {
  final String api;

  IBaseDatasource({required this.api});

  Future<List<T>> getAll();

  Future<T> get(ID id);

  Future<T> create(T model);

  Future<T> update(T model);

  Future<void> delete(ID id);

  JsonModelConvert<T> getJsonConvert();
}
