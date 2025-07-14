import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {

  final String smartDeviceName;
  final String iconpath;
  final bool powerOn;
  final Function(bool)? onChanged;

 const SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconpath,
    required this.powerOn,
    required this.onChanged,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900]:Colors.grey[200],
          borderRadius: BorderRadius.circular(12)
          
        ),
        padding: EdgeInsetsDirectional.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          //icons
            Image.asset(
              iconpath,
              height: 60,
              color: powerOn ? Colors.white: Colors.black),

          //device name and switch
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(smartDeviceName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: powerOn ? Colors.white: Colors.black
                    ),),
                  )
                ),
                Transform.rotate(
                  angle: pi/2,
                  child: CupertinoSwitch(
                    value: powerOn, 
                    onChanged: onChanged,
                  ),
                )
              ],
            )
          ],

        
        ),
      ),
    );
  }
}