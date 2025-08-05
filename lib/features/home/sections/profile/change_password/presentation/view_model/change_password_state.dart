class ChangePasswordState {
  final bool isLoading;
  final String? successMessage;
  final String? errorMessage;

  const ChangePasswordState({
    this.isLoading = false,
    this.successMessage,
    this.errorMessage,
  });

  ChangePasswordState copyWith({
    bool? isLoading,
    String? successMessage,
    String? errorMessage,
  }) {
    return ChangePasswordState(
      isLoading: isLoading ?? this.isLoading,
      successMessage: successMessage,
      errorMessage: errorMessage,
    );
  }

  factory ChangePasswordState.initial() => const ChangePasswordState();
}
