sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileSuccess extends ProfileState {}

class ProfileFailure extends ProfileState {
  final String errorMassage;

  ProfileFailure({required this.errorMassage});
}

class ProfileLoading extends ProfileState {}
class ProfileUpdateSuccess extends ProfileState {}

class ProfileUpdateFailure extends ProfileState {
  final String errorMassage;

  ProfileUpdateFailure({required this.errorMassage});
}

class ProfileUpdateLoading extends ProfileState {}
