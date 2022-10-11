import 'package:built_collection/built_collection.dart';
import 'package:esenin_family/entities/pub/ui/pub_selector.dart';
import 'package:esenin_family/shared/ui/header.dart';
import 'package:esenin_family_client/esenin_family_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventPoster extends StatefulWidget {
  const EventPoster({super.key});

  @override
  State<EventPoster> createState() => _TodayWidgetState();
}

class _TodayWidgetState extends State<EventPoster> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, bottom: 16),
          child: Header('Афиша'),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 16, bottom: 20, right: 16),
          child: Consumer<BuiltList<Pub>>(
            builder: (context, pubs, child) {
              return Row(children: [
                PubSelector(
                  assetName: 'esenin.svg',
                  label: 'Все бары',
                  isActive: true,
                ),
                ...pubs
                    .map((pub) => PubSelector(
                          assetName: pub.logo,
                          label: pub.name,
                        ))
                    .toList()
              ]);
            },
          ),
        ),
      ],
    );
  }
}
