import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_homescreen/variables.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';
import 'package:flutter_homescreen/provider/count_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [ChangeNotifierProvider(create:(_)=>count_provider())],
      child:   MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,


        //Setting the pages routes
        routes: {
          '/': (context) =>  MyHomePage(title: "cluster4W"),

        },

      ),);



  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override

  void initState() {
    super.initState();


    final countprovider = Provider.of<count_provider>(context, listen: false);



    if (context != null && countprovider != null) {
      mythreadfunc();


      Timer.periodic(Duration(milliseconds: 50), (timer) {
        countprovider.loadGaugeValues();
      });
    }

  }


  @override
  void dispose() {
    timer?.cancel();
    timer1?.cancel();
    timer2?.cancel();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {


    final countprovider=Provider.of<count_provider>(context,listen:false);


    return Scaffold(

        body:Consumer<count_provider>(builder:(context, datafile, child){
          return Center(

            //Main container
              child:Container(
                height:screen_height,
                width:screen_width,
                decoration:BoxDecoration(

                  gradient:LinearGradient(colors: const<Color>[Colors.black12,Colors.black12,
                    Colors.black],

                      begin:Alignment.topRight,end:Alignment.centerLeft,
                      stops: const<double>[0.0,0.3,1]),

                ),





                child:Column(
                  children: [
                    Container(
                        width:(screen_width),
                        height:screen_height/6,
                        decoration:BoxDecoration(  //Decoration of the container
                            borderRadius:BorderRadius.only(topLeft:Radius.circular(0),topRight:Radius.circular(0)),
                            boxShadow:[
                              BoxShadow(blurRadius:0,spreadRadius:0,blurStyle:BlurStyle.normal),
                            ]
                        ),
                        child:Row(

                          //This is the ist row which have three elements
                          crossAxisAlignment:CrossAxisAlignment.center,
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [

                            Expanded(flex:1,child: Container(
                              alignment:Alignment.center,
                              decoration:BoxDecoration(

                                gradient:LinearGradient(colors: const<Color>[Colors.blue,Colors.black12,
                                  Colors.black12],

                                    begin:Alignment.topRight,end:Alignment.centerLeft,
                                    stops: const<double>[0.0,0.9,1]),


                                borderRadius:BorderRadius.only(bottomRight:Radius.circular(50)),


                              ),
                              child:left==true?Image.asset("assets/images/left_green.png",fit:BoxFit.contain,):Image.asset("assets/images/colorleftwhite.png",fit:BoxFit.contain,)

                            )),


                            Expanded(flex:2,child: Container(

                              color:Colors.black,
                              child:Container(
                                alignment:Alignment.center,
                                decoration:BoxDecoration(
                                  // gradient:SweepGradient(colors: const<Color>[Color(0xff4c4c4c),Color(0xff4c4c4c),Color(0xff323232),Color(0xff191919)],center:Alignment.centerLeft,stops: const<double>[0.0,0.25,0.5,1]),

                                    borderRadius:BorderRadius.only(bottomLeft:Radius.circular(100),bottomRight:Radius.circular(100)),
                                    boxShadow:[BoxShadow(
                                      blurRadius:20,
                                      color:Colors.black,
                                    )]
                                ),

                                child:Column(

                                  children: [
                                    Container(
                                        height:100,width:300,
                                        child:Image.asset("assets/images/saracalogo2.png",fit:BoxFit.contain)
                                    ),
                                  ],
                                ),
                              ),

                            )),


                            Expanded(flex:1,child: Container(
                              alignment:Alignment.center,
                              decoration:BoxDecoration(

                                  gradient:LinearGradient(colors: const<Color>[Colors.black12,Colors.black12,
                                    Colors.blue],

                                      begin:Alignment.topRight,end:Alignment.centerLeft,
                                      stops: const<double>[0.0,0.3,1]),


                                  borderRadius:BorderRadius.only(bottomLeft:Radius.circular(50)),






                                  boxShadow:[
                                    BoxShadow()

                                  ]
                              ),
                              child:right==true?Image.asset("assets/images/right_green.png",fit:BoxFit.contain,):Image.asset("assets/images/right_white.png",fit:BoxFit.contain,),

                            ))
                          ],

                        )
                    ),   //This container store the elements of ist row


                    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                    //second row is starting from here


                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                    //This container will store the elements of third row



                    Container(
                      width:screen_width,
                      height:screen_height-(screen_height/6),
                      decoration:BoxDecoration(

                          gradient:LinearGradient(colors: const<Color>[Colors.black12,Colors.black12,
                            Colors.black12],
                              begin:Alignment.topRight,end:Alignment.centerLeft,
                              stops: const<double>[0.0,0.3,1]),

                          borderRadius:BorderRadius.only(topLeft:Radius.circular(0),topRight:Radius.circular(0)),
                          boxShadow:[BoxShadow(

                            blurRadius:0,
                            spreadRadius:0,
                            blurStyle:BlurStyle.normal,
                          )]
                      ),



                      //this row has 3 elements

                      child:Column(
                        children: [



                          Expanded(flex:1,
                            child: Container(

                              height:80,width:1280,
                              child:Row(
                                mainAxisAlignment:MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.circle_outlined,size:45,color:Colors.white,),
                                      Text("104.0km",style:TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.bold),)
                                    ],
                                  ),

                                  Container(height:50,width:50,child:oil==true?Image.asset("assets/images/oil_yellow.png",fit:BoxFit.contain,):Image.asset("assets/images/oil_new.png",fit:BoxFit.contain,)),

                                  Container(height:35,width:35,child:parking_mode==true?Image.asset("assets/images/parkingcolor.png",fit:BoxFit.contain,):Image.asset("assets/images/parking_new.png",fit:BoxFit.contain,),), //parkingcolor

                                  Container(height:40,width:40,child:parking_brake==true?Image.asset("assets/images/parkingBrakecolor.png",fit:BoxFit.contain,):Image.asset("assets/images/parking_brake_new.png",fit:BoxFit.contain,),), //parkingBrakecolor.png


                                  Container(height:35,width:35,child:tpms==true?Image.asset("assets/images/tpms.png",fit:BoxFit.contain,):Image.asset("assets/images/tpms_new.png",fit:BoxFit.contain,),),

                                  Padding(
                                    padding: const EdgeInsets.only(top:15.0),
                                    child:
                                    Column(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        Text(" ${DateFormat('EEE d MMM').format(DateTime.now())??'0'}",style:TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.bold,),),
                                        Text("${DateFormat('HH:mm aa').format(DateTime.now())??'0'}",style:TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.bold,),),
                                      ],
                                    ),

                                    // child: Container(
                                    //     child:Image.asset("assets/images/saracalogo2.png",fit:BoxFit.contain)
                                    // ),
                                  ),


                                  Container(height:35,width:35,child:seat_belt==true?Image.asset("assets/images/seat_belt_red.png",fit:BoxFit.contain,):Image.asset("assets/images/seatBelt.png",fit:BoxFit.contain,)),
                                  Container(height:35,width:35,child:highbeam==true?Image.asset("assets/images/high-beam_blue.png",fit:BoxFit.contain,):Image.asset("assets/images/high-beam_white.png",fit:BoxFit.contain,),),
                                  Container(height:30,width:30,child:lock==true?Image.asset("assets/images/carlock_new.png",fit:BoxFit.contain,):Image.asset("assets/images/car_lock_new.png",fit:BoxFit.contain,)),


                                  Container(height:35,width:35,child:headlamp==true?Image.asset("assets/images/low-beam_green.png",fit:BoxFit.contain,):Image.asset("assets/images/low-beam_white.png",fit:BoxFit.contain,)),  //low-beam_green
                                  Container(height:35,width:35,child:malfunction==true?Image.asset("assets/images/colormalfunctionbg.png",fit:BoxFit.contain,):Image.asset("assets/images/engine_new2.png",fit:BoxFit.contain,)),//colormalfunctionbg


                                  Row(
                                    children: [
                                      Icon(Icons.flag_outlined,size:45,color:Colors.white),
                                     Text((odometerr != null )? "$odometerr km":"ODO 00000 km" ?? "0",
                                      style: TextStyle(
                                     fontSize: 30,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.white,
                            ),
                          ),

                                    ],
                                  )
                                ],
                              ),

                            ),
                          ) , //This Sizedbox


                          Expanded(flex:6,
                            child: Row(



                              children: [

                                Expanded(flex:2,child: CustomPaint(
                                  painter:Circle3DPainter2(circleSize:400),
                                  child: SfRadialGauge(

                                    axes:<RadialAxis>[
                                      RadialAxis(minimum: 0,maximum:200,labelOffset:30,showLastLabel:true,showLabels:true,interval:20,
                                          axisLineStyle:AxisLineStyle(thickness:5,cornerStyle:CornerStyle.bothFlat,color:Colors.grey),
                                          majorTickStyle:MajorTickStyle(length:20,thickness:4,color:Colors.white,),
                                          axisLabelStyle:GaugeTextStyle(color:Colors.black,fontSize:16,fontWeight:FontWeight.bold),





                                          pointers:<GaugePointer> [
                                            MarkerPointer(value:(parsedSpeed != null && parsedSpeed! >= 200) ? 200 :(parsedSpeed ?? 0),markerHeight:10,),
                                            RangePointer(value: (parsedSpeed != null && parsedSpeed! >= 200) ? 200 :(parsedSpeed ?? 0) ,pointerOffset:-0,color:get_guage_color(),enableAnimation:true,width:35,),
                                            NeedlePointer(
                                                value: (parsedSpeed != null && parsedSpeed! >= 200) ? 200 :(parsedSpeed ?? 0),
                                                lengthUnit: GaugeSizeUnit.factor,
                                                needleLength: 0.8,
                                                needleEndWidth:  11,
                                                tailStyle: TailStyle(length: 0.2, width: 11,
                                                  gradient:LinearGradient(
                                                      colors: <Color>[
                                                        Color(0xFFFF6B78), Color(0xFFFF6B78),
                                                        Color(0xFFE20A22), Color(0xFFE20A22)],
                                                      stops: <double>[0, 0.5, 0.5, 1]),
                                                ),
                                                gradient: LinearGradient(
                                                    colors: <Color>[
                                                      Color(0xFFFF6B78), Color(0xFFFF6B78),
                                                      Color(0xFFE20A22), Color(0xFFE20A22)],
                                                    stops: <double>[0, 0.5, 0.5, 1]),
                                                needleColor: Color(0xFFF67280),
                                                knobStyle: KnobStyle(
                                                    knobRadius: 0.08,
                                                    sizeUnit: GaugeSizeUnit.factor,
                                                    color: Colors.black)),

                                          ],

                                          annotations:<GaugeAnnotation> [

                                            GaugeAnnotation(widget: Text( (parsedSpeed != null && parsedSpeed! >= 200)?"200":parsedSpeed.toString()??"0",style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),horizontalAlignment:GaugeAlignment.center,verticalAlignment:GaugeAlignment.near,positionFactor:0.3,angle:90),
                                            GaugeAnnotation(widget: Text("Km/h",style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),horizontalAlignment:GaugeAlignment.center,verticalAlignment:GaugeAlignment.near,positionFactor:0.4,angle:90),
                                            //  GaugeAnnotation(widget: Container(height:50,width:50,child:Image.asset("assets/images/oil.png",fit:BoxFit.contain,),),horizontalAlignment:GaugeAlignment.center,verticalAlignment:GaugeAlignment.near,positionFactor:0.5,angle:-90),
                                            //   GaugeAnnotation(widget: Container(height:35,width:35,child:Image.asset("assets/images/parkingcolor.png",fit:BoxFit.contain,),),horizontalAlignment:GaugeAlignment.center,verticalAlignment:GaugeAlignment.near,positionFactor:0.4,angle:220),
                                            //  GaugeAnnotation(widget: Container(height:40,width:40,child:Image.asset("assets/images/parkingBrakecolor.png",fit:BoxFit.contain,),),horizontalAlignment:GaugeAlignment.center,verticalAlignment:GaugeAlignment.near,positionFactor:0.42,angle:320),

                                            //  GaugeAnnotation(widget: Container(height:50,width:50,child:Image.asset("assets/images/tpms.png",fit:BoxFit.contain,),),horizontalAlignment:GaugeAlignment.center,verticalAlignment:GaugeAlignment.near,positionFactor:0.35,angle:170),

                                          ]




                                      ),


                                      RadialAxis(
                                        centerX:.5,centerY:.5,radiusFactor:.60,interval:20,minimum: 0,maximum:200,showLabels:false,showAxisLine:false,
                                        axisLabelStyle:GaugeTextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold),
                                        axisLineStyle:AxisLineStyle(thickness:5,cornerStyle:CornerStyle.bothFlat,color:Colors.white),)


                                    ],
                                  ),
                                )),




                                //Middle Container
                                Expanded(flex:1,child:Padding(
                                  padding: const EdgeInsets.only(bottom:30.0),
                                  child: Container(

                                    // height:400,
                                    // width:300,

                                      decoration:BoxDecoration(

                                          gradient:LinearGradient(colors: const<Color>[Colors.white,Colors.black12,
                                            Colors.black12],

                                              begin:Alignment.topRight,end:Alignment.bottomLeft,
                                              stops: const<double>[0.0,0.6,1]),
                                          borderRadius:BorderRadius.only(topLeft:Radius.circular(50),topRight:Radius.circular(50)),




                                          border: Border.all(
                                            color: Colors.black, //Color(0xff38eeff),
                                            width: 3,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 2,
                                              spreadRadius: 2,
                                              color: Colors.black, //Color(0xff38eeff),
                                            )
                                          ]),


                                      child:Container(
                                        height:300,
                                        width:150,
                                        child:Image.asset("assets/images/blackcar.png",fit:BoxFit.contain,),


                                      ) ),

                                  //middle container between two gauges end


                                ),
                                ),
                                Expanded(flex:2,child: CustomPaint(
                                  painter:Circle3DPainter2(circleSize:400),
                                  child: SfRadialGauge(

                                    axes:<RadialAxis>[
                                      RadialAxis(minimum: 0,maximum:20,labelOffset:30,showLastLabel:true,showLabels:true,
                                          axisLineStyle:AxisLineStyle(thickness:5,cornerStyle:CornerStyle.bothFlat,color:Colors.grey),
                                          majorTickStyle:MajorTickStyle(length:20,thickness:4,color:Colors.white,),
                                          axisLabelStyle:GaugeTextStyle(color:Colors.black,fontSize:16,fontWeight:FontWeight.bold),





                                          pointers:<GaugePointer> [
                                            MarkerPointer(value: (rpmr != null && rpmr! >= 20) ? 20 : (rpmr ?? 0),
                                              markerHeight:10,),
                                            RangePointer(value:(rpmr != null && rpmr! >= 20) ? 20 : (rpmr ?? 0),pointerOffset:-0,color:Colors.blue,enableAnimation:true,width:35,gradient:SweepGradient(colors: const<Color>[Colors.green,Colors.green,Colors.green],center:Alignment.centerLeft,stops: const<double>[0.0,0.5,1])),
                                            NeedlePointer(
                                                value: (rpmr != null && rpmr! >= 20) ? 20 : (rpmr ?? 0),
                                                lengthUnit: GaugeSizeUnit.factor,
                                                needleLength: 0.8,
                                                needleEndWidth:  11,
                                                tailStyle: TailStyle(length: 0.2, width: 11,
                                                  gradient:LinearGradient(
                                                      colors: <Color>[
                                                        Color(0xFFFF6B78), Color(0xFFFF6B78),
                                                        Color(0xFFE20A22), Color(0xFFE20A22)],
                                                      stops: <double>[0, 0.5, 0.5, 1]),
                                                ),
                                                gradient: LinearGradient(
                                                    colors: <Color>[
                                                      Color(0xFFFF6B78), Color(0xFFFF6B78),
                                                      Color(0xFFE20A22), Color(0xFFE20A22)],
                                                    stops: <double>[0, 0.5, 0.5, 1]),
                                                needleColor: Color(0xFFF67280),
                                                knobStyle: KnobStyle(
                                                    knobRadius: 0.08,
                                                    sizeUnit: GaugeSizeUnit.factor,
                                                    color: Colors.black)),

                                          ],

                                          annotations:<GaugeAnnotation> [

                                            GaugeAnnotation(widget: Text((rpmr != null && rpmr! >= 20) ? "20" :(rpmr ?? 0).toString(),style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),horizontalAlignment:GaugeAlignment.center,verticalAlignment:GaugeAlignment.near,positionFactor:0.3,angle:90),
                                            GaugeAnnotation(widget: Text("RPM",style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),horizontalAlignment:GaugeAlignment.center,verticalAlignment:GaugeAlignment.near,positionFactor:0.4,angle:90),




                                          ]




                                      ),


                                      RadialAxis(
                                        centerX:.5,centerY:.5,radiusFactor:.60,minimum:0,maximum:20,interval:2,showLabels:false,showAxisLine:false,
                                        axisLabelStyle:GaugeTextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold),
                                        axisLineStyle:AxisLineStyle(thickness:5,cornerStyle:CornerStyle.bothFlat,color:Colors.white),
                                      )


                                    ],
                                  ),
                                )),




                              ],



                            ),
                          ),

                          Expanded(flex:1,
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                              mainAxisSize:MainAxisSize.max,
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [





                                Row(

                                  children: [

                                    Container(
                                      height:50,
                                      width:50,
                                      child:Image.asset("assets/images/fuel-icon.png",fit:BoxFit.contain,),


                                    ) ,

                                    SizedBox(width:12),
                                    Column(
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      mainAxisAlignment:MainAxisAlignment.start,

                                      children: [


                                        Container(
                                          height:14,width:100,color:Colors.green,
                                        ),
                                        SizedBox(height:2,width:80),


                                        Container(
                                          height:14,width:80,color:Colors.green,
                                        ),
                                        SizedBox(height:2,width:70),

                                        Container(
                                          height:14,width:60,color:Colors.green,
                                        ),
                                        SizedBox(height:2,width:70),



                                        Container(
                                          height:14,width:40,color:Colors.green,
                                        ),
                                        SizedBox(height:2,width:70),



                                        Container(
                                          height:14,width:20,color:Colors.green,
                                        ),
                                        SizedBox(height:2,width:70),










                                      ],
                                    ),
                                  ],
                                ),
                                Text("P",style:TextStyle(color:Colors.white70,fontSize:30),),  //park
                                Text("R",style:TextStyle(color:Colors.white70,fontSize:30),), //Reverse
                                Text("N",style:TextStyle(color:Colors.white70,fontSize:30),),  //Neutral
                                Text("D",style:TextStyle(color:Colors.white70,fontSize:30),), //Drive







                                Row(
                                  children: [


                                     FuelMeter(fuelvalue),
                                    // Column(
                                    //   crossAxisAlignment:CrossAxisAlignment.end,
                                    //   mainAxisAlignment:MainAxisAlignment.start,
                                    //
                                    //   children: [
                                    //
                                    //
                                    //     Container(
                                    //       height:14,width:100,color:Colors.green,
                                    //     ),
                                    //     SizedBox(height:2,width:80),
                                    //
                                    //
                                    //     Container(
                                    //       height:14,width:80,color:Colors.green,
                                    //     ),
                                    //     SizedBox(height:2,width:70),
                                    //
                                    //     Container(
                                    //       height:14,width:60,color:Colors.green,
                                    //     ),
                                    //     SizedBox(height:2,width:70),
                                    //
                                    //
                                    //
                                    //     Container(
                                    //       height:14,width:40,color:Colors.green,
                                    //     ),
                                    //     SizedBox(height:2,width:70),
                                    //
                                    //
                                    //
                                    //     Container(
                                    //       height:14,width:20,color:Colors.green,
                                    //     ),
                                    //     SizedBox(height:2,width:70),
                                    //
                                    //
                                    //   ],
                                    // ),

                                    Container(
                                      height:50,
                                      width:50,
                                      child:Image.asset("assets/images/temperature-icon.png",fit:BoxFit.contain,),


                                    ) ,

                                  ],
                                ),





                              ],
                            ),
                          )
                        ],
                      ),




                    ),  //This container will the elements of second row




                  ],

                ),
              )
          );
        }
        ));
  }
}










