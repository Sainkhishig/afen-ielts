//TODO https://www.kodeco.com/28987851-flutter-navigator-2-0-using-go_router#toc-anchor-012
import 'package:afen_ielts/common/common_page/student_comment.dart';
import 'package:afen_ielts/common/menu.dart';
import 'package:afen_ielts/pages/grammar/test/ielts_test_detail.dart';
import 'package:afen_ielts/pages/grammar/test/ielts_test_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:afen_ielts/authentication/login.dart';
import 'package:afen_ielts/authentication/registration.dart';
import 'package:afen_ielts/common_frame_practice/common_page/common_practice_page.dart';

import 'package:afen_ielts/home_screen.dart';
import 'package:afen_ielts/main/not_found_page.dart';
import 'package:afen_ielts/popup_menu_pages/fee/plan_fee.dart';
import 'package:afen_ielts/popup_menu_pages/user_info/admin_page.dart';
import 'package:afen_ielts/popup_menu_pages/user_info/user_info.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_state.dart';

final mainRouteProvider =
    Provider<MainRoute>((ref) => throw UnimplementedError());

class MainRoute {
  final LoginState loginState;

  MainRoute(
    this.loginState,
  );

  late final router = GoRouter(
    // 3
    refreshListenable: loginState,
    // 4
    debugLogDiagnostics: true,
    // 5
    urlPathStrategy: UrlPathStrategy.path,

    // 6
    routes: [
      GoRoute(
        name: "root",
        path: '/',
        redirect: (state) =>
            // TODO: Change to Home Route
            state.namedLocation(
          "home",
        ),
      ),
      GoRoute(
        name: "home",
        path: '/home',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        name: "login",
        path: '/login',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Login(),
        ),
      ),
      GoRoute(
        name: "userInfo",
        path: '/userInfo',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: UserInfoPage(),
        ),
      ),
      GoRoute(
        name: "commentSend",
        path: '/commentSend',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: StudentCommentPage(),
        ),
      ),
      GoRoute(
        name: "planFee",
        path: '/planFee',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: PlanFee(),
        ),
      ),
      GoRoute(
        name: "adminConfirmationPage",
        path: '/adminConfirmationPage',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: AdminConfirmationPage(),
        ),
      ),
      GoRoute(
        name: "registration",
        path: '/create-account',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Registration(),
        ),
      ),
      GoRoute(
          name: "common-test",
          // 1
          path:
              '/:tab(${practiceMenuCommon.map((e) => e.destination).toList().join('|')})',
          pageBuilder: (context, state) {
            // 2
            final tab = state.params['tab']!;
            // final facilityId = state.params['facilityId']!;
            return MaterialPage<void>(
              key: state.pageKey,
              // 3
              child: CommonPagePractice(
                destination: tab,
              ),
            );
          },
          routes: [
            GoRoute(
              name: "test-detail",
              // 4
              path: 'cambridgeIelts/:item',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                // 5
                child: IeltsTestDetail(
                    bookNumber: int.parse(state.params['item']!)),
              ),
            ),
            // GoRoute(
            //   name: "common-ci-test",
            //   // 4
            //   path: 'ieltsTest/:item',
            //   pageBuilder: (context, state) => MaterialPage<void>(
            //     key: state.pageKey,
            //     // 5
            //     child: const IeltsTestList(),
            //   ),
            // ),
          ]),
      GoRoute(
        name: "redirect-test-detail",
        // 2
        path: '/details-redirector/:item',
        // 3
        redirect: (state) => state.namedLocation(
          "test-detail",
          params: {'tab': 'test', 'item': state.params['item']!},
        ),
      ),
      // GoRoute(
      //   name: "go-ci-test",
      //   // 2
      //   path: '/readingTest/:item',
      //   // 3
      //   redirect: (state) => state.namedLocation(
      //     "common-ci-test",
      //     params: {'tab': 'test', 'item': state.params['item']!},
      //   ),
      // ),
      // TODO: Add Other routes
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: NotFoundPage(), //ErrorPage(error: state.error),
    ),
    redirect: (state) {
      // if (loginState.loggedIn) {
      //   state.namedLocation("home");
      // }
      return null;
      // 1
      // final loginLoc = state.namedLocation("home");
      // final rootLoc = state.namedLocation("login");
      // // 2
      // final loggingIn = state.subloc == rootLoc;
      // // 3
      // // final createAccountLoc = state.namedLocation(createAccountRouteName);
      // // final creatingAccount = state.subloc == createAccountLoc;
      // // 4
      // final loggedIn = loginState.loggedIn;
      // // final rootLoc = state.namedLocation("login");
      // print("loggingIn:$loggingIn");
      // print("loggedIn:$loggedIn");
      // // 5
      // if (!loggedIn && !loggingIn) return loginLoc;
      // if (loggedIn && (loggingIn)) return rootLoc;
      // return rootLoc;
    },
  );
}
