import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:afen_ielts/common_frame_practice/readingentry/detail/reading_detail.dart';
import 'package:afen_ielts/common_frame_practice/readingentry/list/reading_list.dart';
import 'package:afen_ielts/common_frame_practice/readingentry/list/reading_list_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// pyafm100: 部屋タイプ RoomType
class ReadingN5 extends HookConsumerWidget {
  const ReadingN5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(readingListController.notifier);
    ref.watch(readingListController);

    final future = useMemoized(() => controller.setMasterData());
    final snapshot = useFuture(future, initialData: null);

    if (snapshot.hasError) return ErrorWidget(snapshot.error!);
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    return Row(
      children: [
        Flexible(
          child: ReadingList(),
        ),
        // const VerticalDivider(thickness: 1.0, color: Colors.black12),
        Flexible(
          child: ReadingDetail(),
        )
        // controller.roomTypeId == null
        //     ?
        //     : Flexible(
        //         child: PlanPriceDetail(
        //             planId: controller.selectedId ?? "",
        //             roomTypeId: controller.roomTypeId ?? "",
        //             siteId: controller.state.planType),
        //       ),
      ],
    );
  }
}
