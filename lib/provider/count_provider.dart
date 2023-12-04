
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_homescreen/variables.dart';

class count_provider extends ChangeNotifier{




  ///////////////////////////////
  Future<void> loadGaugeValues() async {
    try {

      String line = rawdata.toString();


      if (line.isNotEmpty && line.startsWith('*E') && line.endsWith('&P') && line!=null ){
        rpmD = line.substring(2, 7);
        speedD = line.substring(8, 11);
        fuelLevelD = line.substring(12, 13);
        odometerD = line.substring(14, 20);
        headLampD = line.substring(21, 22);  //headlamp low beam

        gearD = line.substring(23, 24) ?? 'N';
        leftIndicatorD =line.substring(25, 26); //left
        highbeamD=line.substring(26,27);    //highbeam
        rightIndicatorD =line.substring(27, 28); //right
        oilD =line.substring(29, 30);
        beltd=line.substring(30,31);//oil
        parking_braked=line.substring(31,32);  //parking_brake
        hazardD =line.substring(33, 34);       //malfunction
        parkingD=line.substring(34,35); //parking
        lockd=line.substring(35,36);//








        //my rpms logic sensor 1



        //my tpms logic sensor 2









        ////////////////
      }  else {
        rpmD = '00000';
        speedD = '000';
        fuelLevelD = '0';
        odometerD = '000000';
        headLampD = '0';
        gearD = 'N';
        leftIndicatorD = '0';
        rightIndicatorD = '0';
        oilD = '0';
        batteryD = '00';
        parking_braked='0';
        hazardD='0';
        parkingD='0';
        highbeamD='0';
        lockd='0';
        beltd='0';


        notifyListeners();
      }



      fuelLevelr = int.tryParse(fuelLevelD) ?? 0;
      if (fuelLevelr > 0 && fuelLevelr <= 9) {
        fuelvalue = fuelLevelr / 10;
      }
      else {
        fuelvalue = 0;
      }
      parsedSpeed = double.tryParse(speedD)??0;
      odometerr = int.tryParse(odometerD)??00000;
      gearr = int.tryParse(gearD);
      rpmr = double.tryParse(((double.tryParse(rpmD))!/10000).toString()) ;
      parking_braker=parking_braked;
      oilr = oilD;
      hazardr = hazardD;
      leftIndicatorr = leftIndicatorD;

      rightIndicatorr = rightIndicatorD;
      parkingr = parkingD;
      headLampr = headLampD;

      highbeamr = highbeamD;
      lockr=lockd;
      beltr=beltd;


      //switch_mode();//this will change the screen according to the mode input
      leftIndicatorr == '1' ? left = true : left = false;         //left indicator
      rightIndicatorr == '1' ? right = true : right = false;     //right indicator
      headLampr == '1' ? headlamp = true : headlamp = false;    //headlamp(low beam)
      highbeamr == '1' ? highbeam = true : highbeam = false;     //highbeam

      hazardr == '1' ? malfunction = true : malfunction = false;  //malfunction
      parkingr == '1' ? parking_mode = true : parking_mode = false;  //parking_mode
      oilr == '1' ? oil = true : oil = false; //oil
      parking_braker == '1' ? parking_brake = true : parking_brake = false;
      beltr == '1' ? seat_belt = true : seat_belt = false;
      lockr == '1' ? lock = true : lock = false;








      //passing the tpms values







      notifyListeners();





    } catch (e) {
      print('Error loading gauge values: $e');
    }
  }




}
