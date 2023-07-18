typedef FromEntity<T, M> = T Function(M model);
typedef ToModel<T, M> = M Function(T entity);

class ModelConvert<T, M> {
  FromEntity<T, M> fromEntity;
  ToModel<T, M> toModel;

  ModelConvert({required this.fromEntity, required this.toModel});
}
