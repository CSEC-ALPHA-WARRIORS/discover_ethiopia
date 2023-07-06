// ignore_for_file: prefer_const_constructors

import 'package:discover_ethiopia/components/calendar/EthiopianCalendar.dart';
import 'package:discover_ethiopia/components/calendar/GregorianCalendar.dart';
import 'package:discover_ethiopia/components/custom_app_bar.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/utils/Bahirehasab.dart' as Bahirehasab;
import 'package:discover_ethiopia/utils/util.dart' as HolidayUtil;
import 'package:discover_ethiopia/utils/utils.dart' as EthDateUtil;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'dart:math';

// class Calendar extends StatefulWidget {
//   const Calendar({super.key});

//   @override
//   State<Calendar> createState() => _CalendarState();
// }

// class _CalendarState extends State<Calendar> {
//   EthiopianCalendar now = EthiopianCalendar.now();

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _nextMonth() {
//     setState(() {
//       now.nextMonth();
//     });
//   }

//   void _previousMonth() {
//     setState(() {
//       now.previousMonth();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     int year = now.year!;
//     int month = now.month!;
//     String month_name = months[month - 1]!;
//     List<Row> rows = getDays(year, month);
//     List<Map<String, dynamic>> holidays = [];
//     getHolidays(year).map((holiday) => {
//           if (holiday["month"] == month_name) {holidays.add(holiday)}
//         });

//     return SafeArea(
//       child: CustomScrollView(
//         slivers: [
//           const SliverToBoxAdapter(
//             child: CustomAppBar(title: "Calendar"),
//           ),
//           SliverToBoxAdapter(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   height: 350,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: KPrimaryColor.shade500.withOpacity(0.4),
//                         blurRadius: 20.0, // soften the shadow
//                         spreadRadius: 0.0, //extend the shadow
//                         offset: const Offset(
//                           5.0, // Move to right 10  horizontally
//                           5.0, // Move to bottom 10 Vertically
//                         ),
//                       )
//                     ],
//                   ),
//                   child: Container(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(children: [
//                         Row(
//                           children: [
//                             Container(
//                               width: 50,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 color: KPrimaryColor.shade100,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: IconButton(
//                                   iconSize: 18,
//                                   icon: const Icon(
//                                     Icons.arrow_back_ios_outlined,
//                                   ),
//                                   color: Colors.white,
//                                   onPressed: () {
//                                     // ...
//                                     _previousMonth();
//                                   },
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Center(
//                                   child: Column(
//                                 children: [
//                                   Text(
//                                     month_name,
//                                     style: GoogleFonts.notoSerifEthiopic(),
//                                   ),
//                                   Text("$year"),
//                                 ],
//                               )),
//                             ),
//                             Container(
//                               width: 50,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 color: KPrimaryColor.shade100,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: IconButton(
//                                   iconSize: 18,
//                                   icon: const Icon(
//                                     Icons.arrow_forward_ios_outlined,
//                                   ),
//                                   color: Colors.white,
//                                   onPressed: () {
//                                     // ...
//                                     _previousMonth();
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             MyText(
//                               text: "ሰኞ",
//                               size: 12,
//                               bgcolor: "#5E301A",
//                               borderRadius: 0,
//                               isBold: false,
//                               width: 30,
//                             ),
//                             MyText(
//                               text: "ማ",
//                               size: 12,
//                               bgcolor: "#5E301A",
//                               borderRadius: 0,
//                               isBold: false,
//                               width: 30,
//                             ),
//                             MyText(
//                               text: "ረቡ",
//                               size: 12,
//                               bgcolor: "#5E301A",
//                               borderRadius: 0,
//                               isBold: false,
//                               width: 30,
//                             ),
//                             MyText(
//                               text: "ሐሙ",
//                               size: 12,
//                               bgcolor: "#5E301A",
//                               borderRadius: 0,
//                               isBold: false,
//                               width: 30,
//                             ),
//                             MyText(
//                               text: "አር",
//                               size: 12,
//                               bgcolor: "#5E301A",
//                               borderRadius: 0,
//                               isBold: false,
//                               width: 30,
//                             ),
//                             MyText(
//                               text: "ቅዳ",
//                               size: 12,
//                               bgcolor: "#5E301A",
//                               borderRadius: 0,
//                               isBold: false,
//                               width: 30,
//                             ),
//                             MyText(
//                               text: "እሁ",
//                               size: 12,
//                               bgcolor: "#5E301A",
//                               borderRadius: 0,
//                               isBold: false,
//                               width: 30,
//                             ),
//                           ],
//                         ),
//                         ...rows.map(
//                           (row) {
//                             return row;
//                           },
//                         )
//                       ]),
//                     ),
//                   ),
//                 ),
//                 MyText(
//                     text: "Holidays",
//                     size: 28,
//                     bgcolor: "#B57953",
//                     borderRadius: 0),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

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
          color: EthDateUtil.getColorFromHex(bgcolor),
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Center(
        child: Text(text,
            style: TextStyle(
                fontSize: size,
                fontWeight: isBold! ? FontWeight.w600 : FontWeight.normal,
                color: fgcolor != null
                    ? EthDateUtil.getColorFromHex(fgcolor!)
                    : EthDateUtil.getColorFromHex("#000000")),
            textAlign: TextAlign.center),
      ),
    );
  }
}

