
//in this file we are increasing the http request time making the images constant













import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_homescreen/data_provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../myWidgets.dart';
import '../variables/variables.dart';






class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    late Timer timer;

    @override
  void initState() {


      final myProvider=Provider.of<MyDataProvider>(context,listen:false);
      timer= Timer.periodic(const Duration(milliseconds:100), (timer) {
         myProvider.takeHttpData();


    });
    super.initState();
  }



    @override
    void didChangeDependencies() {
      precacheImage(leftOnImage.image, context);
      precacheImage(leftOff.image, context);
      precacheImage(saracaLogo.image, context);
      precacheImage(rightOn.image, context);
      precacheImage(rightOff.image, context);
      precacheImage(oilOn.image, context);
      precacheImage(oilOff.image, context);
      precacheImage(parkingOn.image, context);
      precacheImage(parkingOff.image, context);
      precacheImage(parkingBrakeOn.image, context);
      precacheImage(parkingBrakeOff.image, context);
      precacheImage(seatBeltOn.image, context);
      precacheImage(seatBeltOff.image, context);
      precacheImage(highBeamOn.image, context);
      precacheImage(highBeamOff.image, context);
      precacheImage(carLockOn.image, context);
      precacheImage(carLockOff.image, context);
      precacheImage(lowBeamOn.image, context);
      precacheImage(lowBeamOff.image, context);
      precacheImage(malfunctionOn.image, context);
      precacheImage(malfunctionOff.image, context);
      precacheImage(fuelIcon.image, context);
      precacheImage(tempIcon.image, context);
      precacheImage(blackCar.image, context);


      super.didChangeDependencies();
    }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }




  @override
  Widget build(BuildContext context) {

    final myProvider=Provider.of<MyDataProvider>(context,listen:false);


    return Scaffold(

      body:
     Center(
       child: Container(

           height:screen_height,
           width:screen_width,
           decoration:const BoxDecoration(

             gradient:LinearGradient(colors: <Color>[Colors.black12,Colors.black12,
               Colors.black],

                 begin:Alignment.topRight,end:Alignment.centerLeft,
                 stops: <double>[0.0,0.3,1]),

           ),

         child:Column(

           children: [


                    Container(
                       width:(screen_width),
                       height:screen_height/6,
                       decoration:const BoxDecoration(  //Decoration of the container
                       borderRadius:BorderRadius.only(topLeft:Radius.circular(0),topRight:Radius.circular(0)), boxShadow:[
                       BoxShadow(blurRadius:0,spreadRadius:0,blurStyle:BlurStyle.normal),]
                        ),




                      //this is the Row of the ist container inside ist column element



                      child:Row(

                        crossAxisAlignment:CrossAxisAlignment.center,
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                        children: [

                          Expanded(flex:1,child:Consumer<MyDataProvider>(builder:(context,value,child){

                            return
                              Container(
                                  alignment:Alignment.center,
                                  decoration:const BoxDecoration(

                                    gradient:LinearGradient(colors: <Color>[Colors.blue,Colors.black12,
                                      Colors.black12],

                                        begin:Alignment.topRight,end:Alignment.centerLeft,
                                        stops: <double>[0.0,0.9,1]),


                                    borderRadius:BorderRadius.only(bottomRight:Radius.circular(50)),


                                  ),
                                  child:
                                  left==true?leftOnImage:leftOff

                              );
                          },)
                          ),





                          //time and saraca logo section


                          Expanded(flex:2,child: Container(

                            color:Colors.black,
                            child:Container(
                              alignment:Alignment.center,
                              decoration:const BoxDecoration(
                                // gradient:SweepGradient(colors: const<Color>[Color(0xff4c4c4c),Color(0xff4c4c4c),Color(0xff323232),Color(0xff191919)],center:Alignment.centerLeft,stops: const<double>[0.0,0.25,0.5,1]),

                                  borderRadius:BorderRadius.only(bottomLeft:Radius.circular(100),bottomRight:Radius.circular(100)),
                                  boxShadow:[BoxShadow(
                                    blurRadius:20,
                                    color:Colors.black,
                                  )]
                              ),

                              child:Column(

                                children: [
                                  SizedBox(
                                      height:100,width:300,
                                      child:saracaLogo
                                  ),
                                ],
                              ),
                            ),

                          )),




                          Expanded(flex:1,child:Consumer<MyDataProvider>(builder:(context,value,child){
                            return
                              Container(
                                alignment:Alignment.center,
                                decoration:const BoxDecoration(

                                    gradient:LinearGradient(colors: <Color>[Colors.black12,Colors.black12,
                                      Colors.blue],

                                        begin:Alignment.topRight,end:Alignment.centerLeft,
                                        stops: <double>[0.0,0.3,1]),


                                    borderRadius:BorderRadius.only(bottomLeft:Radius.circular(50)),






                                    boxShadow:[
                                      BoxShadow()

                                    ]
                                ),
                                child:right==true?rightOn:rightOff

                              );
                          }

                            ,))
                        ],

                      )



                      ),






             //second row element

             Container(
             width:screen_width,
             height:screen_height-(screen_height/6),
             decoration:const BoxDecoration(

                 gradient:LinearGradient(colors: <Color>[Colors.black12,Colors.black12,
                   Colors.black12],
                     begin:Alignment.topRight,end:Alignment.centerLeft,
                     stops: <double>[0.0,0.3,1]),

                 borderRadius:BorderRadius.only(topLeft:Radius.circular(0),topRight:Radius.circular(0)),
                 boxShadow:[BoxShadow(

                   blurRadius:0,
                   spreadRadius:0,
                   blurStyle:BlurStyle.normal,
                 )]
             ),


               child:Column(
                 children: [



                   Expanded(flex:1,

                     child:Consumer<MyDataProvider>(builder:(context,value,child){

                     return

                     SizedBox(
                       //in this sized box all the indicators are available

                       height:80,width:1280,
                       child:Row(
                         mainAxisAlignment:MainAxisAlignment.spaceAround,
                         children: [
                           Row(
                             children: const [
                               Icon(Icons.circle_outlined,size:45,color:Colors.white,),
                               Text("104.0km",style:TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.bold),)
                             ],
                           ),

                           SizedBox(height:50,width:50,child:oil==true?oilOn:oilOff),

                           SizedBox(height:35,width:35,child:parking_mode==true?parkingOn:parkingOff), //parkingcolor

                           SizedBox(height:40,width:40,child:parking_brake==true?parkingBrakeOn:parkingBrakeOff), //parkingBrakecolor.png


                           SizedBox(height:35,width:35,child:tpms==true?Image.asset("assets/images/tpms.png",fit:BoxFit.contain,):Image.asset("assets/images/tpms_new.png",fit:BoxFit.contain,),),

                           Padding(
                             padding: const EdgeInsets.only(top:15.0),
                             child:
                             Column(
                               mainAxisAlignment:MainAxisAlignment.center,
                               children: [
                                 Text(DateFormat('EEE d MMM').format(DateTime.now()),style:const TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.bold,),),
                                 Text(DateFormat('HH:mm aa').format(DateTime.now()),style:const TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.bold,),),
                               ],
                             ),

                             // child: Container(
                             //     child:Image.asset("assets/images/saracalogo2.png",fit:BoxFit.contain)
                             // ),
                           ),


                           SizedBox(height:35,width:35,child:seat_belt==true?seatBeltOn:seatBeltOff),
                           SizedBox(height:35,width:35,child:highbeam==true?highBeamOn:highBeamOff),
                           SizedBox(height:30,width:30,child:lock==true?carLockOn:carLockOff),


                           SizedBox(height:35,width:35,child:headlamp==true?lowBeamOn:lowBeamOff),  //low-beam_green
                           SizedBox(height:35,width:35,child:malfunction==true?malfunctionOn:malfunctionOff),//colormalfunctionbg


                           Row(
                             children: [
                               const Icon(Icons.flag_outlined,size:45,color:Colors.white),
                               Text((odometerr != null )? "$odometerr km":"ODO 00000 km",
                                 style: const TextStyle(
                                   fontSize: 30,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white,
                                 ),
                               ),

                             ],
                           )
                         ],
                       ),

                     );})
                   ) , //This Sizedbox














                   Expanded(flex:6,child:Row(
                     children: [
                       Expanded(flex:2,child: CustomPaint(
                         painter:Circle3DPainter2(circleSize: 400),
                         child: Consumer<MyDataProvider>(builder:(context,value,child){
                            return

                         SfRadialGauge(

                           axes:<RadialAxis>[
                             RadialAxis(minimum: 0,maximum:200,labelOffset:30,showLastLabel:true,showLabels:true,interval:20,
                                 axisLineStyle:const AxisLineStyle(thickness:5,cornerStyle:CornerStyle.bothFlat,color:Colors.grey),
                                 majorTickStyle:const MajorTickStyle(length:20,thickness:4,color:Colors.white,),
                                 axisLabelStyle:const GaugeTextStyle(color:Colors.black,fontSize:16,fontWeight:FontWeight.bold),





                                 pointers:<GaugePointer> [
                                   MarkerPointer(value:(parsedSpeed != null && parsedSpeed! >= 200) ? 200 :(parsedSpeed ?? 0),markerHeight:10,),
                                   RangePointer(value: (parsedSpeed != null && parsedSpeed! >= 200) ? 200 :(parsedSpeed ?? 0) ,pointerOffset:-0,color:get_guage_color(),enableAnimation:true,width:35,),
                                   NeedlePointer(
                                       value: (parsedSpeed != null && parsedSpeed! >= 200) ? 200 :(parsedSpeed ?? 0),
                                       lengthUnit: GaugeSizeUnit.factor,
                                       needleLength: 0.8,
                                       needleEndWidth:  11,
                                       tailStyle: const TailStyle(length: 0.2, width: 11,
                                         gradient:LinearGradient(
                                             colors: <Color>[
                                               Color(0xFFFF6B78), Color(0xFFFF6B78),
                                               Color(0xFFE20A22), Color(0xFFE20A22)],
                                             stops: <double>[0, 0.5, 0.5, 1]),
                                       ),
                                       gradient: const LinearGradient(
                                           colors: <Color>[
                                             Color(0xFFFF6B78), Color(0xFFFF6B78),
                                             Color(0xFFE20A22), Color(0xFFE20A22)],
                                           stops: <double>[0, 0.5, 0.5, 1]),
                                       needleColor: const Color(0xFFF67280),
                                       knobStyle: const KnobStyle(
                                           knobRadius: 0.08,
                                           sizeUnit: GaugeSizeUnit.factor,
                                           color: Colors.black)),

                                 ],

                                 annotations:<GaugeAnnotation> [

                                   GaugeAnnotation(widget: Text( (parsedSpeed != null && parsedSpeed! >= 200)?"200":parsedSpeed.toString(),style:const TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),horizontalAlignment:GaugeAlignment.center,verticalAlignment:GaugeAlignment.near,positionFactor:0.3,angle:90),
                                   const GaugeAnnotation(widget: Text("Km/h",style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),horizontalAlignment:GaugeAlignment.center,verticalAlignment:GaugeAlignment.near,positionFactor:0.4,angle:90),

                                 ]




                             ),



                           ],
                         );}),
                       )),






                       //Middle Container
                       Expanded(flex:1,child:Padding(
                         padding: const EdgeInsets.only(bottom:30.0),
                         child: Container(

                           // height:400,
                           // width:300,

                             decoration:BoxDecoration(

                                 gradient:const LinearGradient(colors: <Color>[Colors.white,Colors.black12,
                                   Colors.black12],

                                     begin:Alignment.topRight,end:Alignment.bottomLeft,
                                     stops: <double>[0.0,0.6,1]),
                                 borderRadius:const BorderRadius.only(topLeft:Radius.circular(50),topRight:Radius.circular(50)),




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


                             child: const MyImageWidget()),

                         //middle container between two gauges end


                       ),
                       ),

                      Expanded(flex:2,child:

                     CustomPaint(
                       painter:Circle3DPainter2(circleSize:400),
                       child: Consumer<MyDataProvider>(builder:(context,value,child){
                          return  SfRadialGauge(

                        axes:<RadialAxis>[
                        RadialAxis(minimum: 0,maximum:20,labelOffset:30,showLastLabel:true,showLabels:true,
                        axisLineStyle:const AxisLineStyle(thickness:5,cornerStyle:CornerStyle.bothFlat,color:Colors.grey),
                        majorTickStyle:const MajorTickStyle(length:20,thickness:4,color:Colors.white,),
                        axisLabelStyle:const GaugeTextStyle(color:Colors.black,fontSize:16,fontWeight:FontWeight.bold),

                        pointers:<GaugePointer> [
                          MarkerPointer(value: (rpmr != null && rpmr! >= 20) ? 20 : (rpmr ?? 0),
                            markerHeight:10,),
                          RangePointer(value:(rpmr != null && rpmr! >= 20) ? 20 : (rpmr ?? 0),pointerOffset:-0,color:Colors.blue,enableAnimation:true,width:35,gradient:const SweepGradient(colors: <Color>[Colors.green,Colors.green,Colors.green],center:Alignment.centerLeft,stops: <double>[0.0,0.5,1])),
                          NeedlePointer(
                              value: (rpmr != null && rpmr! >= 20) ? 20 : (rpmr ?? 0),
                              lengthUnit: GaugeSizeUnit.factor,
                              needleLength: 0.8,
                              needleEndWidth:  11,
                              tailStyle: const TailStyle(length: 0.2, width: 11,
                                gradient:LinearGradient(
                                    colors: <Color>[
                                      Color(0xFFFF6B78), Color(0xFFFF6B78),
                                      Color(0xFFE20A22), Color(0xFFE20A22)],
                                    stops: <double>[0, 0.5, 0.5, 1]),
                              ),
                              gradient: const LinearGradient(
                                  colors: <Color>[
                                    Color(0xFFFF6B78), Color(0xFFFF6B78),
                                    Color(0xFFE20A22), Color(0xFFE20A22)],
                                  stops: <double>[0, 0.5, 0.5, 1]),
                              needleColor: const Color(0xFFF67280),
                              knobStyle: const KnobStyle(
                                  knobRadius: 0.08,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  color: Colors.black)),

                        ],



                          annotations:<GaugeAnnotation> [

                            GaugeAnnotation(widget: Text((rpmr != null && rpmr! >= 20) ? "20" :(rpmr ?? 0).toString(),style:const TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),horizontalAlignment:GaugeAlignment.center,verticalAlignment:GaugeAlignment.near,positionFactor:0.3,angle:90),
                            const GaugeAnnotation(widget: Text("RPM",style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),horizontalAlignment:GaugeAlignment.center,verticalAlignment:GaugeAlignment.near,positionFactor:0.4,angle:90),




                          ]


                        )]
                          );






                       }),
                     )

                      )],
                   )


                   ),





                   Expanded(flex:1,
                     child: Row(
                       mainAxisAlignment:MainAxisAlignment.spaceAround,
                       mainAxisSize:MainAxisSize.max,
                       crossAxisAlignment:CrossAxisAlignment.start,
                       children: [





                         Row(

                           children: const [

                            fuelIconWidget(),
                             SizedBox(width:12),
                             Myfuelwidget(),
                           ],
                         ),
                         const Text("P",style:TextStyle(color:Colors.white70,fontSize:30),),  //park
                         const Text("R",style:TextStyle(color:Colors.white70,fontSize:30),), //Reverse
                         const Text("N",style:TextStyle(color:Colors.white70,fontSize:30),),  //Neutral
                         const Text("D",style:TextStyle(color:Colors.white70,fontSize:30),), //Drive







                         Row(
                           children: [


                             FuelMeter(fuelvalue),

                             SizedBox(
                               height:50,
                               width:50,
                               child:tempIcon


                             ) ,

                           ],
                         ),





                       ],
                     ),
                   )







                 ],
               )



             )


           ],
         ),


       ),

     )
    );
  }
}
