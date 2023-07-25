import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService extends GetxService implements SharedPreferences{
  static SharedPrefsService get to => Get.find();

  late final SharedPreferences _preferences;

  Future<SharedPrefsService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  @visibleForTesting
  static void setMockValues(Map<String, Object> values) {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues(values);
  }

  @override
  Future<bool> clear() async {
    return await _preferences.clear();
  }

  @override
  bool containsKey(String key) {
    return _preferences.containsKey(key);
  }

  @override
  Object? get(String key) {
    return _preferences.get(key);
  }

  @override
  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  @override
  double? getDouble(String key) {
    return _preferences.getDouble(key);
  }

  @override
  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  @override
  Set<String> getKeys() {
    return _preferences.getKeys();
  }

  @override
  String? getString(String key) {
    return _preferences.getString(key);
  }

  @override
  List<String>? getStringList(String key) {
    return _preferences.getStringList(key);
  }

  @override
  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }

  @override
  Future<bool> setBool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  @override
  Future<bool> setDouble(String key, double value) {
    return _preferences.setDouble(key, value);
  }

  @override
  Future<bool> setInt(String key, int value) {
    return _preferences.setInt(key, value);
  }

  @override
  Future<bool> setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) {
    return _preferences.setStringList(key, value);
  }
  
  @override
  Future<bool> commit() {
    // TODO: implement commit
    throw UnimplementedError();
  }
  
  @override
  Future<void> reload() {
    // TODO: implement reload
    throw UnimplementedError();
  }
}
