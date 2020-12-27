import 'dart:async';

import 'package:TodoApp/models/category.dart';
import 'package:TodoApp/models/status.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryState());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is CategoryGet) {
      yield* mapCategoryGetToState();
    }
    if (event is CategoryAdd) {
      yield* mapCategoryAddToState(event.category);
    }
    if (event is CategoryUpdate) {
      yield* mapCategoryUpdateToState(event.category);
    }
    if (event is CategoryDelete) {
      yield* mapCategoryDeleteToState(event.category);
    }
  }

  Stream<CategoryState> mapCategoryGetToState() async* {
    yield state.copyWith();
  }

  Stream<CategoryState> mapCategoryAddToState(Category category) async* {
    yield state.copyWith(categories: [...state.categories, category]);
    print(state.categories);
  }

  Stream<CategoryState> mapCategoryUpdateToState(Category category) async* {
    yield state.copyWith(
        categories: state.categories
            .map((cat) => cat.id == category.id ? category : cat));
  }

  Stream<CategoryState> mapCategoryDeleteToState(Category category) async* {
    yield state.copyWith(
        categories: state.categories.where((cat) => cat.id != category.id));
  }
}
