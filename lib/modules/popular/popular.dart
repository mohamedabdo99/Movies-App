
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/movieCubit/Movie_state.dart';
import 'package:movie_app/layout/movieCubit/movie_cubit.dart';
import 'package:movie_app/shared/components/components.dart';

class PopularScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit,MovieState>(
      listener: (context , state ) => {},
      builder: (context , state )
      {
        var list = MovieCubit.get(context).popular;
        return articleBuilder(list , context);
      },
    );
  }
}
