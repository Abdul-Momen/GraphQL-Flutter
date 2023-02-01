import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HelperUtils {


  String getPrettyJSONString(Object? jsonObject) {
    String response = JsonEncoder.withIndent(' ').convert(jsonObject);
    return response;
  }

  static void showToast(String msg) {

    Get.snackbar("error", msg);
  }

  static void setToken(String token) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
// set value
    await prefs.setString("token", token);

  }

  static Future<String?> getToken() async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString('token');
  }


}
