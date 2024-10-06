import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/repository/screens/home/addnotes/blocs/addnotebloc.dart';
import 'package:mynotes_app/repository/screens/home/addnotes/blocs/addnotesevents.dart';
import 'package:mynotes_app/repository/widgets/uihelper.dart';

class AddNoteController {
  static addNotecontroller(String note, BuildContext context) {
    if (note == "") {
      return UiHelper.CustomSnackBar(context, "Please Enter a Note");
    } else {
      BlocProvider.of<AddNoteBloc>(context).add(AddUserNotesEvents(note: note));
    }
  }
}
