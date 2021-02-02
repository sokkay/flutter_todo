import 'package:TodoApp/models/category.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(const MainScreenState());

  void changePage(int page, {Category category}) {
    emit(state.copyWith(currentPage: page, category: category));
  }
}
