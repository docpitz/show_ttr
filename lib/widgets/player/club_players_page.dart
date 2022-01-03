import 'package:flutter/material.dart';
import 'package:show_ttr/models/Player.dart';
import 'package:show_ttr/widgets/player/player_detail_page.dart';

class ClubPlayerPage extends StatelessWidget {
  static const routeName = '/clubPlayers';
  final _player = Player.examples;

  ClubPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vereinsliste'),
      ),
      body: ListView.separated(
        itemCount: _player.length,
        itemBuilder: (context, index) {
          final player = _player[index];
          return ListTile(
            leading: Text(player.position.toString()),
            title: Text(player.lastname + ', ' + player.firstname),
            trailing: Text(player.points.toString()),
            onTap: () => {
              Navigator.of(context)
                  .pushNamed(PlayerDetailPage.routeName, arguments: player)
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
