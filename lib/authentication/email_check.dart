// import 'package:afen_ielts/authentication/home.dart';
import 'package:afen_ielts/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Emailcheck extends StatefulWidget {
  // 呼び出し元Widgetから受け取った後、変更をしないためfinalを宣言.
  final String? email;
  final String? pswd;
  final int? from; //1 → アカウント作成画面から    2 → ログイン画面から

  Emailcheck({Key? key, this.email, this.pswd, this.from}) : super(key: key);

  @override
  _Emailcheck createState() => _Emailcheck();
}

class _Emailcheck extends State<Emailcheck> {
  final _auth = FirebaseAuth.instance;
  UserCredential? _result;
  late String? _nocheckText;
  late String? _sentEmailText;
  int _btn_click_num = 0;

  @override
  Widget build(BuildContext context) {
    // 前画面から遷移後の初期表示内容
    if (_btn_click_num == 0) {
      if (widget.from == 1) {
        // アカウント作成画面から遷移した時
        _nocheckText = '';
        _sentEmailText = '${widget.email}\nБаталгаажуулах шууданг илгээлээ.';
      } else {
        _nocheckText =
            'Бүртгэл баталгаажаагүй байна.\nТанд илгээсэн цахим шуудангийн баталгаажуулах холбоосыг дарж бүртгэлээ баталгаажуулна уу.';
        _sentEmailText = '';
      }
    }

    return Scaffold(
      // メイン画面
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 確認メール未完了時のメッセージ
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
              child: Text(
                _nocheckText!,
                style: TextStyle(color: Colors.red),
              ),
            ),

            // 確認メール送信時のメッセージ
            Text(_sentEmailText!),

            // 確認メールの再送信ボタン
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
              child: ButtonTheme(
                minWidth: 200.0,
                // height: 100.0,
                child: RaisedButton(
                  // ボタンの形状
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  onPressed: () async {
                    _result = await _auth.signInWithEmailAndPassword(
                      email: widget.email!,
                      password: widget.pswd!,
                    );

                    _result!.user!.sendEmailVerification();
                    setState(() {
                      _btn_click_num++;
                      _sentEmailText =
                          '${widget.email}\nБаталгаажуулах шууданг дахин илгээлээ.';
                    });
                  },

                  // ボタン内の文字や書式
                  child: const Text(
                    'Баталгаажулах шуудан дахин авах',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.white,
                  color: Colors.grey,
                ),
              ),
            ),

            // メール確認完了のボタン配置（Home画面に遷移）
            ButtonTheme(
              minWidth: 350.0,
              // height: 100.0,
              child: RaisedButton(
                // ボタンの形状
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                onPressed: () async {
                  _result = await _auth.signInWithEmailAndPassword(
                    email: widget.email!,
                    password: widget.pswd!,
                  );

                  // Email確認が済んでいる場合は、Home画面へ遷移
                  if (_result!.user!.emailVerified) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                              user_id: _result!.user!.uid, auth: _auth),

                          // MaterialPageRoute(
                          //   builder: (context) =>
                          //       Home(user_id: _result!.user!.uid, auth: _auth),
                        ));
                  } else {
                    // print('NG');
                    setState(() {
                      _btn_click_num++;
                      _nocheckText =
                          'Бүртгэл баталгаажаагүй байна.\nТанд илгээсэн цахим шуудангийн баталгаажуулах холбоосыг дарж бүртгэлээ баталгаажуулна уу.';
                    });
                  }
                },

                // ボタン内の文字や書式
                child: const Text(
                  'Цахим хаягийн баталгаажуулалт хийсэн',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                textColor: Colors.white,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
