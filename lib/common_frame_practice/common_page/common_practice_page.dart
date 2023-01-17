import 'package:afen_ielts/common/common_providers/shared_preferences_provider.dart';
import 'package:afen_ielts/common/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:afen_ielts/common/common_dialog.dart';
import 'package:afen_ielts/common/common_popup_menu.dart';
import 'package:afen_ielts/common/common_widget.dart';
import 'package:afen_ielts/common_frame_practice/api/tes_api.dart';
import 'package:afen_ielts/main/main_route.dart';

import 'package:flutter/material.dart';

import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:afen_ielts/main/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'common_page_controller.dart';

class CommonPagePractice extends HookConsumerWidget {
  CommonPagePractice({Key? key, required this.destination}) : super(key: key);

  String destination;
  // late N5Box lstN5;
  String? language = 'en-US';
  String? languageCode;
  late FirebaseAuth? auth;
  late LoginState loginNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(commonPracticePageProvider.notifier);
    controller.setModelListenable(ref);
    loginNotifier = ref.read(loginStateNotifierProvider);
    final future =
        useMemoized(() => CommonTestAPI().setPlanInfo(loginNotifier));
    final snapshot = useFuture(future, initialData: null);
    if (snapshot.hasError) {
      return showErrorWidget(
          context, "Хэрэглэгчийн эрх шалгахад гарлаа", snapshot.error);
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    auth = ref.read(firebaseAuthProvider);
    final router = ref.read(mainRouteProvider).router;

    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Row(
          children: [
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  router.goNamed("home");
                },
              ),
            ),
            Expanded(
                flex: 9,
                child: Text(
                  practiceMenuCommon[loginNotifier.railIndex].name,
                  textAlign: TextAlign.center,
                ))
          ],
        ),
        actions: [
          ButtonBar(
            children: [
              IconButton(
                  onPressed: () async {
                    if (!loginNotifier.loggedIn) {
                      var isMoveToLogin = await showConfirmationMessage(
                          context,
                          "Тестийн график үзүүлэлт",
                          "Уучлаарай. Та ажилласан тестийнхээ график үзүүлэлтийг харахын тулд хэрэглэгчийн эрхээр нэвтрэх шаардлагатай. Та нэвтрэх цонх руу шилжих үү?");
                      if (isMoveToLogin) {
                        router.go("/login");
                      }
                    } else {
                      controller.setChartMode(!controller.state.isChartMode);
                    }
                  },
                  icon: Icon(!controller.state.isChartMode
                      ? CupertinoIcons.chart_pie_fill
                      : Icons.app_registration_rounded)),
            ],
          ),
          Visibility(
              visible: loginNotifier.loggedIn,
              child: commonPopUpMenu(context, ref)),
          IconButton(
            padding: const EdgeInsets.only(bottom: 4),
            disabledColor: Colors.grey,
            // color: Colors.white,
            icon: Icon(loginNotifier.loggedIn ? Icons.logout : Icons.login),
            onPressed: () async {
              if (!loginNotifier.loggedIn) {
                router.go("/login");
                // loginStateNotifier.notifyListeners();
              } else {
                await auth!.signOut();
                loginNotifier.userId = "";
                loginNotifier.userName = "";
                loginNotifier.loggedIn = false;

                await CommonTestAPI().setPlanInfo(loginNotifier);
                loginNotifier.notifyListeners();
                // controller.refreshState(loginStateNotifier.userId);
              }
            },
          ),
        ],
      ),
      body: Scaffold(
          body: Row(
        children: [
          Expanded(
            child: Center(child: getBody(controller)),
          ),
        ],
      )),
      selectedIndex: loginNotifier.railIndex,
      onDestinationSelected: (value) async {
        controller.setChartMode(false);
        changeIndex(value, controller, context, router);
      },
      destinations: _buildDestinations2(context, controller),
      drawerHeader: ListTile(
        contentPadding: const EdgeInsets.all(4),
        onTap: () {
          router.goNamed("home");
        },
        title: Column(
          children: [
            Container(
              constraints:
                  const BoxConstraints.expand(height: 150.0, width: 170),
              child: Image.asset(
                "assets/images/logo-shadow.png",
                fit: BoxFit.fill,
              ),
            ),
            TextButton(
                onPressed: () {
                  // router.goNamed("home");
                },
                child: const Text(
                  "Япон хэлний хичээл",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Text(
              "N${loginNotifier.hiveInfo.jlptLevel} түвшин",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  getBody(CommonPracticePageController controller) {
    var bodyPage = !controller.state.isChartMode
        ? practiceMenuCommon[loginNotifier.railIndex].mainPage
        : practiceMenuCommon[loginNotifier.railIndex].practicePage;

    return bodyPage;
  }

  List<AdaptiveScaffoldDestination> _buildDestinations2(
      BuildContext context, CommonPracticePageController controller) {
    return practiceMenuCommon
        .map((menu) => AdaptiveScaffoldDestination(
              title: menu.name,
              icon: menu.icon,
            ))
        .toList();
  }

  changeIndex(int index, CommonPracticePageController controller,
      BuildContext context, GoRouter router) async {
    final selectedDestination = practiceMenuCommon[index].destination;
    loginNotifier.setRailIndex(index);
    print("indexRail:$index");
    if (selectedDestination == "logout") {
      // loginStateNotifier.logOut();
    } else {
      destination = selectedDestination;
      print("index:$index");
      controller.setChartMode(false);
      router.go("/test/$selectedDestination");
    }
  }
}
