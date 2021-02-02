import 'package:TodoApp/screens/main/cubit/main_screen_cubit.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatelessWidget {
  final buttonTextStyle = TextStyle(
    color: CustomTheme.textColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        return BubbleBottomBar(
          opacity: 0.2,
          currentIndex: state.currentPage,
          onTap: (page) => context.read<MainScreenCubit>().changePage(page),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.end,
          elevation: 8,
          items: [
            BubbleBottomBarItem(
              title: Text('Home'),
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.home,
                color: CustomTheme.color1,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
            ),
            BubbleBottomBarItem(
              title: Text('Tareas'),
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: CustomTheme.color1,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
            ),
            BubbleBottomBarItem(
              title: Text('Opciones'),
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.settings,
                color: CustomTheme.color1,
              ),
              activeIcon: Icon(
                Icons.settings,
                color: Colors.indigo,
              ),
            ),
          ],
        );
      },
    );
  }
}