class Calendar extends HookConsumerWidget {
  const Calendar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = EthiopianCalendar.now();
    var current = useState(EthiopianCalendar.now());
    EthiopianCalendar ec = current.value;
    GregorianCalendar gc = ec.toGC();
    var current_days = EthDateUtil.getMonth(ec.month!, ec.year!);
    var month_start_index = Bahirehasab.days.indexOf(current_days[0].day_name!);

    var holidays = HolidayUtil.getHolidays(ec.year!);
    var month_holidays =
        holidays.where((holiday) => holiday['month'] == ec.month_name).toList();

    var weeks = ((month_start_index + current_days.length) / 7).ceil();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(title: "Calendar"),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: AnimatedContainer(
                  duration: Duration(microseconds: 500),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: KPrimaryColor.shade500,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: KPrimaryColor.shade500.withOpacity(.5),
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: KPrimaryColor.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.chevron_left),
                              onPressed: () {
                                current.value = ec.previousMonth();
                              },
                              color: Colors.white,
                              iconSize: 25,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                current.value = today;
                              },
                              child: Column(
                                children: [
                                  Text(
                                    ec.month_name ?? '',
                                    style: GoogleFonts.notoSerifEthiopic(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${ec.year} ዓ.ም.",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: KPrimaryColor.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.chevron_right),
                              onPressed: () {
                                current.value = ec.nextMonth();
                              },
                              color: Colors.white,
                              iconSize: 25,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 40,
                        child: GridView.count(
                          crossAxisCount: 7,
                          children: Bahirehasab.days
                              .map(
                                (e) => Center(
                                  child: Text(
                                    e.substring(0, 2),
                                    style: GoogleFonts.notoSerifEthiopic(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 40 * weeks + 10 * (weeks + 1),
                        child: AnimationLimiter(
                          child: GridView.count(
                            crossAxisCount: 7,
                            mainAxisSpacing: 10,
                            children: [
                              ...List.filled(month_start_index, 0)
                                  .map(
                                    (e) => Center(
                                      child: Text(''),
                                    ),
                                  )
                                  .toList(),
                              ...current_days.asMap().entries.map((x) {
                                var e = x.value;
                                var i = x.key;
                                var isToday = (DateTime(
                                      e.year ?? 0,
                                      e.month ?? 0,
                                      e.day ?? 0,
                                    )
                                        .difference(
                                          DateTime(
                                            today.year!,
                                            today.month!,
                                            today.day!,
                                          ),
                                        )
                                        .inDays ==
                                    0);
                                return AnimationConfiguration.staggeredGrid(
                                  position: i,
                                  columnCount: 7,
                                  duration: Duration(microseconds: 500),
                                  child: FadeInAnimation(
                                    child: ScaleAnimation(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: isToday
                                                ? Colors.white
                                                : KPrimaryColor.shade100
                                                    .withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${e.day}',
                                                  style: GoogleFonts
                                                      .notoSerifEthiopic(
                                                    color: isToday
                                                        ? KPrimaryColor.shade400
                                                        : Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                if (e.isHoliday)
                                                  Container(
                                                    height: 4,
                                                    width: 4,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0)
                    .copyWith(top: 30),
                child: Text(
                  "የዚ ወር በዓላት",
                  style: GoogleFonts.notoSerifEthiopic(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: KPrimaryColor.shade500,
                  ),
                ),
              ),
            ),
            SliverList.separated(
              itemBuilder: (context, index) {
                var holiday = month_holidays[index];
                return ListTile(
                  leading: Icon(
                    Iconsax.calendar_tick,
                    size: 30,
                  ),
                  title: Text(
                    holiday['name'],
                    style: GoogleFonts.notoSerifEthiopic(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle:
                      Text("${holiday['month']} ${holiday['day']}, ${ec.year}"),
                );
              },
              itemCount: month_holidays.length,
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: KPrimaryColor.shade500.withOpacity(0.1),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
