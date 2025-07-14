import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome_ui/utils/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of the smart devices
  List mySmartDevices = [
    //[smartdevice name, iconpath, powerStatus]
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", true],
  ];

  //power button switch
  void powerSwitchChanged(bool value, int index){
    setState(() {
      mySmartDevices[index][2] = value;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("lib/icons/menu.png", 
                height: 40,
                color: const Color.fromARGB(255, 37, 36, 36),
                ),


                Image.asset("lib/icons/person.png",
                height: 40, 
                color: const Color.fromARGB(255, 39, 38, 38),
                ),
              ],
            ),
          ),

        SizedBox(height: 20,),

        // welcome home upendra shrestha
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text("Welcome home,"),
                Text("Upendra Shrestha",
                style:GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
          ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Divider(
            color: Colors.grey[400],
            thickness: 5,
          ),
        ),

        SizedBox(height: 20,),

        //smart device +grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Smart devices",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.grey[800],
            ),),
          ),

          Expanded(
            child:GridView.builder(
              itemCount: mySmartDevices.length,
              // physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1.2
              ), 
                itemBuilder: (context, index){
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconpath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],

                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                }
              ))
        ],
      ),
    );
  }
}