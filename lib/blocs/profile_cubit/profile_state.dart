part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileFetchedState extends ProfileState {
  final ProfileModel profileModel;
  ProfileFetchedState({
    required this.profileModel,
  });
}

class ProfileFetchErrorState extends ProfileState {
  final Failure failure;
  ProfileFetchErrorState({
    required this.failure,
  });
}
