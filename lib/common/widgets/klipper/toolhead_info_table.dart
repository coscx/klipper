import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/time_util.dart';



class ToolheadInfoTable extends ConsumerWidget {
  static const String POS_ROW = "p";
  static const String MOV_ROW = "m";

  final List<String> rowsToShow;

  const ToolheadInfoTable(
      {Key? key, this.rowsToShow = const [POS_ROW, MOV_ROW]})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return AnimatedSwitcher(
        switchInCurve: Curves.easeInOutBack,
        duration: kThemeAnimationDuration,
        transitionBuilder: (child, anim) => SizeTransition(
            sizeFactor: anim,
            child: FadeTransition(
              opacity: anim,
              child: child,
            )),
        child: const LinearProgressIndicator());
  }
}

