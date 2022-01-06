import 'package:flutter/material.dart';

class TabSearchName extends StatelessWidget {
  static const routeName = "/testPage";

  const TabSearchName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Vereinsname'),
              textInputAction: TextInputAction.next,
              autocorrect: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Vorname'),
              textInputAction: TextInputAction.next,
              autocorrect: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Nachname'),
              textInputAction: TextInputAction.next,
              autocorrect: false,
            ),
          ),
          TextButton(
            onPressed: () => {

            },
            child: const Text(
              'Suche',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
