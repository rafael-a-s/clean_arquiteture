typedef FromJson<T> = T Function(Map<String, dynamic> data);
typedef ToJson<T> = Map<String, dynamic> Function(T model);

class JsonModelConvert<T> {
  FromJson<T> fromJson;
  ToJson<T> toJson;

  JsonModelConvert({required this.fromJson, required this.toJson});
}
