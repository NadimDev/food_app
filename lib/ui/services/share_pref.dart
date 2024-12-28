import 'package:shared_preferences/shared_preferences.dart';

class SharePefHelper {
  static String userId = 'userId';
  static String userName = 'userName';
  static String userEmail = 'userEmail';
  static String userWallet = 'userWallet';

  static Future<bool> saveUserId(String getUserId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userId, getUserId); // Use `getUserId`
  }

  static Future<bool> saveUserName(String getUserName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userName, getUserName);
  }

  static Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userEmail, getUserEmail);
  }

  static Future<bool> saveUserWallet(String getUserWallet) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userWallet, getUserWallet); // Use `getUserWallet`
  }

  static Future<String?> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userId);
  }

  static Future<String?> getUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userName);
  }

  static Future<String?> getUserEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userEmail);
  }

  static Future<String?> getUserWallet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userWallet);
  }
}
