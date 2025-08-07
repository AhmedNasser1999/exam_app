class ProfileState {
  final bool isLoading;
  final String? successMessage;
  final String? errorMessage;

  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  const ProfileState({
    this.isLoading = false,
    this.successMessage,
    this.errorMessage,
    this.username = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
  });

  ProfileState copyWith({
    bool? isLoading,
    String? successMessage,
    String? errorMessage,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      successMessage: successMessage,
      errorMessage: errorMessage,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  factory ProfileState.initial() => const ProfileState();
}
