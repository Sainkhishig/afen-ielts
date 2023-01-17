import 'package:flutter/material.dart';
import 'package:afen_ielts/common/common_constant.dart';
import 'package:afen_ielts/popup_menu_pages/user_info/model/plan_model.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

final loginStateNotifierProvider =
    ChangeNotifierProvider<LoginState>((ref) => throw UnimplementedError());

class LoginState extends ChangeNotifier {
  //#region ==================== local variable ====================
  final SharedPreferences prefs;
  // FacilityInfoState facilityState = FacilityInfoState("");

  bool _loggedIn = false;
  String _userName = "";
  String _userId = "";
  String _fullname = "";
  List<String> _authorities = [];
  String _role = "";
  bool _validUser = false;
  String _roleName = "未設定";
  List<PlanModel> lstUserPlan = [];
  bool isUserPlanActive = false;

  String _token = "";
  int railIndex = 0;
  HiveInfo get hiveInfo => lstHiveInfo[(prefs.getInt("jlptLevel") ?? 5)];

  bool readylogin = false;

  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  LoginState(
    this.prefs,
  ) {
    loggedIn = prefs.getBool("LoggedIn") ?? false;
    userName = prefs.getString("userName") ?? "";
  }
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  bool get loggedIn => _loggedIn;
  set loggedIn(bool value) {
    _loggedIn = value;
    prefs.setBool("LoggedIn", value);
    // notifyListeners();
  }

  int get jlptLevel => prefs.getInt("jlptLevel") ?? 5;

  String get userId => prefs.getString("userId") ?? "";
  set userId(String value) {
    // _userId = value;
    prefs.setString("userId", value);
  }

  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    prefs.setString("userName", value);
  }

  String get fullname => _fullname;
  set fullname(String value) {
    _fullname = value;
    prefs.setString("fullname", value);
  }

  List<String> get authorities => _authorities;
  set authorities(List<String> value) {
    // setValidUserRole = value;
    _authorities = value;
    prefs.setStringList("authorities", value);
    // setStrongestRole(value);
  }

  String get role => _role;
  set role(String value) {
    _role = value;
    prefs.setString("role", value);
  }

  String get roleName => _roleName;
  set roleName(String value) {
    _roleName = value;
    prefs.setString("roleName", value);
  }

  bool get isValidAccess => loggedIn && _validUser;

  bool get showDeniedDialog {
    final logInButton = prefs.getBool("ClickedLoginButton") ?? false;
    return loggedIn && !_validUser && logInButton;
  }

  bool get showLogoutDialog {
    final logOutButton = prefs.getBool("ClickedLogoutButton") ?? false;
    return !loggedIn && logOutButton;
  }

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================

  Future<void> login() async {
    await prefs.setBool("ClickedLoginButton", true);
    // keycloakService
    //     .login(KeycloakLoginOptions(redirectUri: window.location.href));
  }

  void logOut(String facilityId) async {
    await prefs.setBool("ClickedLogoutButton", false);
    // await keycloakService.logout(KeycloakLogoutOptions(
    //     redirectUri: window.location.origin + "/facility/$facilityId"));
  }

  Future<void> clearButtonPressed() async {
    prefs.setBool("ClickedLoginButton", false);
    prefs.setBool("ClickedLogoutButton", false);
  }

  void checkLoggedIn() {
    loggedIn = prefs.getBool("LoggedIn") ?? false;
  }

  Future<bool> setLoginState(bool kcLogin,
      [bool isClickedLogOutButton = false]) async {
    loggedIn = kcLogin;

    if (kcLogin) {
      login();
    } else {
      userName = "";
      fullname = "";
      authorities = [];
      await prefs.setBool("ClickedLoginButton", false);
      if (isClickedLogOutButton) {
        await prefs.setBool("ClickedLogoutButton", true);
      }
      // keycloakService.logout();
    }

    notifyListeners();
    return kcLogin;
  }

  setRailIndex(int index) async {
    railIndex = index;
  }

  //#endregion ==================== method ====================
}
