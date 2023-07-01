import 'package:discover_ethiopia/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ErrorAlert extends StatelessWidget {
  const ErrorAlert({
    super.key,
    required this.title,
    required this.desc,
    required this.onRetry,
  });

  final String title;
  final String desc;
  final Function? onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: KPrimaryColor.shade50.withOpacity(0.2),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.danger,
              size: 40,
              color: KPrimaryColor.shade600,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: KPrimaryColor.shade800,
              ),
            ).tr(),
            Text(
              desc,
              style: const TextStyle(
                color: KPrimaryColor.shade800,
                fontSize: 16,
              ),
            ).tr(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 130,
              child: FilledButton(
                onPressed: onRetry != null ? () => onRetry!() : null,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 14,
                    ),
                  ),
                  backgroundColor: const MaterialStatePropertyAll(
                    KPrimaryColor.shade600,
                  ),
                  iconSize: const MaterialStatePropertyAll(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Iconsax.refresh),
                    const SizedBox(width: 10),
                    const Text("retry").tr(),
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
