part of 'category_bloc.dart';

@immutable
class CategoryState {
  final List<Category> categories;
  final Status status;
  final String errorMessage;

  CategoryState({
    this.categories = const [],
    this.status,
    this.errorMessage,
  });

  CategoryState copyWith({
    List<Category> categories,
    Status status,
    String errorMessage,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
