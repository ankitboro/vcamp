import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcamp/core/network/failure.dart';
import 'package:vcamp/core/services/api_services.dart';
import 'package:vcamp/models/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ApiServices _client;
  ProfileCubit(this._client) : super(ProfileInitial());
  fetchProfile() async {
    if (state is! ProfileFetchedState) {
      emit(ProfileInitial());
    }
    final response = await _client.fetchProfile();
    emit(
      response.fold(
        (l) => ProfileFetchedState(
          profileModel: l,
        ),
        (r) => ProfileFetchErrorState(
          failure: r,
        ),
      ),
    );
  }
}