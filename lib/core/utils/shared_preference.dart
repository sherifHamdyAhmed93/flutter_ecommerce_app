import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtil{
  static late SharedPreferences prefs;

  static Future<void> init() async{
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String key , required dynamic data})async{
    if (data is int){
      return await prefs.setInt(key, data);
    }else if (data is double){
      return await prefs.setDouble(key, data);
    }else if (data is bool){
      return await prefs.setBool(key, data);
    } else{
      return await prefs.setString(key, data);
    }
  }

  static Object? getData({required String key}){
    return prefs.get(key);
  }

  static Future<bool> removeData({required String key})async{
    return await prefs.remove(key);
  }

  }