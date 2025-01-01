import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  static Future addUserDetails(
      Map<String, dynamic> userMapInfo, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(id)
          .set(userMapInfo);
      print("User added successfully!");
    } catch (e) {
      print("Error adding user: $e");
    }
  }

  static Future addWallet(String id, String amount) async {
    try {
      await FirebaseFirestore.instance
          .collection('wallet')
          .doc(id)
          .set({'wallet': amount});
      print("wallet added successfully!");
    } catch (e) {
      print("Error adding wallet: $e");
    }
  }
}
