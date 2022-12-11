import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeDataBase extends GetxController {
  final DatabaseReference ref = FirebaseDatabase.instance.ref();

  void setDataToUser() {
    ref.set({"name": "andrew", "age": 25, "phone": 01281248732});
  }
}
