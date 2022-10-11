import 'package:esenin_family/shared/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PubSelector extends StatelessWidget {
  final String assetName;
  final String label;
  final bool isActive;
  final GestureTapCallback? onTap;
  final config = Config();

  PubSelector(
      {super.key,
      this.isActive = false,
      this.onTap,
      required this.assetName,
      required this.label});

  @override
  Widget build(BuildContext context) {
    final labelColor = isActive
        ? Theme.of(context).colorScheme.onSecondaryContainer
        : Theme.of(context).colorScheme.onSurface;

    return Card(
      elevation: 4,
      borderOnForeground: true,
      shadowColor: Colors.black,
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      color: isActive
          ? Theme.of(context).colorScheme.secondaryContainer
          : Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              SvgPicture.network(
                '${config.eseninBucketUrl}/$assetName',
                width: 60,
                height: 60,
                color: labelColor,
              ),
              Text(
                label,
                style: TextStyle(
                  color: labelColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
