
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/movieCubit/Movie_state.dart';
import 'package:movie_app/layout/movieCubit/movie_cubit.dart';
import 'package:movie_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget
{
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = MovieCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFiled(
                    controller: searchController,
                    type: TextInputType.text,
                    label: "search",
                    suffix: Icons.search,
                    onChange: (value) {
                      MovieCubit.get(context).getSearch(value);
                    }),
              ),
              Expanded(
                child: articleBuilder(
                  list,
                  context,
                  isSearch: true,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
