import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_klipper/common/widgets/date_picker/scroll_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/date_picker_options.dart';
import '../models/date_picker_scroll_view_options.dart';

class DateScrollView extends StatelessWidget {
  const DateScrollView({
    Key? key,
    required this.onChanged,
    required this.dates,
    required this.controller,
    required this.options,
    required this.scrollViewOptions,
    required this.selectedIndex,
    required this.locale,
    this.isYearScrollView = false,
    this.isMonthScrollView = false,
  }) : super(key: key);

  /// A controller for scroll views whose items have the same size.
  final FixedExtentScrollController controller;

  /// On optional listener that's called when the centered item changes.
  final ValueChanged<int> onChanged;

  /// This is a list of dates.
  final List dates;

  /// A set that allows you to specify options related to ListWheelScrollView.
  final DatePickerOptions options;

  /// A set that allows you to specify options related to ScrollView.
  final ScrollViewDetailOptions scrollViewOptions;

  /// The currently selected date index.
  final int selectedIndex;

  /// Set calendar language
  final Locale locale;

  final bool isYearScrollView;

  final bool isMonthScrollView;

  double _getScrollViewWidth(BuildContext context) {
    String _longestText = '';
    List _dates = isMonthScrollView ? locale.months : dates;
    for (var text in _dates) {
      if ('$text'.length > _longestText.length) {
        _longestText = '$text'.padLeft(2, '0');
      }
    }
    _longestText += scrollViewOptions.label;
    final TextPainter _painter = TextPainter(
      text: TextSpan(
        style: scrollViewOptions.selectedTextStyle,
        text: _longestText,
      ),
      textDirection: Directionality.of(context),
    );
    _painter.layout();
    return _painter.size.width + 60.w;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int _maximumCount = constraints.maxHeight ~/ options.itemExtent;
        return Container(
          margin: scrollViewOptions.margin,
          width: _getScrollViewWidth(context),
          child: ListWheelScrollView.useDelegate(
            useMagnifier: false,
            magnification: 1,
            itemExtent: options.itemExtent,
            diameterRatio: options.diameterRatio,
            controller: controller,
            physics: const FixedExtentScrollPhysics(),
            perspective: options.perspective,
            onSelectedItemChanged: onChanged,
            childDelegate: options.isLoop && dates.length > _maximumCount
                ? ListWheelChildLoopingListDelegate(
                    children: List<Widget>.generate(
                      dates.length,
                      (index) => _buildDateView(index: index),
                    ),
                  )
                : ListWheelChildListDelegate(
                    children: List<Widget>.generate(
                      dates.length,
                      (index) => _buildDateView(index: index),
                    ),
                  ),
          ),
        );
      },
    );
  }
  String _getRule(){
    String ff ="";
    if(isYearScrollView==true){
      ff ="年";
    }else if(isMonthScrollView==true){
      ff ="月";
    }else{
      ff ="日";
    }
    return ff;

  }
  String _getDay(dynamic dd){
    String ff =dd.toString();
    if(isYearScrollView==true){

    }else if(isMonthScrollView==true){
      int s = int.parse(ff);
      if (s <10){
        ff = "0"+ff;
      }
    }else{
      int s = int.parse(ff);
      if (s <10){
        ff = "0"+ff;
      }

    }
    return ff;
  }

  Widget _buildDateView({required int index}) {
    return Container(
      alignment: scrollViewOptions.alignment,
      child: Text(
        '${_getDay(dates[index])}${scrollViewOptions.label}'+' '+_getRule(),
        style: selectedIndex == index ? scrollViewOptions.selectedTextStyle : scrollViewOptions.textStyle,
      ),
    );
  }
}
