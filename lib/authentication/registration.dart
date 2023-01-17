import 'package:firebase_database/firebase_database.dart';
import 'package:afen_ielts/authentication/email_check.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:afen_ielts/common/common_enum.dart';
import 'package:afen_ielts/common/widget/afen_date_selector.dart';
import 'authentication_error.dart';

// // アカウント登録ページ
// class Registration extends StatefulWidget {
//   @override
//   _RegistrationState createState() => _RegistrationState();
// }

// class _RegistrationState extends State<Registration> {
//   String newEmail = ""; // 入力されたメールアドレス
//   String newPassword = ""; // 入力されたパスワード
//   String infoText = ""; // 登録に関する情報を表示
//   late bool pswd_OK; // パスワードが有効な文字数を満たしているかどうか

//   // Firebase Authenticationを利用するためのインスタンス
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   late UserCredential result;
//   late User user;

//   // エラーメッセージを日本語化するためのクラス
//   final auth_error = Authentication_error();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const Padding(
//                 padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 30.0),
//                 child: Text('新規アカウントの作成',
//                     style:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),

//             // メールアドレスの入力フォーム
//             Padding(
//                 padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
//                 child: TextFormField(
//                   decoration: const InputDecoration(labelText: "メールアドレス"),
//                   onChanged: (String value) {
//                     newEmail = value;
//                   },
//                 )),

//             // パスワードの入力フォーム
//             Padding(
//               padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
//               child: TextFormField(
//                   decoration: const InputDecoration(labelText: "パスワード（8～20文字）"),
//                   obscureText: true, // パスワードが見えないようRにする
//                   maxLength: 20, // 入力可能な文字数
//                   maxLengthEnforced: false, // 入力可能な文字数の制限を超える場合の挙動の制御
//                   onChanged: (String value) {
//                     if (value.length >= 8) {
//                       newPassword = value;
//                       pswd_OK = true;
//                     } else {
//                       pswd_OK = false;
//                     }
//                   }),
//             ),

//             // 登録失敗時のエラーメッセージ
//             Padding(
//               padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
//               child: Text(
//                 infoText,
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),

//             ButtonTheme(
//               minWidth: 350.0,
//               // height: 100.0,
//               child: RaisedButton(
//                 child: const Text(
//                   '登録',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 textColor: Colors.white,
//                 color: Colors.blue,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 onPressed: () async {
//                   if (pswd_OK) {
//                     try {
//                       // メール/パスワードでユーザー登録
//                       result = await auth.createUserWithEmailAndPassword(
//                         email: newEmail,
//                         password: newPassword,
//                       );

//                       // 登録成功
//                       // 登録したユーザー情報
//                       user = result.user!;
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Home(user_id: user.uid),
//                           ));
//                     } catch (e) {
//                       // 登録に失敗した場合
//                       setState(() {
//                         infoText = auth_error.register_error_msg("e.code$e");
//                       });
//                     }
//                   } else {
//                     setState(() {
//                       infoText = 'パスワードは8文字以上です.';
//                     });
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'authentication_error.dart';
// import 'email_check.dart';

// アカウント登録ページ
class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

final _database = FirebaseDatabase.instance.reference();

class _RegistrationState extends State<Registration> {
  // Firebase Authenticationを利用するためのインスタンス
  final _auth = FirebaseAuth.instance;
  late UserCredential result;
  late User user;

  String _newEmail = ""; // 入力されたメールアドレス
  String _newPassword = ""; // 入力されたパスワード
  String _infoText = ""; // 登録に関する情報を表示
  bool _pswd_OK = false; // パスワードが有効な文字数を満たしているかどうか
  String _telephone = ""; // 入力されたパスワード
  String _address = ""; // 入力されたパスワード
  String _firstName = "";
  String _lastName = "";
  late DateTime? _birthDate;
  // エラーメッセージを日本語化するためのクラス
  final auth_error = Authentication_error();
  String _userGender = Gender.male.id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 30.0),
                child: Text('Шинэ хэрэглэгчийн бүртгэл',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),

            // メールアドレスの入力フォーム
            Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Цахим хаяг"),
                  onChanged: (String value) {
                    _newEmail = value;
                  },
                )),

            // パスワードの入力フォーム
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                  decoration:
                      InputDecoration(labelText: "Нууц үг（8～20тэмдэгт）"),
                  obscureText: true, // パスワードが見えないようRにする
                  maxLength: 20, // 入力可能な文字数
                  maxLengthEnforced: false, // 入力可能な文字数の制限を超える場合の挙動の制御
                  onChanged: (String value) {
                    if (value.length >= 8) {
                      _newPassword = value;
                      _pswd_OK = true;
                    } else {
                      _pswd_OK = false;
                    }
                  }),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Овог"),
                maxLength: 20,
                maxLengthEnforced: false,
                onChanged: (String value) {
                  _firstName = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Нэр"),
                maxLength: 20,
                maxLengthEnforced: false,
                onChanged: (String value) {
                  _lastName = value;
                },
              ),
            ),
            AfenDateSelector(
                label: "Төрсөн он, сар,өдөр",
                onDateChanged: (date) {
                  _birthDate = date;
                }),
            Text("хүйс"),
            ListView.builder(
                itemCount: Gender.values.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Gender gender = Gender.values[index];
                  return RadioListTile(
                    title: Text(gender.label),
                    value: gender.id,
                    groupValue: _userGender,
                    onChanged: (value) {
                      setState(() {
                        _userGender = value.toString();
                        print("radioSelection$value");
                      });
                    },
                  );
                }),
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Утасны дугаар"),
                maxLength: 20,
                maxLengthEnforced: false,
                onChanged: (String value) {
                  _telephone = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Хаяг"),
                maxLength: 20,
                maxLengthEnforced: false,
                onChanged: (String value) {
                  _address = value;
                },
              ),
            ),
            // 登録失敗時のエラーメッセージ
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
              child: Text(
                _infoText,
                style: const TextStyle(color: Colors.red),
              ),
            ),

            // アカウント作成のボタン配置
            ButtonTheme(
              minWidth: 350.0,
              // height: 100.0,
              child: RaisedButton(
                child: const Text(
                  'Бүртгүүлэх',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                textColor: Colors.white,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () async {
                  if (_pswd_OK) {
                    try {
                      // メール/パスワードでユーザー登録
                      result = await _auth.createUserWithEmailAndPassword(
                        email: _newEmail,
                        password: _newPassword,
                      );
                      writeUser();
                      // 登録成功
                      user = result.user!; // 登録したユーザー情報
                      user.sendEmailVerification(); // Email確認のメールを送信
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Emailcheck(
                                email: _newEmail, pswd: _newPassword, from: 1),
                          ));
                    } catch (e) {
                      // 登録に失敗した場合
                      setState(() {
                        _infoText = auth_error.register_error_msg("$e");
                      });
                    }
                  } else {
                    setState(() {
                      _infoText = 'Нууц үг багадаа 8 тэмдэгт байна.';
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> writeUser() async {
    final newData = <String, dynamic>{
      'firstname': _firstName,
      'lastname': _lastName,
      'telephone': _telephone,
      'address': _address,
      'email': _newEmail,
      'password': _newPassword,
      'sex': _userGender,
      'birthday': _birthDate!.microsecondsSinceEpoch,
      'createDate': DateTime.now().microsecondsSinceEpoch
    };

    await _database.child('UserInfo').push().set(newData).catchError((onError) {
      print('could not saved data');
      throw ("aldaa garlaa");
    });
  }
}
