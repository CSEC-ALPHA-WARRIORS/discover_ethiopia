import 'package:discover_ethiopia/components/calendar/EthiopianCalendar.dart';
import 'package:discover_ethiopia/components/calendar/GregorianCalendar.dart';
import 'package:discover_ethiopia/components/custom_app_bar.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalendarConverter extends HookConsumerWidget {
  const CalendarConverter({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentEC = useState(EthiopianCalendar.now());
    var currentGC = useState(GregorianCalendar.now());

    var eDate = useState(currentEC.value.day);
    var eMonth = useState(currentEC.value.month);
    var eYear = useState(currentEC.value.year);

    var gDate = useState(currentGC.value.day);
    var gMonth = useState(currentGC.value.month);
    var gYear = useState(currentGC.value.year);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CustomAppBar(
                title: "Calendar Converter",
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: KPrimaryColor.shade100.withOpacity(0.2),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButton(
                              value: eDate.value,
                              items: getMonth(eMonth.value!, eYear.value!)
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e.day,
                                      child: Text('${e.day}'),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {},
                            ),
                          ),
                          Expanded(
                            child: DropdownButton(
                              value: eDate.value,
                              items: getMonth(eMonth.value!, eYear.value!)
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e.day,
                                      child: Text('${e.day}'),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
