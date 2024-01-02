/*importing all the required variables*/

import 'package:flutter/material.dart';
import 'dart:async';



const double screen_height=800;
const double screen_width=1280;

//variables for indicator signals


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




/*additional variables*/
String? rawdata='';







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

  else {
    return Colors.red;
  }

}

/* battery color is the function which returns the color and according to the battery percentage status
color of the battery icon will change*/








/*functions to blink the indicators*/







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


//images




  Image leftOnImage = Image.asset(
    "assets/images/left_green.png", fit: BoxFit.contain,);
  Image leftOff = Image.asset(
    "assets/images/colorleftwhite.png", fit: BoxFit.contain,);
  Image saracaLogo = Image.asset(
    "assets/images/saracalogo2.png", fit: BoxFit.contain,);

  Image rightOn = Image.asset(
    "assets/images/right_green.png", fit: BoxFit.contain,);
  Image rightOff = Image.asset(
    "assets/images/right_white.png", fit: BoxFit.contain,);
  Image oilOn = Image.asset(
    "assets/images/oil_yellow.png", fit: BoxFit.contain,);
  Image oilOff = Image.asset("assets/images/oil_new.png", fit: BoxFit.contain,);
  Image parkingOn = Image.asset(
    "assets/images/parkingcolor.png", fit: BoxFit.contain,);
  Image parkingOff = Image.asset(
    "assets/images/parking_new.png", fit: BoxFit.contain,);
  Image parkingBrakeOn = Image.asset(
    "assets/images/parkingBrakecolor.png", fit: BoxFit.contain,);
  Image parkingBrakeOff = Image.asset(
    "assets/images/parking_brake_new.png", fit: BoxFit.contain,);
  Image seatBeltOn = Image.asset(
    "assets/images/seat_belt_red.png", fit: BoxFit.contain,);
  Image seatBeltOff = Image.asset(
    "assets/images/seatBelt.png", fit: BoxFit.contain,);
  Image highBeamOn = Image.asset(
    "assets/images/high-beam_blue.png", fit: BoxFit.contain,);
  Image highBeamOff = Image.asset(
    "assets/images/high-beam_white.png", fit: BoxFit.contain,);
  Image carLockOn = Image.asset(
    "assets/images/carlock_new.png", fit: BoxFit.contain,);
  Image carLockOff = Image.asset(
    "assets/images/car_lock_new.png", fit: BoxFit.contain,);
  Image lowBeamOn = Image.asset(
    "assets/images/low-beam_green.png", fit: BoxFit.contain,);
  Image lowBeamOff = Image.asset(
    "assets/images/low-beam_white.png", fit: BoxFit.contain,);
  Image malfunctionOn = Image.asset(
    "assets/images/colormalfunctionbg.png", fit: BoxFit.contain,);
  Image malfunctionOff = Image.asset(
    "assets/images/engine_new2.png", fit: BoxFit.contain,);
  Image fuelIcon = Image.asset(
      "assets/images/fuel-icon.png", fit: BoxFit.contain);
  Image tempIcon = Image.asset(
    "assets/images/temperature-icon.png", fit: BoxFit.contain,);
  Image blackCar = Image.asset(
      "assets/images/blackcar.png", fit: BoxFit.contain);



