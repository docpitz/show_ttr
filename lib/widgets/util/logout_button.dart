import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback? doLogout;

  const LogoutButton({Key? key, this.doLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: doLogout,
    );
  }
}