class ProfileState {
  final bool isLoading;
  final String? successMessage;
  final String? errorMessage;

  const ProfileState({
    this.isLoading = false,
    this.successMessage,
    this.errorMessage,
  });

  ProfileState copyWith({
    bool? isLoading,
    String? successMessage,
    String? errorMessage,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      successMessage: successMessage,
      errorMessage: errorMessage,
    );
  }

  factory ProfileState.initial() => const ProfileState();
}
