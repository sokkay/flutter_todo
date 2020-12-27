part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class CategoryGet extends CategoryEvent {}

class CategoryAdd extends CategoryEvent {
  final Category category;

  CategoryAdd({
    this.category,
  });
}

class CategoryDelete extends CategoryEvent {
  final Category category;

  CategoryDelete({
    this.category,
  });
}

class CategoryUpdate extends CategoryEvent {
  final Category category;

  CategoryUpdate({
    this.category,
  });
}
