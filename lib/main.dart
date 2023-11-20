import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_homescreen/homescreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_homescreen/vehicle-signals/viss_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpClient client = await initializeClient();
  runApp(ProviderScope(child: MyApp(client: client)));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key, required this.client}) : super(key: key);
  final HttpClient client;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const navBarColor = const Color(0xff181818);
    const navBarIconColor = Colors.white;

    return MaterialApp(
      title: 'Homescreen',
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: navBarColor,
            labelTextStyle: MaterialStateProperty.all(const TextStyle(
              color: navBarIconColor,
            )),
            iconTheme: MaterialStateProperty.all(const IconThemeData(
              color: navBarIconColor,
            ))),
      ),
      home: Homescreen(client: client),
    );
  }
}
