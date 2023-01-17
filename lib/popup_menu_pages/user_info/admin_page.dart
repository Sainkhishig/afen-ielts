import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:afen_ielts/common/common_dialog.dart';
import 'package:afen_ielts/common/common_popup_menu.dart';
import 'package:afen_ielts/common/common_widget.dart';
import 'package:afen_ielts/main/login_state.dart';
import 'package:afen_ielts/main/main_route.dart';
import 'package:afen_ielts/popup_menu_pages/user_info/model/plan_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AdminConfirmationPage extends HookConsumerWidget {
  // Firebase 認証
  final _database = FirebaseDatabase.instance.reference();
  late LoginState loginState;
  DateFormat dateFormatter = DateFormat('yyyy/MM/dd');
  DateFormat dateWithHourFormatter = DateFormat('yyyy/MM/dd HH:mm');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loginState = ref.read(loginStateNotifierProvider);
    var router = ref.read(mainRouteProvider).router;

    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  router.goNamed("home");
                },
              ),
              const Expanded(
                child: Text("Хэрэглэгчийн хүсэлт баталгаажуулах"),
              )
            ],
          ),
          actions: [
            Visibility(
                visible: loginState.loggedIn,
                child: commonPopUpMenu(context, ref)),
          ]),
      body: Column(
        children: [
          ListTile(
            title: const Text("Хэрэглэгч"),
            subtitle: Text(loginState.userName),
          ),
          const Text("Хэрэглэгчийн эрх батлах"),
          StreamBuilder(
            stream: _database.child('UserPlan').orderByKey().onValue,
            builder: (context, snapshot) {
              final tilesList = <Widget>[];

              if (snapshot.hasData &&
                  (snapshot.data! as Event).snapshot.value != null) {
                // final datas = (snapshot.data! as Event).snapshot;
                // print("myUserKeydatas:$datas");
                final myUsers = Map<String, dynamic>.from(
                    (snapshot.data! as Event).snapshot.value);

                myUsers.forEach((keyUser, value) {
                  final nextUser =
                      PlanModel.fromRTDB(Map<String, dynamic>.from(value));
                  // nextUser.userKey = keyUser;
                  // print("gram*${nextUser.code}");
                  final userTile = Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.grey))),
                      child: ListTile(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(nextUser.userId),
                                        Text(nextUser.userName),
                                      ])),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("${nextUser.level}"),
                                        Text("${nextUser.monthInterval}  сар"),
                                        Text(dateWithHourFormatter
                                            .format(nextUser.writeDate)),
                                      ])),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${nextUser.price} ₮"),
                                      !nextUser.isPaid
                                          ? const Text("төлсөн",
                                              style:
                                                  TextStyle(color: Colors.blue))
                                          : const Text("төлөөгүй",
                                              style: TextStyle(
                                                  color: Colors.amber)),
                                      Text(dateWithHourFormatter
                                          .format(nextUser.paidDate)),
                                    ],
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(nextUser.isTestPlan
                                          ? "Дасгал ажил"
                                          : "Онлайн хичээл"),
                                      Text(
                                          "${dateFormatter.format(nextUser.startDate)} ~ ${dateFormatter.format(nextUser.endDate)}"),
                                      Text(nextUser.isApproved
                                          ? "Идэвхитэй"
                                          : "Идэвхигүй"),
                                    ],
                                  )),
                              Expanded(
                                flex: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Visibility(
                                        visible: !nextUser.isApproved &&
                                            !nextUser.isCancelled,
                                        child: ElevatedButton(
                                          child: const Text("Батлах"),
                                          onPressed: () async {
                                            var startDate = DateTime.now();
                                            var endDate = startDate
                                                .add(const Duration(days: 62));

                                            // var endDate =
                                            //     DateUtils.addMonthsToMonthDate(
                                            //         startDate,
                                            //         int.parse(nextUser
                                            //             .monthInterval));
                                            var _todoQuery = _database
                                                .child("/UserPlan")
                                                .child("/$keyUser");
                                            try {
                                              await _todoQuery.update({
                                                'startDate': startDate
                                                    .microsecondsSinceEpoch,
                                                'endDate': endDate
                                                    .microsecondsSinceEpoch,
                                                'approveDate': startDate
                                                    .microsecondsSinceEpoch,
                                                "isApproved": true,
                                              });
                                              showSuccessToastMessage(context,
                                                  "Эрхийн мэдээллийг амжилттай шинэчиллээ");
                                            } catch (ex) {
                                              showErrorToastMessage(context,
                                                  "Эрх баталгаажуулахад алдаа гардаа:$ex");
                                            }
                                          },
                                        ),
                                      ),
                                      Visibility(
                                          visible: nextUser.isApproved,
                                          child: Text(dateWithHourFormatter
                                              .format(nextUser.approveDate))),
                                      Visibility(
                                        visible: nextUser.isApproved,
                                        child: ElevatedButton(
                                          child: const Text("Цуцлах"),
                                          onPressed: () async {
                                            var _todoQuery = _database
                                                .child("/UserPlan")
                                                .child("/$keyUser");
                                            await _todoQuery.update({
                                              "isApproved": false,
                                              'startDate': nextUser.writeDate
                                                  .microsecondsSinceEpoch,
                                              'endDate': nextUser.writeDate
                                                  .microsecondsSinceEpoch,
                                              'approveDate': nextUser.writeDate
                                                  .microsecondsSinceEpoch
                                            });
                                          },
                                        ),
                                      )
                                    ]),
                              ),
                              Visibility(
                                visible: !nextUser.isApproved,
                                child: Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    child: const Text("Утсгах"),
                                    onPressed: () async {
                                      var isConfirmed =
                                          await showConfirmationMessage(
                                              context,
                                              "Мэдээлэл устгах",
                                              "Эрхийн мэдээллийг устгахдаа итгэлтэй байна уу?");

                                      if (isConfirmed) {
                                        var _todoQuery = _database
                                            .child("/UserPlan")
                                            .child("/$keyUser");

                                        try {
                                          await _todoQuery.remove();
                                          showSuccessToastMessage(context,
                                              "Эрхийн мэдээллийг амжилттай устгалаа");
                                        } catch (ex) {
                                          showErrorToastMessage(context,
                                              "Эрх устгахад алдаа гардаа:$ex");
                                        }
                                      }
                                    },
                                  ),
                                ),
                              )
                            ]),
                      ));
                  tilesList.add(userTile);
                });
              }
              return Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15),
                child: ListView(children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                            flex: 2,
                            child: Text("Хэрэглэгч",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ))),
                        Expanded(
                            flex: 2,
                            child: Text("Түвшин",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ))),
                        Expanded(
                          flex: 2,
                          child: Text("Төлбөр",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text("Эрх",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text("Баталгаажуулалт",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(" ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Text("Хүсэлтийн огноо",
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //       )),
                        // ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Text("Төлбөр төлсөн огноо",
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //       )),
                        // ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Text("Баталсан огноо",
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //       )),
                        // ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Text(" ",
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //       )),
                        // ),
                      ]),
                  ...tilesList
                ]),
              ));
            },
          )
          // Padding(
          //     padding: EdgeInsets.all(10),
          //     child: StreamBuilder(
          //       stream: _database.child('UserPlan').orderByKey().onValue,
          //       builder: (context, snapshot) {
          //         final tilesList = <Widget>[];

          //         if (snapshot.hasData &&
          //             (snapshot.data! as Event).snapshot.value != null) {
          //           // final datas = (snapshot.data! as Event).snapshot;
          //           // print("myUserKeydatas:$datas");
          //           final myUsers = Map<String, dynamic>.from(
          //               (snapshot.data! as Event).snapshot.value);

          //           myUsers.forEach((keyUser, value) {
          //             print("userkey$keyUser");
          //             final nextUser =
          //                 PlanModel.fromRTDB(Map<String, dynamic>.from(value));
          //             // nextUser.userKey = keyUser;
          //             // print("gram*${nextUser.code}");
          //             final userTile = Container(
          //               decoration: const BoxDecoration(
          //                   border: Border(
          //                       bottom: BorderSide(
          //                           width: 1.0, color: Colors.grey))),
          //               child: ListTile(
          //                 leading: const Icon(Icons.verified_user),
          //                 title: Column(
          //                   children: [
          //                     Row(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Expanded(
          //                             flex: 1,
          //                             child: Text(nextUser.level),
          //                           ),
          //                           Expanded(
          //                             flex: 2,
          //                             child: Text(nextUser.name),
          //                           ),
          //                           Expanded(
          //                               flex: 1,
          //                               child: Text(
          //                                   nextUser.writeDate.toString())),
          //                         ])
          //                   ],
          //                 ),
          //                 onTap: () {
          //                   // controller.setDetailData(nextUser);
          //                 },
          //               ),
          //             );
          //             tilesList.add(userTile);
          //           });
          //           //## without key
          //           // tilesList.addAll(
          //           //     Map<String, dynamic>.from(myUsers).values.map((e) {
          //           //   final nextUser =
          //           //       User.fromRTDB(Map<String, dynamic>.from(e));
          //           //   return ListTile(
          //           //       leading: Icon(Icons.verified_user),
          //           //       title: Text(nextUser.name),
          //           //       subtitle: Column(children: [
          //           //         Text(nextUser.mobile),
          //           //         Text(nextUser.email)
          //           //       ]));
          //           // }));
          //         }
          //         return Expanded(
          //             child: ListView(children: [
          //           Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: const [
          //                 Expanded(
          //                     flex: 1,
          //                     child: Text("Код",
          //                         style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                         ))),
          //                 Expanded(
          //                   flex: 2,
          //                   child: Text("Нэр",
          //                       style: TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                       )),
          //                 ),
          //                 Expanded(
          //                   flex: 1,
          //                   child: Text("Бүртгэсэн огноо",
          //                       style: TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                       )),
          //                 ),
          //               ]),
          //           ...tilesList
          //         ]));
          //       },
          //     )),
        ],
      ),
    );
  }

  Future<bool> sendPlanRequest(level, plan, planfee) async {
    final newData = <String, dynamic>{
      'userId': loginState.userId,
      'userName': loginState.userName,
      'level': "$level",
      'plan': plan,
      'planfee': plan,
      'paymentStatus': "waiting", //waiting, Complete
      'isCancelled': false,
      'startTime': DateTime.now().microsecondsSinceEpoch,
      'endTime': DateTime.now().microsecondsSinceEpoch,
      'writeDate': DateTime.now().microsecondsSinceEpoch,
    };
    try {
      await _database.child('UserPlan').push().set(newData);
      return true;
    } catch (ex) {
      print("ex");
      return false;
    }
  }

  Widget borderWidget(String text,
      {double heightRow = 50, FontWeight fontWight = FontWeight.normal}) {
    return Container(
      height: heightRow,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: fontWight),
      ),
    );
  }
}

