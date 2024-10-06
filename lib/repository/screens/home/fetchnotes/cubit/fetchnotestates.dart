import 'package:mynotes_app/domain/models/fetchnotemodel.dart';

abstract class FetchNotesStates {}

class FetchNotesInitialStates extends FetchNotesStates {}

class FetchNotesLoadingStates extends FetchNotesStates {}

class FetchNotesLoadedStates extends FetchNotesStates {
  FetchNoteModel fetchNoteModel;
  FetchNotesLoadedStates({required this.fetchNoteModel});
}

class FetchNotesErrorStates extends FetchNotesStates {
  String error;
  FetchNotesErrorStates({required this.error});
}
