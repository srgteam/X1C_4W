/*importing all the required variables*/

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:thread/thread.dart';
import 'package:http/http.dart' as http;

double screen_height=800;
double screen_width=1280;

//variables for indicator signals
bool indicator_flag=false;
String httpdata='';
String frame='';
bool left=true;
bool right=true;
bool hazard=true;
bool malfunction=true;
bool headlamp=true;
bool highbeam=true;
bool side_stand=true;
bool parking_mode=true;

double battery=76.6;

//variables for media payer
Timer? timer;
Timer?timer1;
Timer?timer2;



///////////////
//These variables will store data of the frame
/*Variables that ends with character D are directly take substring data that broke down from the lines
Variables that ends with r character are actual variable in which i am passing to the ui variables
 */
double fuelvalue=0;
String fuelLevelD = '0';
int fuelLevelr=0;
String rpmD = '0';

String speedD = '0';
String speedr='0';
String odometerD = '0';

String headLampD = '0';
String headLampr='0';
String highbeamD='0';
String highbeamr='0';
String gearD = 'N';
String leftIndicatorD = '0';
String leftIndicatorr='0';
String rightIndicatorD = '0';
String rightIndicatorr='0';

String serviceD = '0';
String serviceDr = '0';
String batteryD = '0';
String batteryDr = '0';



String hazardD= '0';
String hazardr= '0';
String parkingD='0';
String parkingr='0';


int limitspeed=140;

/*additional variables*/
String my_data = '';

String? rawdata='';
bool flag=false ;




//variables for tpms

String xxy='';
double xy =0;

String xxy2= '';
double xy2=0;

String xxy3='';
double xy3=0;
String garbage_data= "xxxxxx" ;




//my tpms logic sensor 2


String aab= '';
double ab =  0;

String aab2= '';
double ab2=0;

String aab3='';
double ab3=0;






String psi1='0';
String psi2='0';
String temp1='0';
String temp2='0';
String tpms_battery='0';
String tpms_battery2='0';

///////////////////////////////////////////////

/*The get gauge color function will return the color
* of the gauge according to the incoming value*/
Color get_guage_color(){

  if ((parsedSpeed != null && (parsedSpeed! >= 0 && parsedSpeed! <= 40 )))
  {

    return Colors.green;

  }

  else if ((parsedSpeed != null && (parsedSpeed! > 40 && parsedSpeed! <= 80 )))
  {

    return Colors.blue;

  }

  else if ((parsedSpeed != null && (parsedSpeed! > 80 && parsedSpeed! <= 200 )))
  {

    return Colors.red;

  }

  else
    return Colors.red;

}

/* battery color is the function which returns the color and according to the battery percentage status
color of the battery icon will change*/








/*functions to blink the indicators*/






final thread = Thread((events) {
  events.on('data', (String data) async {
    while(true) {
      await Future.delayed(const Duration(milliseconds: 50));
      httpdata = await http.read(Uri.http('127.0.0.1:2001', ''));              //"*E12345 150 1 123456 1 0 1 1 1 0 0114k#@Q111111111111&P";
      //print(httpdata);

      events.emit('realtime', '$httpdata');



    }
  });
});


void mythreadfunc()async{

  thread.on('realtime', (String data) => rawdata=data);

  thread.emit('data', 'Hello world!');
  thread.emit('data', 'Wow!');

  print(await thread.compute(() => 'Hello world!')  );
}

double? parsedSpeed;
int ? odometerr=00000;
double ? rpmr=00000;
int ? gearr=0;



//extra indicators

String oilD = '0';
String oilr='0';
bool oil=true;
String parking_braked = '0';
String parking_braker='0';
bool parking_brake=true;

String tpmsd = '0';
String tpmsr='0';
bool tpms=false;

String beltd = '0';
String beltr='0';
bool seat_belt=false;
//String highbeamr='0';




String lockd = '0';
String lockr='0';
bool lock=false;


double fuel_decimal=0.0;


