
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/movieCubit/Movie_state.dart';
import 'package:movie_app/layout/movieCubit/movie_cubit.dart';
import 'package:movie_app/modules/search/search_screen.dart';
import 'package:movie_app/shared/components/components.dart';

class MovieLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit,MovieState>(
      listener: (context , state ) => {},
      builder: (context , state )
      {
        MovieCubit cubit = MovieCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Movie App",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                  )),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
          ),
        );
      },
    );
  }
}