// class planSelec {
//   late NumberOrder sampleCounter;
//   late String wordMn;
//   late String kanji;
//   late String wordEN;
//   late String reading;

//   CounterGroup(
//       this.wordEN, this.kanji, this.reading, this.wordMn, this.sampleCounter);
// }

class LevelFeeSelection {
  late String level;
  late List<LevelPrice> levelPrice;
  LevelFeeSelection(this.level, this.levelPrice);
}

class LevelPrice {
  late int month;
  late double price;
  LevelPrice(this.month, this.price);
}

class PlanPrice {
  late int level;
  late double price;
  PlanPrice(this.level, this.price);
}

class PlanPriceByMonth {
  late String month;
  late List<PlanPrice> price;
  PlanPriceByMonth(this.month, this.price);
}

var lstPlanByMonth = <PlanPriceByMonth>[
  PlanPriceByMonth("1month", planPriceOneMonth),
  PlanPriceByMonth("2month", planPriceTwoMonth),
  PlanPriceByMonth("3month", planPriceThreeMonth),
];
var planPriceOneMonth = [
  PlanPrice(5, 40000),
  PlanPrice(4, 50000),
  PlanPrice(3, 50000),
  PlanPrice(2, 70000),
  PlanPrice(1, 70000),
];
var planPriceTwoMonth = [
  PlanPrice(5, 60000),
  PlanPrice(4, 75000),
  PlanPrice(3, 75000),
  PlanPrice(2, 100000),
  PlanPrice(1, 100000),
];
var planPriceThreeMonth = [
  PlanPrice(5, 80000),
  PlanPrice(4, 100000),
  PlanPrice(3, 100000),
  PlanPrice(2, 140000),
  PlanPrice(1, 140000),
];
var lstPlan = <LevelFeeSelection>[
  LevelFeeSelection("N5", priceN5),
  LevelFeeSelection("N4", priceN4),
  LevelFeeSelection("N3", priceN3),
  LevelFeeSelection("N5", priceN2),
  LevelFeeSelection("N5", priceN1),
];

var priceN5 = [
  LevelPrice(1, 40000),
  LevelPrice(2, 60000),
  LevelPrice(3, 60000),
];

var priceN4 = [
  LevelPrice(1, 50000),
  LevelPrice(2, 75000),
  LevelPrice(3, 100000),
];

var priceN3 = [
  LevelPrice(1, 50000),
  LevelPrice(2, 75000),
  LevelPrice(3, 100000),
];

var priceN2 = [
  LevelPrice(1, 70000),
  LevelPrice(2, 105000),
  LevelPrice(3, 140000),
];

var priceN1 = [
  LevelPrice(1, 70000),
  LevelPrice(2, 105000),
  LevelPrice(3, 140000),
];
// 1сар	40	50	50	70	70
// 2сар	60	75	75	105	105
// 3сар	80	100	100	140	140

// class PlanModel {
//   late String userId;
//   late String level;
//   late String planName;
//   late String paymentStatus;
//   late String isCancelled;
//   late String startTime;
//   late String endTime;
//   late String writeDate;
// }
