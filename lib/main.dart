import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file/local.dart';
import 'package:shell/shell.dart';


main()async
{
  // var shell= new Shell();
  // var echo = await shell.start('echo', arguments: ['hello world']);
  // print(echo.stdout);
  //

  runApp(myApp());
  // List all files in the current directory in UNIX-like systems.
  var result = await Process.run('systemctl', ['start','agl-app@mediaplayer']);
  print(result.stdout);

}



class myApp extends StatelessWidget {

  TextEditingController mycontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title:"command line Argument",
      debugShowCheckedModeBanner:false,
      home:gotoapp(),


    );
  }
}

class gotoapp extends StatefulWidget {


  @override
  State<gotoapp> createState() => _gotoappState();
}

class _gotoappState extends State<gotoapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Column(
          children: [

          ],
        )
    );

  }
}



Widget myTextfield()
{


  return TextField(
    decoration:InputDecoration(
        hintText:"enter your command" ,
        enabledBorder: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        )

    ),

  );
}








