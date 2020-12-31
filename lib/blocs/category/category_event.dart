part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class CategoryGet extends CategoryEvent {}

class CategoryCategoriesUpdate extends CategoryEvent {
  final List<Category> categories;

  CategoryCategoriesUpdate({
    @required this.categories,
  });
}

class CategoryAdd extends CategoryEvent {
  final Category category;

  CategoryAdd({
    @required this.category,
  });
}

class CategoryDelete extends CategoryEvent {
  final Category category;

  CategoryDelete({
    @required this.category,
  });
}

class CategoryUpdate extends CategoryEvent {
  final Category category;

  CategoryUpdate({
    @required this.category,
  });
}
