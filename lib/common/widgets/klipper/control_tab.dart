import 'dart:math';


import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_klipper/common/widgets/klipper/range_selector.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'adaptive_horizontal_scroll.dart';
import 'card_with_button.dart';
import 'card_with_switch.dart';


class FansCard extends ConsumerWidget {
  const FansCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var fanLen = 1;
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                FlutterIcons.fan_mco,
              ),
              title: const Text('风扇'),
            ),
            AdaptiveHorizontalScroll(pageStorageKey: 'fans', children: [
              const _PrintFan(),
              ...List.generate(fanLen, (index) {
                return Container();
              }),
            ]),
          ],
        ),
      ),
    );
  }
}
class PrintFan{
  double speed;
  PrintFan({required this.speed});
}
class _PrintFan extends ConsumerWidget {
  const _PrintFan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var fan = PrintFan(speed: 1);
    var klippyCanReceiveCommands = true;

    if (fan == null) {
      return const SizedBox.shrink();
    }

    return _FanCard(
      name: '模型风扇',
      speed: fan.speed,
      onTap: klippyCanReceiveCommands
          ? () =>{}

          : null,
    );
  }
}



class _FanCard extends StatelessWidget {
  static const double icoSize = 30;

  final String name;
  final double speed;
  final VoidCallback? onTap;

  const _FanCard({
    Key? key,
    required this.name,
    required this.speed,
    this.onTap,
  }) : super(key: key);

  String get fanSpeed {
    double fanPerc = speed * 100;
    if (speed > 0) return '${fanPerc.toStringAsFixed(0)} %';
    return '关闭';
  }

  @override
  Widget build(BuildContext context) {
    return CardWithButton(
        buttonChild: onTap == null
            ? const Text('风扇')
            : const Text('设置'),
        onTap: onTap,
        builder: (context) {
          return Tooltip(
            message: name,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(fanSpeed,
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
                speed > 0
                    ? const SpinningFan(size: icoSize)
                    : const Icon(
                        FlutterIcons.fan_off_mco,
                        size: icoSize,
                      ),
              ],
            ),
          );
        });
  }
}

class SpinningFan extends HookWidget {
  const SpinningFan({Key? key, required this.size}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    AnimationController animationController =
        useAnimationController(duration: const Duration(seconds: 3))..repeat();
    return RotationTransition(
      turns: animationController,
      child: Icon(FlutterIcons.fan_mco, size: size),
    );
  }
}

class ExtruderControlCard extends HookConsumerWidget {
  const ExtruderControlCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeExtruderIdx =  0;


    var minExtrudeTemp = 170;

    var canExtrude = true;

    var klippyCanReceiveCommands = true;

