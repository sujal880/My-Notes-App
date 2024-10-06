import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/data/remote/apihelper.dart';
import 'package:mynotes_app/data/remote/baseurls.dart';
import 'package:mynotes_app/domain/constants/appprefs.dart';
import 'package:mynotes_app/domain/models/fetchnotemodel.dart';
import 'package:mynotes_app/repository/screens/home/fetchnotes/cubit/fetchnotestates.dart';

class FetchNotesCubit extends Cubit<FetchNotesStates> {
  ApiHelper apiHelper;
  FetchNotesCubit({required this.apiHelper}) : super(FetchNotesInitialStates());
  fetchNotes() async {
    emit(FetchNotesLoadingStates());
    try {
      String userid = await AppPrefs().getuserId();
      final response = await apiHelper.postapi(
          url: BaseUrls.fetchnote,
          isheaderrequired: true,
          bodyparams: {"userid": userid});
      final fetchnotemodel = FetchNoteModel.fromJson(response);
      emit(FetchNotesLoadedStates(fetchNoteModel: fetchnotemodel));
    } catch (ex) {
      emit(FetchNotesErrorStates(error: ex.toString()));
    }
  }
}
