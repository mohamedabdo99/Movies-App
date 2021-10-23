import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/movieCubit/Movie_state.dart';
import 'package:movie_app/layout/movieCubit/movie_cubit.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic article;

  const DetailsScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) => {},
      builder: (context, state) {
        MovieCubit cubit = MovieCubit.get(context);
        return Scaffold(
          body:  ListView(
           children: [
             Container(
               width: double.infinity,
               height: 250.0,
               padding: EdgeInsets.only(left: 5.0),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15.0),
                 image: DecorationImage(
                   image: NetworkImage(
                       "https://image.tmdb.org/t/p/original${article['poster_path']}"),
                   fit: BoxFit.cover,
                 ),
               ),
             ),
             Row(
               children: [
                 Expanded(
                   child: Text(
                     "${article['original_language']}",
                     style: TextStyle(
                       fontSize: 18.0,
                       fontWeight: FontWeight.bold,
                       color: Colors.grey,
                     ),
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Text(
                       "${article['release_date']}",
                       style: TextStyle(
                         fontSize: 18.0,
                         fontWeight: FontWeight.bold,
                         color: Colors.grey,
                       ),
                     ),
                   ),
                 ),
               ],
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                 "${article['overview']}",
                 style: TextStyle(
                   fontSize: 18.0,
                   fontWeight: FontWeight.bold,
                   color: Colors.grey,
                 ),
               ),
             ),

           ],
          ),
        );
      },
    );
  }
}
