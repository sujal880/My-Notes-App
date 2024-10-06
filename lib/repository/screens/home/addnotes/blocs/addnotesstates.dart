import 'package:mynotes_app/domain/models/addnotemodel.dart';

abstract class AddNotesStates {}

class AddNotesInitialState extends AddNotesStates {}

class AddNotesLoadingState extends AddNotesStates {}

class AddNotesLoadedState extends AddNotesStates {
  AddNoteModel addNoteModel;
  AddNotesLoadedState({required this.addNoteModel});
}

class AddNoteErrorState extends AddNotesStates {
  String error;
  AddNoteErrorState({required this.error});
}
