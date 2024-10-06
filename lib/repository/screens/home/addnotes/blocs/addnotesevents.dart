abstract class AddNotesEvents{}
class AddUserNotesEvents extends AddNotesEvents{
  String note;
  AddUserNotesEvents({required this.note});
}