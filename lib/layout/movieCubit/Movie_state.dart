abstract class MovieState {}

class MovieInitialState extends MovieState{}

class MovieBottomNavigationState extends MovieState{}

class MovieGetPopularLoadingState extends MovieState {}

class MovieGetPopularSuccessState extends MovieState {}

class MovieGetPopularErrorState extends MovieState {
  final String error;
  MovieGetPopularErrorState(this.error);
}

class MovieGetTopRatedLoadingState extends MovieState {}

class MovieGetTopRatedSuccessState extends MovieState {}

class MovieGetTopRatedErrorState extends MovieState {
  final String error;
  MovieGetTopRatedErrorState(this.error);
}

class MovieGetNowPlayingLoadingState extends MovieState {}

class MovieGetTopNowPlayingSuccessState extends MovieState {}

class MovieGetTNowPlayingErrorState extends MovieState {
  final String error;
  MovieGetTNowPlayingErrorState(this.error);
}

class MovieGetSearchLoadingState extends MovieState {}

class MovieGetSearchPlayingSuccessState extends MovieState {}

class MovieGetSearchErrorState extends MovieState {
  final String error;
  MovieGetSearchErrorState(this.error);
}