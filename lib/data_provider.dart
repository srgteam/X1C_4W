
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_homescreen/variables/variables.dart';


class MyDataProvider extends ChangeNotifier
{
    String httpData="";
    String myData="";
    String getData="";
    String previousData="";


    Future<void > takeHttpData()async{

        try {
            httpData = await http.read(Uri.http('127.0.0.1:2001',
                '')); //"*E12345 150 1 123456 1 0 1 1 1 0 0114k#@Q111111111111&P";
            myData = httpData.toString();
            passValue();
            notifyListeners();
        }
        catch(e)
        {
            myData=myData;
            passValue();
            notifyListeners();
        }
    }


    /////////additional part











    ////////////////////////////



    void passValue() {

        if (myData.isNotEmpty && myData.startsWith('*E') && myData.endsWith('&P') && myData.length==38) {

            getData = myData;


            rpmD = getData.substring(2, 8);
            speedD = getData.substring(8, 11);
            fuelLevelD = getData.substring(12, 13);
            odometerD = getData.substring(14, 20);
            headLampD = getData.substring(21, 22);  //headlamp low beam

            leftIndicatorD =getData.substring(25, 26); //left
            highbeamD=getData.substring(26,27);    //highbeam
            rightIndicatorD =getData.substring(27, 28); //right
            oilD =getData.substring(29, 30);
            beltd=getData.substring(30,31);//oil
            parking_braked=getData.substring(31,32);  //parking_brake
            hazardD =getData.substring(33, 34);       //malfunction
            parkingD=getData.substring(34,35); //parking
            lockd=getData.substring(35,36);//

            notifyListeners();
        }

        else
        {
            rpmD = rpmD;
            speedD = speedD;
            fuelLevelD = fuelLevelD;
            odometerD = odometerD;
            headLampD = headLampD;  //headlamp low beam

            leftIndicatorD =leftIndicatorD; //left
            highbeamD=highbeamD;    //highbeam
            rightIndicatorD =rightIndicatorD; //right
            oilD =oilD;
            beltd=beltd;//oil
            parking_braked=parking_braked;  //parking_brake
            hazardD =hazardD;       //malfunction
            parkingD=parkingD; //parking
            lockd=lockd;//

            notifyListeners();
        }



        //passing the values to there original variables

        fuelLevelr = int.tryParse(fuelLevelD) ?? 0;
        if (fuelLevelr > 0 && fuelLevelr <= 9) {
            fuelvalue = fuelLevelr / 10;
        }
        else {
            fuelvalue = 0;
        }
        parsedSpeed = double.tryParse(speedD)??0;
        odometerr = int.tryParse(odometerD)??00000;
        rpmr = double.tryParse(((double.tryParse(rpmD))!/10000).toString()) ;


        //switch_mode();//this will change the screen according to the mode input
        leftIndicatorD == '1' ? left = true : left = false;         //left indicator
        rightIndicatorD == '1' ? right = true : right = false;     //right indicator
        headLampD == '1' ? headlamp = true : headlamp = false;    //headlamp(low beam)
        highbeamD == '1' ? highbeam = true : highbeam = false;     //highbeam

        hazardD == '1' ? malfunction = true : malfunction = false;  //malfunction
        parkingD == '1' ? parking_mode = true : parking_mode = false;  //parking_mode
        oilD == '1' ? oil = true : oil = false; //oil
        parking_braked == '1' ? parking_brake = true : parking_brake = false;
        beltd == '1' ? seat_belt = true : seat_belt = false;
        lockd == '1' ? lock = true : lock = false;


        notifyListeners();


        //////////////////////////////////
        }



















}