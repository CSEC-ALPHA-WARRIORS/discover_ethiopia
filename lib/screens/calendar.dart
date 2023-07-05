import 'package:discover_ethiopia/components/calendar/EthiopianCalendar.dart';
import 'package:discover_ethiopia/utils/Bahirehasab.dart';
import 'package:discover_ethiopia/utils/util.dart';
import 'package:discover_ethiopia/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  EthiopianCalendar now = EthiopianCalendar.now();

  @override
  void initState() {
    super.initState();
  }

  void _nextMonth() {
    setState(() {
      now.nextMonth();
    });
  }

  void _previousMonth() {
    setState(() {
      now.previousMonth();
    });
  }

  @override
  Widget build(BuildContext context) {
    int year = now.year!;
    int month = now.month!;
    String month_name = months[month - 1]!;
    List<Row> rows = getDays(year, month);
    List<Map<String, dynamic>> holidays = [];
    getHolidays(year).map((holiday) => {
          if (holiday["month"] == month_name) {holidays.add(holiday)}
        });

    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 400,
                height: 350,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(0, 0, 0, 1),
                      blurRadius: 20.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: (Card(
                  color: getColorFromHex("#5E301A"),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: getColorFromHex("#B5795326"),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: IconButton(
                                iconSize: 16,
                                icon: const Icon(Icons.arrow_back_ios_outlined),
                                color: getColorFromHex("#FFFFFF"),
                                onPressed: () {
                                  // ...
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                                child: Column(
                              children: [
                                MyText(
                                  text: month_name,
                                  size: 20,
                                  bgcolor: "#5E301A",
                                  borderRadius: 0,
                                  isBold: true,
                                ),
                                MyText(
                                  text: year.toString(),
                                  size: 18,
                                  bgcolor: "#5E301A",
                                  borderRadius: 0,
                                  isBold: false,
                                ),
                              ],
                            )),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: getColorFromHex("#B57953"),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: IconButton(
                                iconSize: 16,
                                icon: const Icon(
                                    Icons.arrow_forward_ios_outlined),
                                color: getColorFromHex("#FFFFFF"),
                                onPressed: _nextMonth,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyText(
                            text: "ሰኞ",
                            size: 12,
                            bgcolor: "#5E301A",
                            borderRadius: 0,
                            isBold: false,
                            width: 30,
                          ),
                          MyText(
                            text: "ማ",
                            size: 12,
                            bgcolor: "#5E301A",
                            borderRadius: 0,
                            isBold: false,
                            width: 30,
                          ),
                          MyText(
                            text: "ረቡ",
                            size: 12,
                            bgcolor: "#5E301A",
                            borderRadius: 0,
                            isBold: false,
                            width: 30,
                          ),
                          MyText(
                            text: "ሐሙ",
                            size: 12,
                            bgcolor: "#5E301A",
                            borderRadius: 0,
                            isBold: false,
                            width: 30,
                          ),
                          MyText(
                            text: "አር",
                            size: 12,
                            bgcolor: "#5E301A",
                            borderRadius: 0,
                            isBold: false,
                            width: 30,
                          ),
                          MyText(
                            text: "ቅዳ",
                            size: 12,
                            bgcolor: "#5E301A",
                            borderRadius: 0,
                            isBold: false,
                            width: 30,
                          ),
                          MyText(
                            text: "እሁ",
                            size: 12,
                            bgcolor: "#5E301A",
                            borderRadius: 0,
                            isBold: false,
                            width: 30,
                          ),
                        ],
                      ),
                      ...(rows.map((row) {
                        return row;
                      }))
                    ]),
                  ),
                )),
              ),
              MyText(
                  text: "Holidays",
                  size: 28,
                  bgcolor: "#B57953",
                  borderRadius: 0),
            ],
          ),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  final String text;
  final double size;
  final double borderRadius;
  final String bgcolor;
  bool? isBold;
  double? width;
  String? fgcolor;

  MyText(
      {required this.text,
      required this.size,
      required this.bgcolor,
      required this.borderRadius,
      this.isBold,
      this.width,
      this.fgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      width: width,
      height: width,
      decoration: BoxDecoration(
          color: getColorFromHex(bgcolor),
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Center(
        child: Text(text,
            style: TextStyle(
                fontSize: size,
                fontWeight: isBold! ? FontWeight.w600 : FontWeight.normal,
                color: fgcolor != null
                    ? getColorFromHex(fgcolor!)
                    : getColorFromHex("#000000")),
            textAlign: TextAlign.center),
      ),
    );
  }
}
