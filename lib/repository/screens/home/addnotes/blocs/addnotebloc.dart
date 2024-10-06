import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/data/remote/apihelper.dart';
import 'package:mynotes_app/data/remote/baseurls.dart';
import 'package:mynotes_app/domain/constants/appprefs.dart';
import 'package:mynotes_app/domain/models/addnotemodel.dart';
import 'package:mynotes_app/repository/screens/home/addnotes/blocs/addnotesevents.dart';
import 'package:mynotes_app/repository/screens/home/addnotes/blocs/addnotesstates.dart';

class AddNoteBloc extends Bloc<AddNotesEvents, AddNotesStates> {
  ApiHelper apiHelper;
  AddNoteBloc({required this.apiHelper}) : super(AddNotesInitialState()) {
    on<AddUserNotesEvents>((event, emit) async {
      emit(AddNotesLoadingState());
      try {
        final userid = await AppPrefs().getuserId();
        final response = await apiHelper.postapi(
            url: BaseUrls.addnote,
            bodyparams: {"userid": userid, "note": event.note},
            isheaderrequired: true);
        final noteModel = AddNoteModel.fromJson(response);
        emit(AddNotesLoadedState(addNoteModel: noteModel));
      } catch (ex) {
        emit(AddNoteErrorState(error: ex.toString()));
      }
    });
  }
}
