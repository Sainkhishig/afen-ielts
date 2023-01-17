import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:afen_ielts/common/common_dialog.dart';
import 'package:afen_ielts/common/common_popup_menu.dart';
import 'package:afen_ielts/common/common_widget.dart';
import 'package:afen_ielts/common/common_enum.dart';
import 'package:afen_ielts/main/login_state.dart';
import 'package:afen_ielts/main/main_route.dart';
import 'package:afen_ielts/popup_menu_pages/user_info/model/plan_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class PlanFee extends HookConsumerWidget {
  // Firebase 認証
  final _database = FirebaseDatabase.instance.reference();
  late LoginState loginState;
  final currencyFilter = (num a) => NumberFormat("#,###", "ja_JP").format(a);
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
              Expanded(
                child: Text(PopupMenu.planFee.title),
              )
            ],
          ),
          actions: [
            Visibility(
                visible: loginState.loggedIn,
                child: commonPopUpMenu(context, ref)),
          ]),
      body: Card(
          child: ListView(children: [
        const SizedBox(
          height: 5,
        ),
        ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: const Text(" Онлайн хичээлийн эрх:"),
            children: [
              Column(
                children: [
                  getMonthHeader(),
                  ...getPlanBody(context, lstPlan, false)
                ],
              )
            ]),
        ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: const Text(" Дасгал ажлын эрх:"),
            children: [
              Column(
                children: [
                  getMonthHeader(),
                  ...getPlanBody(context, lstTestPlan, true)
                ],
              )
            ])
      ])),
    );
  }

  getPlanBody(context, List<LevelFeeSelection> planData, isTestPlan) {
    return planData.map((plan) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${plan.level} түвшин"),
          ...plan.levelPrice.map((levelPrice) {
            var monthColor = levelPrice.month == 1
                ? Colors.red.shade300
                : levelPrice.month == 2
                    ? Colors.blue.shade300
                    : Colors.green.shade300;
            if (isTestPlan) {
              monthColor = levelPrice.month == 1
                  ? Colors.yellow.shade300
                  : levelPrice.month == 2
                      ? Colors.indigo.shade300
                      : Colors.lightGreen.shade300;
            }
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: monthColor),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        '${currencyFilter(levelPrice.price)} ₮',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    var isConfirmed = await showConfirmationMessage(
                        context,
                        isTestPlan
                            ? "Дасгал ажлын эрх"
                            : "Онлайн хичээлийн эрх",
                        "Эрхийг идэвхижүүлэх үү? \n   Түвшин: ${plan.level} \n   Хугацаа: ${levelPrice.month} сар \n   Төлбөр: ${currencyFilter(levelPrice.price)} ₮");
                    if (isConfirmed) {
                      PlanModel planDetail = PlanModel(
                          loginState.userId,
                          loginState.userName,
                          plan.level,
                          "${levelPrice.month}",
                          levelPrice.price,
                          false,
                          false,
                          false,
                          isTestPlan,
                          DateTime.now(),
                          DateTime.now(),
                          DateTime.now(),
                          DateTime.now(),
                          DateTime.now());
                      var requestSent = await sendPlanRequest(planDetail);
                      if (requestSent) {
                        showInfoMessage(context, "Баярлалаа",
                            "Таны эрхийг үүсгэлээ. Төлбөр төлөгдсөний дараа эрх тань идэвхижих болно. Та дараах дансанд төлбөрөө шилжүүлсний дараа хэрэглэгчийн мэдээлэл цэс рүү орж төлбөр төлсөн мэдэгдлээ илгээнэ үү.");
                      } else {
                        showErrorToastMessage(context,
                            "Уучлаарай хүсэлт амжилтгүй боллоо. Та манай пэйж хуудсанд холбогдоно уу.");
                      }
                    }
                  },
                ),
              ),
            );
          })
        ],
      );
    });
  }

  getMonthHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(""),
        ...[1, 2, 3]
            .map((e) => Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "$e сар",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    ))))
            .toList()
      ],
    );
  }

  Future<bool> sendPlanRequest(PlanModel plan) async {
    final newData = <String, dynamic>{
      'userId': plan.userId,
      'userName': plan.userName,
      'level': plan.level,
      'monthInterval': plan.monthInterval,
      'isTestPlan': plan.isTestPlan,
      'price': plan.price,
      'isPaid': false,
      'isCancelled': false,
      'paidDate': DateTime.now().microsecondsSinceEpoch,
      'writeDate': DateTime.now().microsecondsSinceEpoch,
      'isApproved': false,
      'approveDate': DateTime.now().microsecondsSinceEpoch,
      'startDate': DateTime.now().microsecondsSinceEpoch,
      'endDate': DateTime.now().microsecondsSinceEpoch,
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

class LevelPriceWithSale {
  late int month;
  late double price;
  late double saleBefPrice;
  LevelPriceWithSale(this.month, this.price, this.saleBefPrice);
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
  LevelFeeSelection("N2", priceN2),
  LevelFeeSelection("N1", priceN1),
];

var lstTestPlan = <LevelFeeSelection>[
  LevelFeeSelection("N5", priceTEstPlan),
  LevelFeeSelection("N4", priceTEstPlan),
  LevelFeeSelection("N3", priceTEstPlan),
  LevelFeeSelection("N2", priceTEstPlan),
  LevelFeeSelection("N1", priceTEstPlan),
];
var priceTEstPlan = [
  LevelPrice(1, 10000),
  LevelPrice(2, 15000),
  LevelPrice(3, 20000),
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
