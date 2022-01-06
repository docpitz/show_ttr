import 'dart:math';
import 'package:flutter/material.dart';

import 'package:show_ttr/models/Player.dart';
import 'package:show_ttr/models/Results.dart';
import 'package:show_ttr/widgets/player/player_detail_page.dart';

class ResultPage extends StatelessWidget {
  static const routeName = "/result";
  final _results = Result.examples;

  ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ergebnisse"),
      ),
      body: ListView.separated(
        itemCount: _results.length,
        itemBuilder: (context, index) {
          final result = _results[index];
          return ListTile(
            title: Text(
              result.lastname +
                  ', ' +
                  result.firstname +
                  " (" +
                  result.point.toString() +
                  ")",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              result.result,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(result.setResults
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "")),
            onTap: () => {
              Navigator.of(context).pushNamed(PlayerDetailPage.routeName,
                  arguments: Player.examples[Random.secure().nextInt(3)])
            },
            dense: true,

          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
