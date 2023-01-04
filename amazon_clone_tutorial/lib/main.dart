import 'package:amazon_clone_tutorial/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_tutorial/providers/user_provider.dart';
import 'package:amazon_clone_tutorial/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'constants/global_variables.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

// class MyApp extends StatelessWidget {
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
      /*home: Scaffold(
          appBar: AppBar(title: const Text('Hello')),
          body: Column(
            children: [
              Center(
                child: Text('Flutter Demo Home Page'),
              ),
              Builder (
                builder: (context){
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AuthScreen.routeName);
                      },
                      child: Text('Click'),
                  );
                }
              ),
            ],
          )
      ),*/
    );
  }
}
