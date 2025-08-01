abstract class BaseState<T> {
  final String? errorMessage;
  final T? data;
  final bool? isLoading;

  BaseState({this.errorMessage, this.data, this.isLoading});
}
