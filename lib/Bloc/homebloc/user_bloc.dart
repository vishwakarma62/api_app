import 'dart:async';

import 'package:api_app/model/model.dart';
import 'package:api_app/repo/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final MyRepository repository;
  UserBloc({required this.repository}) : super(UserLoadingState()) {
    on<UserLoadingEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await repository.fetchData();
        emit(UserLoadedState(userdata: users));
        print(users);
      } catch (e) {
        print(e);
        emit(UserErrorState(error: e.toString()));
      }
    });
  }
}
