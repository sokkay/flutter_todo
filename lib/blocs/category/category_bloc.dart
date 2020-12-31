import 'dart:async';

import 'package:TodoApp/models/category.dart';
import 'package:TodoApp/models/status.dart';
import 'package:TodoApp/repositories/categories_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(CategoriesRepository categoriesRepository)
      : assert(categoriesRepository != null),
        this._categoriesRepository = categoriesRepository,
        super(CategoryState());

  final CategoriesRepository _categoriesRepository;
  StreamSubscription _categoriesSubscription;

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
    if (event is CategoryCategoriesUpdate) {
      yield* mapCategoryCategoriesUpdatetoState(event);
    }
  }

  @override
  Future<void> close() {
    _categoriesSubscription?.cancel();
    return super.close();
  }

  Stream<CategoryState> mapCategoryGetToState() async* {
    yield state.copyWith(status: Status.loading);
    _categoriesSubscription?.cancel();
    _categoriesSubscription = _categoriesRepository.getCategories().listen(
          (categories) => add(CategoryCategoriesUpdate(categories: categories)),
        );
  }

  Stream<CategoryState> mapCategoryAddToState(Category category) async* {
    _categoriesRepository.addCategory(category);
  }

  Stream<CategoryState> mapCategoryUpdateToState(Category category) async* {
    _categoriesRepository.updateCategory(category);
  }

  Stream<CategoryState> mapCategoryDeleteToState(Category category) async* {
    _categoriesRepository.deleteCategory(category);
  }

  Stream<CategoryState> mapCategoryCategoriesUpdatetoState(
      CategoryCategoriesUpdate event) async* {
    yield state.copyWith(status: Status.complete, categories: event.categories);
  }
}
