part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class GetNews extends NewsEvent {
  final String? category;

  GetNews({this.category});
}