class Circle3DPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        colors: [Colors.grey, Colors.grey, Colors.white],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ));

    Paint innerCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        colors: [Colors.black26, Colors.grey[300]!],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width / 3, size.height / 3),
        radius: size.width / 2 * 0.4, // Adjust inner circle radius here
      ));

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = size.width / 2;

    Path outerPath = Path();
    outerPath.moveTo(centerX + radius * cos(0), centerY + radius * sin(0));

    Path innerPath = Path();
    innerPath.moveTo(centerX + radius * 0.8 * cos(0), centerY + radius * 0.8 * sin(0));

    for (int i = 1; i <= 360; i++) {
      double radians = i * pi / 180;
      double x = centerX + radius * cos(radians);
      double y = centerY + radius * sin(radians);
      outerPath.lineTo(x, y);

      double innerX = centerX + radius * 0.8 * cos(radians);
      double innerY = centerY + radius * 0.8 * sin(radians);
      innerPath.lineTo(innerX, innerY);
    }

    canvas.drawPath(outerPath, outerCirclePaint);
    canvas.drawPath(innerPath, innerCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}




////////////////////////////////////////////////////////////
class Circle3DPainter2 extends CustomPainter {
  final double circleSize;

  Circle3DPainter2({required this.circleSize});

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = circleSize / 2;

    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.5) //original today grey
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5);

    Path path = Path()
      ..addOval(Rect.fromCircle(center: Offset(centerX, centerY), radius: radius));

    canvas.drawShadow(path, Colors.black, 5.0, true);

    Paint outerCirclePaint = Paint()
      ..style = PaintingStyle.fill      //original fill
      ..shader = RadialGradient(
        colors: [Colors.white, Colors.white, Colors.white],
      ).createShader(Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: radius,
      ));

    Paint innerCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        colors: [Colors.black, Colors.black],
      ).createShader(Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: radius * 0.8,
      ));

    canvas.drawCircle(Offset(centerX, centerY), radius, outerCirclePaint);
    canvas.drawCircle(Offset(centerX, centerY), radius * 0.8, innerCirclePaint);

    canvas.drawCircle(Offset(centerX, centerY + radius * 0.4), radius * 0.35, shadowPaint); // Shadow for 3D effect
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}






