import 'package:TodoApp/blocs/category/category_bloc.dart';
import 'package:TodoApp/models/status.dart';
import 'package:TodoApp/routes/routes_names.dart';
import 'package:TodoApp/screens/main/cubit/main_screen_cubit.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:TodoApp/screens/main/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  final textStyle = CustomTheme.textLabelMainStyle;

  final padding = const EdgeInsets.only(left: 18);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Text('Categorias', style: textStyle),
        ),
        Expanded(
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state.status == Status.complete) {
                final categories = state.categories;
                return ListView.builder(
                  padding: padding,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) => CategoryCard(
                    title: categories[index].name,
                    tasks: categories[index].tasks.length,
                    color: Color(categories[index].color),
                    onTap: () => context
                        .read<MainScreenCubit>()
                        .changePage(1, category: categories[index]),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        )
      ],
    );
  }
}
