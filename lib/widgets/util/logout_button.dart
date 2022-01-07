import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback? doLogout;

  const LogoutButton({Key? key, this.doLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctxt) {
              return LogoutDialog(doLogout: doLogout);
          },
        );
      },
    );
  }
}

class LogoutDialog extends StatelessWidget {
  final VoidCallback? doLogout;

  const LogoutDialog({Key? key, this.doLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Abmelden"),
      content: const Text("Willst du dich wirklich abmelden?"),
      actions: [cancelButton(context), logoutButton(context)],
    );
  }


  Widget cancelButton(BuildContext context) {
    return TextButton(
      child: const Text("Abbrechen"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget logoutButton(BuildContext context) {
    return TextButton(
      child: const Text("Abmelden"),
      onPressed: doLogout,
    );
  }
}
