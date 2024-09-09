import 'package:bloc_project/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';
import '../services/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  final UsersRepository usersRepository;
  UserCubit(this.usersRepository) : super(UserEmptyState());

  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());
      // ignore: no_leading_underscores_for_local_identifiers
      final List<User> _loadedUserList = await usersRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: _loadedUserList));
    } catch (_) {
      emit(UserErrorState());
    }
  }

  Future<void> clearUsers() async {
    emit(UserEmptyState());
  }
}
