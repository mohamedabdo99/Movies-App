import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/movieCubit/Movie_state.dart';
import 'package:movie_app/modules/now_playing/now_playing.dart';
import 'package:movie_app/modules/popular/popular.dart';
import 'package:movie_app/modules/top_rated/top_rated.dart';
import 'package:movie_app/network/remote/dio_helper.dart';

class MovieCubit extends Cubit<MovieState>
{
  MovieCubit() : super(MovieInitialState());
  // to get INSTANCE from NewsCubit
  static MovieCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem =
  [
    BottomNavigationBarItem(
      icon:Icon(
          Icons.business
      ),
      label: "popular",
    ),
    BottomNavigationBarItem(
      icon:Icon(
          Icons.star,
      ),
      label: "top rated",
    ),
    BottomNavigationBarItem(
      icon:Icon(
          Icons.video_collection,
      ),
      label: "now playing",
    ),
  ];


  void changeBottomNav(int index){
    currentIndex = index;
    if(index == 1) {
      gettopRated();
    }
    if(index == 2) {
      getnowPlaying();
    }
    emit(MovieBottomNavigationState());
  }

  List<Widget> screens =
  [
    PopularScreen(),
    TopRated(),
    NowPlaying(),
  ];

  List<dynamic> popular = [];
  List<dynamic> topRated = [];
  List<dynamic> nowPlaying = [];
  List<dynamic> search = [];

  void getpopular()
  {
    emit(MovieGetPopularLoadingState());

    if(popular.length == 0)
    {
      DioHelper.getData(
        url: 'movie/popular?',
        query: {
          'api_key':'4312be306154acabe16a5c5adbc9a6ba',
        },
      ).then((value) {
        // print(value.data.toString());
        popular = value.data['results'];
        print(popular[0]['title']);
        emit(MovieGetPopularSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(MovieGetPopularErrorState(error.toString()));
      });
    }
    else
    {
      emit(MovieGetPopularSuccessState());
    }


  }

  void gettopRated()
  {
    emit(MovieGetTopRatedLoadingState());

    if(topRated.length == 0)
    {
      DioHelper.getData(
        url: 'movie/now_playing?',
        query: {
          'api_key':'4312be306154acabe16a5c5adbc9a6ba',
        },
      ).then((value) {
        // print(value.data.toString());
        topRated = value.data['results'];
        print(topRated[0]['title']);
        emit(MovieGetTopRatedSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(MovieGetTopRatedErrorState(error.toString()));
      });
    }
    else
    {
      emit(MovieGetTopRatedSuccessState());
    }


  }

  void getnowPlaying()
  {
    emit(MovieGetNowPlayingLoadingState());

    if(nowPlaying.length == 0)
    {
      DioHelper.getData(
        url: 'movie/top_rated?',
        query: {
          'api_key':'4312be306154acabe16a5c5adbc9a6ba',
        },
      ).then((value) {
        // print(value.data.toString());
        nowPlaying = value.data['results'];
        print(nowPlaying[0]['title']);
        emit(MovieGetTopNowPlayingSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(MovieGetTNowPlayingErrorState(error.toString()));
      });
    }
    else
    {
      emit(MovieGetTopNowPlayingSuccessState());
    }


  }

  void getSearch(String value)
  {
    emit(MovieGetSearchLoadingState());
    if(search.length == 0)
    {
      DioHelper.getData(
        url: 'search/movie?',
        query: {
          'query' : '$value' ,
          'api_key':'4312be306154acabe16a5c5adbc9a6ba',
          'language' : 'en-US',
        },
      ).then((value) {
        // print(value.data.toString());
        search = value.data['results'];
        print(search[0]['title']);
        emit(MovieGetSearchPlayingSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(MovieGetSearchErrorState(error.toString()));
      });
    }
    else
    {
      emit(MovieGetPopularSuccessState());
    }


  }
}