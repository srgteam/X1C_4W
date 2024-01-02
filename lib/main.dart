//packages

import 'package:flutter/material.dart';
import 'package:flutter_homescreen/data_provider.dart';
import 'package:flutter_homescreen/screens/homepage.dart';
import 'package:provider/provider.dart';


void main()
{
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>MyDataProvider(),
      child: const MaterialApp(
        home:HomePage()
      )



    );
  }
}





