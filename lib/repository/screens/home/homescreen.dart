import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes_app/domain/constants/randomcolors.dart';
import 'package:mynotes_app/repository/screens/home/addnotes/addnotesscreen.dart';
import 'package:mynotes_app/repository/screens/home/fetchnotes/cubit/fetchnotescubit.dart';
import 'package:mynotes_app/repository/screens/home/fetchnotes/cubit/fetchnotestates.dart';

class HomeScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: BlocBuilder<FetchNotesCubit, FetchNotesStates>(
          builder: (context, state) {
        if (state is FetchNotesLoadingStates) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchNotesLoadedStates) {
          return Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 80.h,
                    width: 80.w,
                    decoration: const BoxDecoration(),
                    child: IconButton(
                        onPressed: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Image.asset(
                          "assets/images/sort-button-with-three-lines (1) 1 (1).png",
                          height: 80.h,
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                        child: Container(
                          height: 55.h,
                          width: 290.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: RandomColors.getRandomColor()),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                state.fetchNoteModel.data![index].note
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 180.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: Text(
                                  "7:00",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: state.fetchNoteModel.data!.length),
              )
            ],
          );
        } else if (state is FetchNotesErrorStates) {
          return Center(
            child: Text(state.error.toString()),
          );
        }
        return Center(
          child: Text("No Data Found!!"),
        );
      }),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Handle the tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNotesScreen()));
        },
        backgroundColor: Color(0XFF213BC5),
        child: Icon(Icons.add),
      ),
    );
  }
}
