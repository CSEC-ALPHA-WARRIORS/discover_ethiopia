import 'package:auto_size_text/auto_size_text.dart';
import 'package:discover_ethiopia/components/custom_app_bar.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/constants/currency_codes.dart';
import 'package:discover_ethiopia/controllers/currency/currency_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class CurrencyConverter extends HookConsumerWidget {
  CurrencyConverter({super.key});
  final List<CalcBtn> btns = [
    CalcBtn(label: "7"),
    CalcBtn(label: "8"),
    CalcBtn(label: "9"),
    CalcBtn(label: "x", icon: Icons.backspace),
    CalcBtn(label: "4"),
    CalcBtn(label: "5"),
    CalcBtn(label: "6"),
    CalcBtn(label: "C"),
    CalcBtn(label: "1"),
    CalcBtn(label: "2"),
    CalcBtn(label: "3"),
    CalcBtn(
      label: "=",
      icon: Bootstrap.arrow_repeat,
    ),
    CalcBtn(
      label: "",
    ),
    CalcBtn(
      label: "0",
    ),
    CalcBtn(
      label: ".",
    ),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final have = useState("ETB");
    final want = useState("USD");
    final inputValue = useState("0.0");
    final rating = ref.watch(rateProvider(have: have.value, want: want.value));

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CustomAppBar(title: "Currency Converter"),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: KPrimaryColor.shade100.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: DropdownButton(
                            underline: Container(),
                            borderRadius: BorderRadius.circular(20),
                            items: currencyData
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e["code"],
                                    child: Text(
                                      "${e['name']!.length > 20 ? e['name']!.substring(0, 20) : e['name']} (${e['code']})",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: KPrimaryColor.shade500,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            value: have.value,
                            onChanged: (value) {
                              if (value != null && value.isNotEmpty) {
                                have.value = value;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            "${inputValue.value}",
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          have.value,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: KPrimaryColor.shade100.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: DropdownButton(
                            underline: Container(),
                            borderRadius: BorderRadius.circular(20),
                            items: currencyData
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e["code"],
                                    child: Text(
                                      "${e['name']!.length > 20 ? e['name']!.substring(0, 20) : e['name']} (${e['code']})",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: KPrimaryColor.shade500,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            value: want.value,
                            onChanged: (value) {
                              if (value != null && value.isNotEmpty) {
                                want.value = value;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            rating.asData != null
                                ? (rating.asData!.value *
                                        double.parse(inputValue.value))
                                    .toStringAsFixed(2)
                                : '...',
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          want.value,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
                top: 20,
              ),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                children: btns
                    .map(
                      (btn) => InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          if (btn.label == 'x') {
                            if (inputValue.value.length > 1) {
                              inputValue.value = inputValue.value
                                  .substring(0, inputValue.value.length - 1);
                            } else {
                              inputValue.value = "0";
                            }
                            return;
                          } else if (btn.label == 'C') {
                            inputValue.value = '0';
                            return;
                          } else if (btn.label == '=') {
                            var temp = have.value;
                            have.value = want.value;
                            want.value = temp;
                            return;
                          } else if (btn.label == '.' &&
                              inputValue.value.contains('.')) {
                            return;
                          }

                          if (inputValue.value == '0') {
                            inputValue.value = btn.label;
                          } else {
                            inputValue.value += btn.label;
                          }
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            color: btn.label == ''
                                ? Colors.transparent
                                : KPrimaryColor.shade100.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: btn.icon != null
                                ? Icon(
                                    btn.icon,
                                    color: KPrimaryColor.shade500,
                                  )
                                : Text(
                                    btn.label,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: KPrimaryColor.shade500),
                                  ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalcBtn {
  String label;
  IconData? icon;

  CalcBtn({required this.label, this.icon});
}
