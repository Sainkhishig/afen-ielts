// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:afen_ielts/main/login_state.dart';
import 'package:afen_ielts/main/main_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter/material.dart';

class InitApp extends HookConsumerWidget {
  const InitApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final location = window.location.pathname;
    // final notifier = ref.read(loginStateNotifierProvider);
    // notifier.facilityState = facilityState;
    // final keycloak = ref.read(keycloakProvider);

    // final future = useMemoized(() => setInitValue(notifier, ref));
    // final snapshot = useFuture(future, initialData: null);

    // if (snapshot.hasError) return ErrorWidget(snapshot.error!);

    // if (snapshot.connectionState == ConnectionState.waiting) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    // if (!snapshot.hasData) {
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     builder: (context, _) =>
    //         const Scaffold(body: Text("")), // Application Loading
    //   );
    // }
    // var isLoggedIn = snapshot.data ?? false;

    var router = ref.read(mainRouteProvider).router;
    return MaterialApp.router(
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      supportedLocales: const [
        Locale('mn', 'MN'), // English, no country code
        Locale('en', 'EN'), // English, no country code
      ],
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Cambridge IELTS: Answer sheet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  Future<bool?> setInitValue(LoginState notifier, WidgetRef ref) async {
    var isLoggedIn = true;
    // await keycloakService.isLoggedIn();
    // notifier.loggedIn = isLoggedIn;
    // var facilityState = ref.read(facilityStateProvider);
    // if (isLoggedIn) {
    // if (facilityState.facilityId.isNotEmpty) {
    //   // final response = await ref
    //   //     .read(facilityApiProvider)
    //   //     .getFacility(facilityState.facilityId);
    //   // if (response == null) {
    //   //   facilityState.facilityName = "";
    //   // } else {
    //   //   facilityState.facilityName = response.name;
    //   // }
    // }

    // final token = await keycloakService.getToken();
    // Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    // // NOTE: KeyCloakのrolesは role と permission を含めているため、authorities と呼称する
    // notifier.authorities =
    //     decodedToken['realm_access']['roles'].cast<String>();

    // profile = await keycloakService.loadUserProfile();
    // notifier.userName = profile!.username;
    // notifier.fullname = "${profile.lastName}${profile.firstName}";
    // } else {
    //   notifier.userName = "";
    //   notifier.fullname = "";
    //   notifier.authorities = [];
    // }

    return isLoggedIn;
  }
}
