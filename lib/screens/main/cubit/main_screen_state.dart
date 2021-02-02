part of 'main_screen_cubit.dart';

class MainScreenState extends Equatable {
  const MainScreenState({
    this.currentPage = 0,
    this.category,
  });

  final int currentPage;
  final Category category;

  @override
  List<Object> get props => [currentPage];

  MainScreenState copyWith({
    int currentPage,
    Category category,
  }) {
    return MainScreenState(
      currentPage: currentPage ?? this.currentPage,
      category: category ?? this.category,
    );
  }
}
