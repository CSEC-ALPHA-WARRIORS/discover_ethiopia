import 'package:discover_ethiopia/components/calendar/GregorianCalendar.dart';
import 'package:discover_ethiopia/screens/calendar.dart';
import 'package:discover_ethiopia/utils/Bahirehasab.dart';
import 'package:flutter/material.dart';

import '../components/calendar/EthiopianCalendar.dart';

Color getColorFromHex(String hex) {
  return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
}

List<Row> getDays(int year, int month) {
  List<EthiopianCalendar> _days = getMonth(month, year);
  List<Row> rows = [];
  List<Widget> texts = [];
  List<String> vals = [];
  int space = 7 - dayss.indexOf(_days[0].day_name!);
  var now = EthiopianCalendar.now();

  for (int j = 0; j < space; j++) {
    vals.add("");
  }

  _days.forEach((element) {
    vals.add(element.day.toString());
  });

  var i = 0;
  vals.forEach((day) {
    if (i % 7 == 0) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...(texts.map((t) {
            return t;
          }))
        ],
      ));
      texts.clear();
    }
    if (day == "") {
      texts.add(MyText(
        text: day,
        size: 12,
        bgcolor: "#5E301A",
        fgcolor: "#FFFFFF",
        borderRadius: 30,
        isBold: false,
        width: 30,
      ));
    } else if (now.day.toString() == day) {
      texts.add(MyText(
        text: day,
        size: 12,
        bgcolor: "#FFFFFF",
        fgcolor: "#B57953",
        borderRadius: 30,
        isBold: true,
        width: 30,
      ));
    } else {
      texts.add(MyText(
        text: day,
        size: 12,
        bgcolor: "#B57953",
        fgcolor: "#FFFFFF",
        borderRadius: 30,
        isBold: false,
        width: 30,
      ));
    }
    i++;
  });

  rows.add(Row(
    children: [
      ...(texts.map((t) {
        return t;
      }))
    ],
  ));
  return rows;
}

List<EthiopianCalendar> getMonth(int month, int year) {
  List<EthiopianCalendar> ecs = [];

  for (int i = 1; i < 31; i++) {
    ecs.add(EthiopianCalendar(year: year, month: month, day: i));
  }
  return ecs;
}

List<EthiopianCalendar> getCurrentMonth() {
  var gc = GregorianCalendar.now();
  var now = gc.toEc();
  List<EthiopianCalendar> ecs = [];

  for (int i = 1; i < 31; i++) {
    ecs.add(EthiopianCalendar(year: now.year, month: now.month, day: i));
  }
  return ecs;
}
