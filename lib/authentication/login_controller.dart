import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginHomeController =
    StateNotifierProvider<LoginHomePageController, bool>((ref) {
  return LoginHomePageController(ref: ref);
});

class LoginHomePageController extends StateNotifier<bool> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;

  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  LoginHomePageController({required this.ref}) : super(true);

  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  void setModelListenable(WidgetRef ref) {
    ref.watch(loginHomeController);
  }

  void refresh() {
    state = state;
  }

  void setState(bool pageState) {
    state = false;
  }

  //#endregion ==================== method ====================
}
