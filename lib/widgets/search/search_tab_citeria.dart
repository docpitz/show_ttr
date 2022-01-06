import 'package:flutter/material.dart';

class TabSearchCiteria extends StatefulWidget {
  const TabSearchCiteria({Key? key}) : super(key: key);

  @override
  State<TabSearchCiteria> createState() => _TabSearchCiteriaState();
}

class _TabSearchCiteriaState extends State<TabSearchCiteria> {
  final List<bool> _selectionGender = [true, false, false];

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
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Geburtsjahr von'),
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'bis'),
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'TTR-Punkte von'),
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'bis'),
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: ToggleButtons(
                children: const [
                  Icon(Icons.person),
                  Icon(Icons.male),
                  Icon(Icons.female)
                ],
                isSelected: _selectionGender,
                onPressed: (index) {
                  setState(() {
                    for (int buttonIndex = 0; buttonIndex < _selectionGender.length; buttonIndex++) {
                      if (buttonIndex == index) {
                        _selectionGender[buttonIndex] = true;
                      } else {
                        _selectionGender[buttonIndex] = false;
                      }
                    }
                  });
                },
              ),
            ),
          ),
          TextButton(
            onPressed: () => {},
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
