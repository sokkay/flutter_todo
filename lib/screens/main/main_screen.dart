import 'package:TodoApp/models/category.dart';
import 'package:TodoApp/screens/main/cubit/main_screen_cubit.dart';
import 'package:TodoApp/screens/main/widgets/add_category.dart';
import 'package:TodoApp/screens/main/widgets/week_tasks.dart';
import 'package:TodoApp/screens/main/widgets/bottom_bar.dart';
import 'package:TodoApp/screens/main/widgets/categories.dart';
import 'package:TodoApp/screens/main/widgets/drawer.dart';
import 'package:TodoApp/screens/main/widgets/header.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => {},
          )
        ],
      ),
      drawer: MainDrawer(),
      body: BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          Widget widget;
          switch (state.currentPage) {
            case 0:
              widget = MainScreenContent();
              break;
            case 1:
              widget = Container();
              break;
            case 2:
              widget = Container();
              break;
          }
          return FadeIn(child: widget);
        },
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => openBottomSheet(context),
        backgroundColor: CustomTheme.color1,
        child: Icon(Icons.add),
      ),
    );
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: CustomTheme.modalshape,
      builder: (context) => Container(
        child: Wrap(
          children: [
            ListTile(
              title: Text('Ordenar por'),
              subtitle: Text('Mi Orden'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Crear nueva categoría'),
              onTap: () => openAddCategoryModal(context),
            ),
          ],
        ),
      ),
    );
  }

  void openAddCategoryModal(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      shape: CustomTheme.modalshape,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        margin: MediaQuery.of(context).viewInsets,
        child: AddCategory(),
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  final Category category;

  const CategoryView({Key key, Category category})
      : assert(category != null),
        this.category = category,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(category.name),
      ],
    );
  }
}

class MainScreenContent extends StatelessWidget {
  const MainScreenContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Header(),
        ),
        Expanded(
          flex: 2,
          child: Categories(),
        ),
        Expanded(
          flex: 5,
          child: WeekTasks(),
        ),
      ],
    );
  }
}
