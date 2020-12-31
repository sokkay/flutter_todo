import 'package:TodoApp/models/category.dart';

abstract class CategoriesRepository {
  Stream<List<Category>> getCategories();

  Future<void> addCategory(Category category);

  Future<void> deleteCategory(Category category);

  Future<void> updateCategory(Category category);
}
