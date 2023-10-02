import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcamp/core/network/failure.dart';
import 'package:vcamp/core/services/api_services.dart';
import 'package:vcamp/models/user_meal_plan_model.dart';

part 'user_meal_plan_state.dart';

class UserMealPlanCubit extends Cubit<UserMealPlanState> {
  final ApiServices _client;
  UserMealPlanCubit(this._client) : super(UserMealPlanInitial());

  fetchUserMealPlan() async {
    if (state is! UserMealPlanFetchedState) {
      emit(UserMealPlanInitial());
    }
    final response = await _client.fetchUserMealPlan();
    emit(
      response.fold(
        (l) => UserMealPlanFetchedState(
          userMealPlan: l,
        ),
        (r) => UserMealPlanfetchErrorState(
          failure: r,
        ),
      ),
    );
  }
}