class FuelMeter extends StatelessWidget {
   double fuelLevel = 0.7; // Change this value to represent fuel level

  FuelMeter(this.fuelLevel);
  Color containerColor=Colors.grey.withOpacity(.4);
  @override
  Widget build(BuildContext context) {
    final int totalContainers = 5; // Number of containers for full gauge

    int filledContainers = (fuelLevel * totalContainers).floor();

    List<Widget> containers = List.generate(totalContainers, (index) {
      if (index < filledContainers) {



        if (index < filledContainers) {

          if (index == 0) {
            containerColor = Colors.blue.withOpacity(.8);
          } else if (index == 1) {
            containerColor = Colors.green.withOpacity(.8);
          }
          else if (index == 2) {
            containerColor = Colors.orange;
          }

          else if (index == 3) {
            containerColor = Colors.yellow;
          }

          else if (index == 4) {
            containerColor = Colors.red;
          }


          // Add more conditions for additional colors if needed
        } else {
          containerColor = Colors.grey.withOpacity(0.4);
        }



      

        return Container(
          width: 25,
          height: 50,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: containerColor, // Change color as desired
            borderRadius: BorderRadius.circular(5),
          ),
        );
      } else {
        return Container(
          width: 25,
          height: 50,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4), // Change color as desired
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: containers,
    );
  }
}




class FuelMeterPainter extends CustomPainter {
  final double fuelLevel;

