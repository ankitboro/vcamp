import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcamp/core/helpers/show_toast.dart';
import 'package:vcamp/core/network/failure.dart';
import 'package:vcamp/core/services/api_services.dart';
import 'package:vcamp/models/user_meal_plan_model.dart';

part 'user_meal_plan_state.dart';

class UserMealPlanCubit extends Cubit<UserMealPlanState> {
  final ApiServices _client;
  UserMealPlanCubit(this._client) : super(UserMealPlanInitial());

  generateUserMealPlan() async {
    if (state is! UserMealPlanFetchedState) {
      emit(UserMealPlanInitial());
    }
    final response = await _client.generateUserMealPlan();
    emit(
      response.fold(
        (l) {
          showSuccessToast(l.message.toString());
          // return UserMealPlanGenerateSuccessState(
          //   message: l.message.toString(),
          // );
          return fetchUserMealPlan();
        },
        (r) {
          showErrorToast(r.message.toString());
          return UserMealPlanGenerateFailureState(
            errorMsg: r.message.toString(),
          );
        },
      ),
    );
  }

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
