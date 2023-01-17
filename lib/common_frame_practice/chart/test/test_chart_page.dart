// чартын тусламж : https://help.syncfusion.com/flutter/cartesian-charts/axis-types
// import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:afen_ielts/common/common_enum.dart';
import 'package:afen_ielts/common/common_widget.dart';
import 'package:afen_ielts/common_frame_practice/chart/test/test_chart_controller.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class CommonTestChart extends HookConsumerWidget {
  CommonTestChart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(testChartController.notifier);
    controller.setModelListenable(ref);
    final future = useMemoized(() => controller.getTestResult());
    final snapshot = useFuture(future, initialData: null);
    if (snapshot.hasError) {
      return showErrorWidget(
          context, "Графикийн өгөдлийг авч чадсангүй", snapshot.error);
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
        body: Center(
            child: Row(
      children: [
        Expanded(
          child: SfCartesianChart(
              title: ChartTitle(text: "Ажилласан тестийн график үзүүлэлт"),
              tooltipBehavior: TooltipBehavior(enable: true),
              primaryYAxis: NumericAxis(minimum: 0, maximum: 100),
              primaryXAxis: DateTimeAxis(
                dateFormat: DateFormat.yMd(),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                // multiLevelLabels: <DateTimeMultiLevelLabel>[
                //   DateTimeMultiLevelLabel(
                //       start: DateTime(2020, 1, 1),
                //       end: DateTime(2022, 1, 1),
                //       text: 'First'),
                //   // DateTimeMultiLevelLabel(
                //   //     start: DateTime(2022, 1, 1),
                //   //     end: DateTime(2024, 1, 1),
                //   //     text: 'Second'),
                //   // DateTimeMultiLevelLabel(
                //   //     start: DateTime(2020, 1, 1),
                //   //     end: DateTime(2022, 1, 1),
                //   //     text: 'Third',
                //   //     level: 1),
                //   // DateTimeMultiLevelLabel(
                //   //     start: DateTime(2022, 1, 1),
                //   //     end: DateTime(2024, 1, 1),
                //   //     text: 'Fourth',
                //   //     level: 1),
                // ]
              ),
              series: <ChartSeries<TestChartData, DateTime>>[
                getChartSeries(
                    TestType.kanji, controller.getChartData(TestType.kanji.id)),
                getChartSeries(TestType.vocabulary,
                    controller.getChartData(TestType.vocabulary.id)),
                getChartSeries(TestType.grammar,
                    controller.getChartData(TestType.grammar.id)),
                getChartSeries(TestType.reading,
                    controller.getChartData(TestType.reading.id)),
                getChartSeries(TestType.listening,
                    controller.getChartData(TestType.listening.id)),
              ]),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("―　${TestType.kanji.label}",
                  style: TextStyle(
                      color: TestType.kanji.chartColor,
                      fontWeight: FontWeight.bold)),
              Text("―　${TestType.vocabulary.label}",
                  style: TextStyle(
                      color: TestType.vocabulary.chartColor,
                      fontWeight: FontWeight.bold)),
              Text("―　${TestType.grammar.label}",
                  style: TextStyle(
                      color: TestType.grammar.chartColor,
                      fontWeight: FontWeight.bold)),
              Text("―　${TestType.reading.label}",
                  style: TextStyle(
                      color: TestType.reading.chartColor,
                      fontWeight: FontWeight.bold)),
              Text("―　${TestType.listening.label}",
                  style: TextStyle(
                      color: TestType.listening.chartColor,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        )
      ],
    )));
  }

  getChartSeries(TestType testType, List<TestChartData> chartData) {
    return LineSeries<TestChartData, DateTime>(
      name: testType.label,
      dataLabelSettings: const DataLabelSettings(isVisible: true),
      dataSource: chartData,
      markerSettings: const MarkerSettings(
        isVisible: true,
        height: 4,
        width: 4,
        shape: DataMarkerType.circle,
        borderWidth: 4,
      ),
      color: testType.chartColor,
      width: 3,
      enableTooltip: true,
      xValueMapper: (TestChartData data, _) => data.x,
      yValueMapper: (TestChartData data, _) => data.y,
    );
  }
}
// final List<TestChartData> chartDataDate2 = <TestChartData>[
//       TestChartData(DateTime(2022, 12, 1), 60),
//       TestChartData(DateTime(2022, 12, 2), 50),
//       TestChartData(DateTime(2022, 12, 3), 35),
//       TestChartData(DateTime(2022, 12, 3), 77),
//       TestChartData(DateTime(2023, 1, 4), 100)
//     ];

/*

*/
