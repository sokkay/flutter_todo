import 'package:TodoApp/models/category.dart';
import 'package:TodoApp/repositories/categories_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCategoryRepository implements CategoriesRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get categoriesCollection =>
      _firestore.collection('categories');

  @override
  Future<void> addCategory(Category category) {
    return categoriesCollection.add(category.toDocument());
  }

  @override
  Future<void> deleteCategory(Category category) {
    return categoriesCollection.doc(category.id).delete();
  }

  @override
  Stream<List<Category>> getCategories() {
    return categoriesCollection.snapshots().map((snap) => snap.docs
        .map((doc) => CategoryFirebaseEntity.fromSnapshot(doc))
        .toList());
  }

  @override
  Future<void> updateCategory(Category category) {
    return categoriesCollection.doc(category.id).update(category.toDocument());
  }
}
