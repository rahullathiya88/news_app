import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/constants/const.dart';
import 'package:news_app/data/api/api_result.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/data/repositories/news_repo.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<Datum> newsModel = List.empty();
  NewsBloc() : super(NewsInitial()) {
    on<GetNews>(_getNews);
  }

  _getNews(GetNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());

    ApiResult<NewsModel> result =
        await NewsRepo.instance.getStudioDetails(category: event.category!);

    await result.map(success: (value) async {
      newsModel = value.data.data!;
      emit(NewsLoaded(newsModel));
    }, failure: (error) async {
      errorSnackbar('Oops Unknown Error Occurred!');
    });
  }
}
