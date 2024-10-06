import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes_app/data/remote/apihelper.dart';
import 'package:mynotes_app/repository/screens/home/addnotes/blocs/addnotebloc.dart';
import 'package:mynotes_app/repository/screens/home/addnotes/blocs/addnotesstates.dart';
import 'package:mynotes_app/repository/screens/home/addnotes/controllers/addnotecontroller.dart';
import 'package:mynotes_app/repository/screens/home/fetchnotes/cubit/fetchnotescubit.dart';
import 'package:mynotes_app/repository/widgets/uihelper.dart';

class AddNotesScreen extends StatelessWidget {
  TextEditingController addNoteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                CupertinoIcons.back,
                color: Colors.black,
                size: 40,
              ))),
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  autofocus: true,
                  controller: addNoteController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type something...",
                      hintStyle: TextStyle(fontSize: 20.sp)),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: BlocConsumer<AddNoteBloc, AddNotesStates>(
        listener: (context, state) {
          if (state is AddNotesLoadedState) {
            UiHelper.CustomSnackBar(
                context, state.addNoteModel.message.toString());
            FetchNotesCubit(apiHelper: ApiHelper())..fetchNotes();
            Navigator.pop(context);

          } else if (state is AddNoteErrorState) {
            UiHelper.CustomSnackBar(context, state.error.toString());
          }
        },
        builder: (context, state) {
          if (state is AddNotesLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return IconButton(
              onPressed: () {
                AddNoteController.addNotecontroller(
                    addNoteController.text.toString(), context);
              },
              icon: const Icon(
                Icons.save,
                color: Colors.black,
                size: 40,
              ));
        },
      ),
    );
  }
}
