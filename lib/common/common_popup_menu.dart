import 'package:flutter/material.dart';
import 'package:afen_ielts/common/common_enum.dart';
import 'package:afen_ielts/main/main_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

PopupMenuButton commonPopUpMenu(context, WidgetRef ref) {
  final goRouter = ref.read(mainRouteProvider);

  return PopupMenuButton<String>(
    icon: const Icon(Icons.person),
    onSelected: (String popMenu) async {
      goRouter.router.goNamed(popMenu);
    },
    itemBuilder: (BuildContext context) {
      return PopupMenu.values.map((PopupMenu s) {
        return PopupMenuItem(
          child: Text(s.title),
          value: s.id,
          onTap: () {},
        );
      }).toList();
    },
  );
}
