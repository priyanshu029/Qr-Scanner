import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AttendanceData {
  Future<dynamic> getData(String email) async {
    final _fireStore = FirebaseFirestore.instance;
    try {
      final data = await _fireStore.collection(email).get();
      return data;
    } catch (e) {
      print("catch error $e");
      return null;
    }
  }

  Future addData(bool present, String email) async {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    final _fireStore = FirebaseFirestore.instance;
    try {
      await _fireStore
          .collection(email)
          .add({'date': formattedDate, 'present': present});
    } catch (e) {
      print(e);
    }
  }
}
