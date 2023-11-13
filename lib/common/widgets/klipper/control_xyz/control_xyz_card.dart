import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../pages/channel/logic.dart';
import '../../../utils/time_util.dart';
import '../IconElevatedButton.dart';
import '../async_button_.dart';
import '../homed_axis_chip.dart';
import '../range_selector.dart';
import '../toolhead_info_table.dart';


class ControlXYZCard extends HookConsumerWidget {
  static const marginForBtns = EdgeInsets.all(10);

  const ControlXYZCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var klippyCanReceiveCommands =true;
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(FlutterIcons.axis_arrow_mco),
            title:  Text("移动控制".tr),
            trailing: const HomedAxisChip(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          children: [
                            SquareElevatedIconButton(
                                margin: marginForBtns,
                                onPressed: klippyCanReceiveCommands
                                    ? () {

                                }
                                    : null,
                                child: const Icon(FlutterIcons.upsquare_ant)),
                          ],
                        ),
                        Row(
                          children: [
                            SquareElevatedIconButton(
                                margin: marginForBtns,
                                onPressed: klippyCanReceiveCommands
                                    ? () => {}
                                    : null,
                                child: const Icon(FlutterIcons.leftsquare_ant)),
                            Tooltip(
                              message:
                                  'pages.dashboard.general.move_card.home_xy_tooltip'.tr
                                      ,
                              child: AsyncElevatedButton.squareIcon(
                                margin: marginForBtns,
                                onPressed: klippyCanReceiveCommands
                                    ? () => {}
                                    : null,
                                icon: const Icon(Icons.home),
                              ),
                            ),
                            SquareElevatedIconButton(
                                margin: marginForBtns,
                                onPressed: klippyCanReceiveCommands
                                    ? () {

                                }
                                    : null,
                                child:
                                    const Icon(FlutterIcons.rightsquare_ant)),
                          ],
                        ),
                        Row(
                          children: [
                            SquareElevatedIconButton(
                              margin: marginForBtns,
                              onPressed: klippyCanReceiveCommands
                                  ? () =>
                              {}
                                  : null,
                              child: const Icon(FlutterIcons.downsquare_ant),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SquareElevatedIconButton(
                            margin: marginForBtns,
                            onPressed: klippyCanReceiveCommands
                                ? () =>
                            {}
                                : null,
                            child: const Icon(FlutterIcons.upsquare_ant)),
                        Tooltip(
                          message:
                              'pages.dashboard.general.move_card.home_z_tooltip'.tr
                                  ,
                          child: AsyncElevatedButton.squareIcon(
                              margin: marginForBtns,
                              onPressed: klippyCanReceiveCommands
                                  ? () =>
                              {}
                                  : null,
                              icon: const Icon(Icons.home)),
                        ),
                        SquareElevatedIconButton(
                            margin: marginForBtns,
                            onPressed: klippyCanReceiveCommands
                                ? () =>
                            {}
                                : null,
                            child: const Icon(FlutterIcons.downsquare_ant)),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: ToolheadInfoTable(
                    rowsToShow: [ToolheadInfoTable.POS_ROW],
                  ),
                ),
               // const _ShortCuts(),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Text(
                        '步进值'.tr+ '[mm]',
                      ),
                    ),
                    RangeSelector(
                        selectedIndex: 0,
                        onSelected: (e){},
                        values: const [1, 10, 25, 50]
                            .map((e) => e.toString())
                            .toList())
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class BabySteppingCard extends ConsumerWidget {
  const BabySteppingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var zOffset = 0.000;
    var klippyCanReceiveCommands = true;

    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
              leading: const Icon(FlutterIcons.align_vertical_middle_ent),
              title: const Text('Z轴偏移'),
              trailing: Chip(
                avatar: Icon(
                  FlutterIcons.progress_wrench_mco,
                  color: Theme.of(context).iconTheme.color,
                  size: 20,
                ),
                label: Text('${zOffset.toStringAsFixed(3)}mm'),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    SquareElevatedIconButton(
                        margin: const EdgeInsets.all(10),
                        onPressed: klippyCanReceiveCommands
                            ? () =>
                        {}
                            : null,
                        child: const Icon(FlutterIcons.upsquare_ant)),
                    SquareElevatedIconButton(
                        margin: const EdgeInsets.all(10),
                        onPressed: klippyCanReceiveCommands
                            ? () =>
                        {}
                            : null,
                        child: const Icon(FlutterIcons.downsquare_ant)),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                          '步长 [mm]'),
                    ),
                    RangeSelector(
                        selectedIndex: 0,
                        onSelected: (index){},
                        values: const [0.005, 0.01, 0.05, 0.1]
                            .map((e) => e.toString())
                            .toList()
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class _ShortCuts extends ConsumerWidget {
  const _ShortCuts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logic = Get.find<ChannelLogic>();
    var klippyCanReceiveCommands = true;

    var directActions = logic.directActions;

    return Wrap(
      runSpacing: 4,
      spacing: 8,
      alignment: WrapAlignment.center,
      children: [
        ...directActions
            .map(
              (e) => Tooltip(
                message: e.description,
                child: AsyncElevatedButton.icon(
                  onPressed: klippyCanReceiveCommands ? e.callback : null,
                  icon: Icon(e.icon),
                  label: Text(e.title.toUpperCase()),
                ),
              ),
            )
            .toList(),
        // _MoreActionsPopup(
        //   klippyCanReceiveCommands: klippyCanReceiveCommands,
        //   entries: moreActions,
        // ),
      ],
    );
  }
}

class _MoreActionsPopup extends ConsumerWidget {
  const _MoreActionsPopup({
    Key? key,
    required this.entries,
    required this.klippyCanReceiveCommands,
  }) : super(key: key);
  final List<QuickAction> entries;
  final bool klippyCanReceiveCommands;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeData = Theme.of(context);

    bool enabled =
        klippyCanReceiveCommands && entries.any((e) => e.callback != null);

    return PopupMenuButton(
        enabled: enabled,
        position: PopupMenuPosition.over,
        itemBuilder: (BuildContext context) => entries
            .map(
              (e) => PopupMenuItem(
                enabled: klippyCanReceiveCommands,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                onTap: e.callback,
                child: ListTile(
                  enabled: e.callback != null,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  leading: Icon(e.icon),
                  title: Text(e.title),
                  subtitle: Text(e.description),
                ),
              ),
            )
            .toList(),
        child: ElevatedButton.icon(
            style: enabled
                ? ElevatedButton.styleFrom(
                    disabledBackgroundColor: themeData.colorScheme.primary,
                    disabledForegroundColor: themeData.colorScheme.onPrimary)
                : null,
            onPressed: null,
            icon: const Icon(Icons.more_vert),
            label:
                 Text("supper:pages.dashboard.general.move_card.more_btn".tr)
                    ));
  }
}
