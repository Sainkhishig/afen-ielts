import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotFoundPage extends HookConsumerWidget {
  //#region ==================== local variable ====================
  // late KeycloakSetting keycloak;
  final GlobalKey<ScaffoldState> _mainScaffoldKey = GlobalKey<ScaffoldState>();
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  NotFoundPage({Key? key}) : super(key: key);
  //#endregion ==================== constructor ====================

  //#region ==================== method ====================
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //#endregion ---------- widget ----------

    return Scaffold(
      key: _mainScaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Хишиг эрдэм - Япон хэл"),
        foregroundColor: Colors.white,
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Padding(
          padding: EdgeInsets.all(40.0),
          child: Text("Хуудас олдсонгүй"),
        ),
      ),
    );
    //#endregion ---------- widget ----------
  }
  //#endregion ==================== method ====================

}
