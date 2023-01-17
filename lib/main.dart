import 'dart:typed_data';
import 'package:afen_ielts/common/common_providers/shared_preferences_provider.dart';

import 'package:afen_ielts/hive_db/provider/ielts_sheet_box_provider.dart';
import 'package:afen_ielts/main/init_app.dart';
import 'package:afen_ielts/main/login_state.dart';
import 'package:afen_ielts/main/main_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(const MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(DictionaryAdapter());
  // Hive.registerAdapter(KanjiDictionaryAdapter());
  // Hive.registerAdapter(XlKanjiHiveModelAdapter());
  // Hive.registerAdapter(XlGrammarHiveModelAdapter());
  // Hive.registerAdapter(XlVocabularyHiveModelAdapter());

  // await setupServiceLocator();
  // await flutterTts.setVoice({'name': 'Kyoko', 'locale': 'ja-JP'});
  // await Firebase.initializeApp();
  // FirebaseAuth auth =
  // setPathUrlStrategy();
  // final state = LoginState();
  final state = LoginState(await SharedPreferences.getInstance());
  runApp(ProviderScope(
    overrides: [
      mainRouteProvider.overrideWithValue(MainRoute(state)),
      loginStateNotifierProvider.overrideWithValue(state),
      ieltsSheetBoxDataProvider.overrideWithValue(
          IeltsSheetBox(await Hive.openBox('IeltsSheetBoxData'))),
      sharedPreferencesProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
      firebaseAuthProvider.overrideWithValue(
        await FirebaseAuth.instance,
      ),
      // loginStateNotifierProvider.overrideWithValue(state),
    ],
    child: InitApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> pickExcel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    print("resultAri");
    if (result != null) {
      print("result has");

      PlatformFile file = result.files.first;
      var excel = Excel.decodeBytes(file.bytes!);

      for (var element in excel.sheets.values) {
        print(element.sheetName);
        for (var i = 0; i < excel.tables[element.sheetName]!.rows.length; i++) {
          var row = excel.tables[element.sheetName]!.rows[i];
          print("row:${row[0]!.value}");
        }
      }
      // for (var i = 1; i < excel.tables["Sheet1"]!.rows.length; i++) {}
      // File file = File(filePath!);
    } else {
      // User canceled the picker
    }

    // setState(() {
    //   // This call to setState tells the Flutter framework that something has
    //   // changed in this State, which causes it to rerun the build method below
    //   // so that the display can reflect the updated values. If we changed
    //   // _counter without calling setState(), then the build method would not be
    //   // called again, and so nothing would appear to happen.
    //   _counter++;
    // });
  }

  Future<void> _incrementCounter() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    print("result");
    if (result != null) {
      print("result has");
      // var filePath = result.files.single.path;
      Uint8List? fileBytes = result.files.first.bytes;
      print("printNameebyte");
      var excel = Excel.decodeBytes(fileBytes!);
      print("printNamee");
      for (var element in excel.sheets.values) {
        print(element.sheetName);
      }
      for (var i = 1; i < excel.tables["Sheet1"]!.rows.length; i++) {}
      // File file = File(filePath!);
    } else {
      // User canceled the picker
    }

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickExcel,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
