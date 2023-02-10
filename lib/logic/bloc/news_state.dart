part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Datum>? newsModel;

  NewsLoaded(this.newsModel);
}

class NewsError extends NewsState {}
