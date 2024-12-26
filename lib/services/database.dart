import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  static Future addUserDetails(Map<String, dynamic> userMapInfo, id) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .set(userMapInfo);
  }
}
