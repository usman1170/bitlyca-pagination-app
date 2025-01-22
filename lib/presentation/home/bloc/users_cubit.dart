import 'package:bitlyca_app/data/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:bitlyca_app/data/repositories/user_repository.dart';
import 'package:bitlyca_app/presentation/home/bloc/users_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  int _page = 1;
  final int _results = 10;

  UserCubit(this.userRepository) : super(UserInitial());
  Future<void> fetchUsers({bool loadMore = false}) async {
    if (state is UserLoading) return;
    if (!loadMore) {
      emit(UserLoading());
    }
    try {
      final users = await userRepository.fetchUsers(_page, _results);
      if (loadMore) {
        final currentState = state;
        if (currentState is UserLoaded) {
          final updatedUsers = List<UserModel>.from(currentState.users)
            ..addAll(users);
          emit(UserLoaded(users: updatedUsers));
        }
      } else {
        emit(UserLoaded(users: users));
      }
      _page++;
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }
}