  FuelMeterPainter(this.fuelLevel);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue // Change color as desired
      ..style = PaintingStyle.fill;

    Path path = Path();

    double width = size.width;
    double height = size.height;
    double centerX = width / 2;
    double centerY = height;

    double maxFuelWidth = width * 0.8;
    double currentFuelWidth = maxFuelWidth * fuelLevel;

    path.moveTo(centerX, centerY);
    path.lineTo(centerX, 0);
    path.lineTo(centerX, height);

    path.arcTo(
      Rect.fromCenter(center: Offset(centerX, centerY), width: maxFuelWidth, height: height),
      _degreesToRadians(90),
      _degreesToRadians(270),
      true,
    );

    canvas.drawPath(path, paint);

    // Draw the fuel indicator
    Path fuelIndicatorPath = Path();
    fuelIndicatorPath.moveTo(centerX, centerY);
    fuelIndicatorPath.lineTo(centerX, centerY - currentFuelWidth);

    fuelIndicatorPath.arcTo(
      Rect.fromCenter(center: Offset(centerX, centerY - maxFuelWidth), width: currentFuelWidth * 2, height: height),
      _degreesToRadians(90),
      _degreesToRadians(180),
      true,
    );

    canvas.drawPath(fuelIndicatorPath, paint);
  }

  double _degreesToRadians(double degrees) {
    return degrees * (3.14159 / 180); // Conversion from degrees to radians
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/*

 */
