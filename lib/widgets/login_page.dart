import 'package:flutter/material.dart';
import 'package:show_ttr/widgets/bottom_navigation/main_navigator_routes.dart';
import 'package:show_ttr/widgets/test_page.dart';

class LoginPage extends StatelessWidget {

  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('myTischtennis.de'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(TestPage.routeName);
            },
            style: TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary),
            child: const Text("Test"),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(children: [
            Image.asset('assets/images/ovtcharov.jpg'),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Nutzername'),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Passwort'),
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                      ),
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.of(context).pushNamed(MainNavigatorRoutes.loggedIn)
                      },
                      child: const Text(
                        'Anmelden',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}