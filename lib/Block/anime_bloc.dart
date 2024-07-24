import 'package:anime/Repository/Api/API.dart';
import 'package:anime/Repository/ModelClass/AnimeModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  late AnimeModel animeModel;
  AnimeApi animeApi=AnimeApi();
  AnimeBloc() : super(AnimeInitial()) {
    on<FetchAnime>((event, emit)async {

      emit(AnimeBlocLoading());
      try{
        animeModel= await animeApi.getAnime();
        emit(AnimeBlocLoaded());
      }
      catch(e){
        emit(AnimeBlocError());
      }

    });
  }
}
