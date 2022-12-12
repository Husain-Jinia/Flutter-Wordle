import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences prefs;

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<int?> getLevelFromSharedPref(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<bool> saveLevelToSharedPref(String key, int token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, token);
  }  

  Future<int?> getScoreFromSharedPref(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<bool> saveScoreToSharedPref(String key, int token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, token);
  }
}