    var extruderSteps =10;

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(
              FlutterIcons.printer_3d_nozzle_outline_mco,
            ),
            title: Text(
                '挤出机'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: ElevatedButton.icon(
                        onPressed: klippyCanReceiveCommands && canExtrude
                            ? (){}
                            : null,
                        icon: const Icon(FlutterIcons.minus_ant),
                        label: const Text(
                                '回抽')
                            ,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: ElevatedButton.icon(
                        onPressed: klippyCanReceiveCommands && canExtrude
                            ? (){}
                            : null,
                        icon: const Icon(FlutterIcons.plus_ant),
                        label: const Text(
                                '挤出')
                            ,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                          '长度 [mm]'),
                    ),
                    RangeSelector(
                        selectedIndex:
                            0,
                        onSelected: (index){},
                        values:
                        const [1, 10, 25, 50].map((e) => e.toString()).toList()),
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
class GCodeMacro {
  GCodeMacro(
      {DateTime? created,
        DateTime? lastModified,
        required this.name,
        String? uuid,
        this.visible = true,
        this.showWhilePrinting = true})
      : uuid = uuid ?? const Uuid().v4();


  String name;

  final String uuid;
  bool visible;
  bool showWhilePrinting;

  String get beautifiedName => name.replaceAll("_", " ");



  @override
  String toString() {
    return 'GCodeMacro{name: $name, uuid: $uuid, showWhilePrinting: $showWhilePrinting}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GCodeMacro &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              uuid == other.uuid &&
              visible == other.visible &&
              showWhilePrinting == other.showWhilePrinting;

  @override
  int get hashCode =>
      name.hashCode ^
      uuid.hashCode ^
      visible.hashCode ^
      showWhilePrinting.hashCode;
}
class MacroGroup {
  MacroGroup({
    DateTime? created,
    DateTime? lastModified,
    required this.name,
    String? uuid,
    this.macros = const [],
  })
      : uuid = uuid ?? const Uuid().v4();

  String name;
  final String uuid;
  List<GCodeMacro> macros;

}

class GcodeMacroCard extends HookConsumerWidget {
  const GcodeMacroCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var klippyCanReceiveCommands = true;

    var macroGroups  = const <MacroGroup>[];

    var isPrinting = false;

    int idx = 0;

    var selected = useState(idx);
    var themeData = Theme.of(context);

    var macrosOfGrp = [];
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(FlutterIcons.code_braces_mco),
            title: const Text('pages.dashboard.control.macro_card.title'),
            trailing: (macroGroups.length > 1)
                ? DropdownButton<int>(
                    value: selected.value,
                    onChanged: klippyCanReceiveCommands
                        ? (e) {

                          }
                        : null,
                    items: macroGroups.asMap().entries.map((entry) {
                      MacroGroup item = entry.value;
                      int index = entry.key;
                      return DropdownMenuItem(
                        value: index,
                        child: Text(item.name),
                      );
                    }).toList())
                : null,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Wrap(
              spacing: 5.0,
              children: List<Widget>.generate(
                macrosOfGrp.length,
                (int index) {
                  GCodeMacro macro = macrosOfGrp[index];

                  bool disabled = (!klippyCanReceiveCommands ||
                      (isPrinting && !macro.showWhilePrinting));
                  return Visibility(
                    visible:
                        macro.visible,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        minimumSize: const Size(0, 32),
                        foregroundColor: themeData.colorScheme.onPrimary,
                        backgroundColor: themeData.colorScheme.primary,
                        disabledBackgroundColor:
                            themeData.colorScheme.onSurface.withOpacity(0.12),
                        disabledForegroundColor:
                            themeData.colorScheme.onSurface.withOpacity(0.38),
                        textStyle: themeData.chipTheme.labelStyle,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: disabled
                          ? null
                          : () => {},

                      onLongPress: disabled
                          ? null
                          : () => {},
                      child: Text(macro.beautifiedName),

                      // Chip(
                      //   surfaceTintColor: Colors.red,
                      //   label: Text(macro.beautifiedName),
                      //   backgroundColor: disabled
                      //       ? themeData.disabledColor
                      //       : themeData.colorScheme.primary,
                      // ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class PinsCard extends ConsumerWidget {
  const PinsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pinLen = 1;

    var ledLen = 1;
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                FlutterIcons.led_outline_mco,
              ),
              title: Text(
                  '输出引脚'),
            ),
            AdaptiveHorizontalScroll(
              pageStorageKey: 'pins',
              children: [
                ...List.generate(pinLen, (index) {


                  return _PinTile();
                }),
                ...List.generate(ledLen, (index) {


                  return Container(
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
String beautifyName(String name) {
  return name.replaceAll("_", " ");
}
class _PinTile extends ConsumerWidget {
  const _PinTile({Key? key,}) : super(key: key);


  String pinValue(double v) {
    if (v > 0) return NumberFormat('0.##').format(v);

    return '关闭';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var klippyCanReceiveCommands = true;

    if (false == false) {
      return CardWithSwitch(
          value:true,
          onChanged: (v) => {},
          builder: (context) {
            var textTheme = Theme.of(context).textTheme;
            var beautifiedName = beautifyName("Beeper");
            return Tooltip(
              message: beautifiedName,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beautifiedName,
                    style: textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(1 > 0 ? '开启' : '关闭',
                      style: textTheme.headlineSmall),
                ],
              ),
            );
          });
    }

    return CardWithButton(
        buttonChild: const Text('设置'),
        onTap: klippyCanReceiveCommands
            ? () => {}
            : null,
        builder: (context) {
          var textTheme = Theme.of(context).textTheme;
          var beautifiedName = beautifyName("设置");
          return Tooltip(
            message: beautifiedName,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  beautifiedName,
                  style: textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(pinValue(1),
                    style: textTheme.headlineSmall),
              ],
            ),
          );
        });
  }
}



class MultipliersCard extends HookConsumerWidget {
  const MultipliersCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var inputLocked = useState(true);

    var klippyCanReceiveCommands = true;

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(FlutterIcons.speedometer_slow_mco),
            title:
                const Text('速率'),
            trailing: IconButton(
                onPressed: klippyCanReceiveCommands
                    ? () => inputLocked.value = !inputLocked.value
                    : null,
                icon: AnimatedSwitcher(
                  duration: kThemeAnimationDuration,
                  transitionBuilder: (child, anim) => RotationTransition(
                    turns: Tween<double>(begin: 0.5, end: 1).animate(anim),
                    child: ScaleTransition(scale: anim, child: child),
                  ),
                  child: inputLocked.value
                      ? const Icon(FlutterIcons.lock_faw, key: ValueKey('lock'))
                      : const Icon(FlutterIcons.unlock_faw,
                          key: ValueKey('unlock')),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Column(
              children: [
                _SliderOrTextInput(
                  initialValue: 0,
                  prefixText: '速度',
                  onChange: klippyCanReceiveCommands && !inputLocked.value
                      ? (e){}
                      : null,
                ),
                _SliderOrTextInput(
                    initialValue: 0,
                    prefixText:
                        '挤出流量',
                    onChange: klippyCanReceiveCommands && !inputLocked.value
                        ? (e){}
                        : null),
                _SliderOrTextInput(
                  initialValue: 0,
                  prefixText:
                      '压力补偿',
                  onChange: klippyCanReceiveCommands && !inputLocked.value
                      ? (e){}
                      : null,
                  numberFormat: NumberFormat('0.##### mm/s'),
                  unit: 'mm/s',
                ),
                _SliderOrTextInput(
                  initialValue: 0,
                  prefixText:
                      '平滑时间',
                  onChange: klippyCanReceiveCommands && !inputLocked.value
                      ? (e){}
                      : null,
                  numberFormat: NumberFormat('0.### s'),
                  maxValue: 0.2,
                  unit: 's',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LimitsCard extends HookConsumerWidget {
  const LimitsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var inputLocked = useState(true);

    var klippyCanReceiveCommands = true;

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.tune),
            title: const Text('打印限制'),
            trailing: IconButton(
                onPressed: (klippyCanReceiveCommands)
                    ? () => inputLocked.value = !inputLocked.value
                    : null,
                icon: AnimatedSwitcher(
                  duration: kThemeAnimationDuration,
                  transitionBuilder: (child, anim) => RotationTransition(
                    turns: Tween<double>(begin: 0.5, end: 1).animate(anim),
                    child: ScaleTransition(scale: anim, child: child),
                  ),
                  child: inputLocked.value
                      ? const Icon(FlutterIcons.lock_faw, key: ValueKey('lock'))
                      : const Icon(FlutterIcons.unlock_faw,
                          key: ValueKey('unlock')),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Column(
              children: [
                _SliderOrTextInput(
                  initialValue: 0,
                  prefixText: ('速度'),
                  onChange: klippyCanReceiveCommands && !inputLocked.value
                      ? (e){}
                      : null,
                  numberFormat: NumberFormat('0 mm/s'),
                  unit: 'mm/s',
                  maxValue: 500,
                ),
                _SliderOrTextInput(
                  initialValue: 0,
                  prefixText: ('加速度'),
                  onChange: klippyCanReceiveCommands && !inputLocked.value
                      ? (e){}
                      : null,
                  numberFormat: NumberFormat('0 mm/s²'),
                  unit: 'mm/s²',
                  maxValue: 5000,
                ),
                _SliderOrTextInput(
                  initialValue: 0,
                  prefixText:
                      ('转角速度'),
                  onChange: klippyCanReceiveCommands && !inputLocked.value
                      ? (e){}
                      : null,
                  numberFormat: NumberFormat('0.# mm/s'),
                  unit: 'mm/s',
                  maxValue: 8,
                ),
                _SliderOrTextInput(
                  initialValue: 0,
                  prefixText:
                      ('加速到减速度'),
                  onChange: klippyCanReceiveCommands && !inputLocked.value
                      ? (e){}
                      : null,
                  numberFormat: NumberFormat('0 mm/s²'),
                  unit: 'mm/s²',
                  maxValue: 3500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SliderOrTextInput extends HookWidget {
  final ValueChanged<double>? onChange;
  final String prefixText;
  final double initialValue;
  final NumberFormat? numberFormat;
  final double maxValue;
  final double minValue;
  final String? unit;

  const _SliderOrTextInput(
      {Key? key,
      required this.initialValue,
      required this.prefixText,
      required this.onChange,
      this.numberFormat,
      this.maxValue = 2,
      this.minValue = 0,
      this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var initial = useState(initialValue);
    var sliderPos = useState(initial.value);
    var fadeState = useState(CrossFadeState.showFirst);
    var textEditingController = useTextEditingController(text: '0');
    var focusText = useFocusNode();
    var focusRequested = useState(false);
    var inputValid = useState(true);

    NumberFormat numFormat = numberFormat ?? NumberFormat('###%');

    if (initial.value != initialValue) {
      initial.value = initialValue;
      sliderPos.value = initialValue;
      textEditingController.text =
          numFormat.format(initialValue).replaceAll(RegExp(r'[^0-9.,]'), '');
    }

    if (fadeState.value == CrossFadeState.showSecond &&
        !focusRequested.value &&
        !focusText.hasFocus &&
        focusText.canRequestFocus) {
      focusRequested.value = true;
      focusText.requestFocus();
    }

    Widget suffixText = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Text(unit ?? '%'),
    );

    return Row(
      children: [
        Flexible(
          child: AnimatedCrossFade(
            firstChild: InputDecorator(
                decoration: InputDecoration(
                  label:
                      Text('$prefixText: ${numFormat.format(sliderPos.value)}'),
                  isCollapsed: true,
                  border: InputBorder.none,
                ),
                child: Slider(
                  value: min(maxValue, sliderPos.value),
                  onChanged: onChange != null
                      ? (v) {
                          sliderPos.value = v;
                        }
                      : null,
                  onChangeEnd: onChange,
                  max: maxValue,
                  min: minValue,
                )),
            secondChild: TextField(
              enabled: onChange != null,
              onSubmitted: (String value) {
                if (!inputValid.value) return;
                double perc =
                    numFormat.parse(textEditingController.text).toDouble();
                onChange!(perc);
              },
              focusNode: focusText,
              controller: textEditingController,
              onChanged: (s) {
                if (s.isEmpty || !RegExp(r'^\d+([.,])?\d*?$').hasMatch(s)) {
                  inputValid.value = false;
                  return;
                }

                if (!inputValid.value) inputValid.value = true;
              },
              textAlign: TextAlign.end,
              keyboardType: const TextInputType.numberWithOptions(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d.,]'))
              ],
              decoration: InputDecoration(
                  prefixText: '$prefixText:',
                  border: InputBorder.none,
                  suffix: suffixText,
                  errorText: !inputValid.value
                      ? FormBuilderLocalizations.current.numericErrorText
                      : null),
            ),
            duration: kThemeAnimationDuration,
            crossFadeState: fadeState.value,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: !inputValid.value || onChange == null
              ? null
              : () {
                  if (fadeState.value == CrossFadeState.showFirst) {
                    textEditingController.text = numFormat
                        .format(sliderPos.value)
                        .replaceAll(RegExp(r'[^0-9.,]'), '');
                    fadeState.value = CrossFadeState.showSecond;
                    focusRequested.value = false;
                  } else {
                    sliderPos.value =
                        numFormat.parse(textEditingController.text).toDouble();
                    fadeState.value = CrossFadeState.showFirst;
                    focusText.unfocus();
                  }
                },
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 33, minHeight: 33),
        )
      ],
    );
  }
}
