


import 'package:flutter/material.dart';
import 'package:flutter_homescreen/variables/variables.dart';

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
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    Path path = Path()
      ..addOval(Rect.fromCircle(center: Offset(centerX, centerY), radius: radius));

    canvas.drawShadow(path, Colors.black, 5.0, true);

    Paint outerCirclePaint = Paint()
      ..style = PaintingStyle.fill      //original fill
      ..shader = const RadialGradient(
        colors: [Colors.white, Colors.white, Colors.white],
      ).createShader(Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: radius,
      ));

    Paint innerCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = const RadialGradient(
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










class MyImageWidget extends StatelessWidget {
  const MyImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SizedBox(
          height:300,
          width:150,
          child:blackCar


        )
    );
  }
}










class Myfuelwidget extends StatelessWidget {
  const Myfuelwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        mainAxisAlignment:MainAxisAlignment.start,

        children: [


          Container(
            height:14,width:100,color:Colors.green,
          ),
          const SizedBox(height:2,width:80),
          Container(
            height:14,width:80,color:Colors.green,
          ),
          const SizedBox(height:2,width:70),
          Container(
            height:14,width:60,color:Colors.green,
          ),
          const SizedBox(height:2,width:70),
          Container(
            height:14,width:40,color:Colors.green,
          ),
          const SizedBox(height:2,width:70),
          Container(
            height:14,width:20,color:Colors.green,
          ),
          const SizedBox(height:2,width:70),

        ],
      );
  }
}













class fuelIconWidget extends StatelessWidget {
  const fuelIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:50,
      width:50,
      child:fuelIcon


    );

  }
}













class FuelMeter extends StatelessWidget {
  double fuelLevel = 0.7; // Change this value to represent fuel level

  FuelMeter(this.fuelLevel, {super.key});
  Color containerColor=Colors.grey.withOpacity(.4);
  @override
  Widget build(BuildContext context) {
    const int totalContainers = 5; // Number of containers for full gauge

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
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: containerColor, // Change color as desired
            borderRadius: BorderRadius.circular(5),
          ),
        );
      } else {
        return Container(
          width: 25,
          height: 50,
          margin: const EdgeInsets.all(2),
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