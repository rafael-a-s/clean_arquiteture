abstract class BaseState<T> {
  BaseState({
    required this.isLoading,
    this.error,
  });

  final bool isLoading;
  final String? error;
}
