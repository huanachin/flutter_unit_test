abstract class ResultType<T, V> {}

class RSuccess<T, V> extends ResultType<T, V> {
  final T data;

  RSuccess(this.data);
}

class RError<T, V> extends ResultType<T, V> {
  final V? error;
  final T? data;

  RError(this.error, [this.data]);
}

extension ResultTypeExtension<T, V> on ResultType<T, V> {
  void when({
    required Function(T data) onSuccess,
    required Function(V error, T? data) onError,
  }) {
    Object result = this;
    if (result is RSuccess) {
      onSuccess(result.data);
    } else if (result is RError) {
      onError(result.error, result.data);
    }
  }
}
