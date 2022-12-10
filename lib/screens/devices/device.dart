import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/Widgets/AppBars/gs-3.dart';
import 'package:mom_and_kids_app/Widgets/button.dart';
import 'package:mom_and_kids_app/screens/home/main_home.dart';

class Device extends StatefulWidget {
  static String routesName = '/device';
  const Device({super.key});

  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  List<String> deviceName = [
    "Lilygo Wristband",
    "Mi Band 4",
    "Lilygo Wristband",
    "Mi Band 4"
  ];

  int? val;
  String choosedDevice = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GS3(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose Device",
              style: TextStyle(
                fontFamily: "Avenir-Black",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.separated(
                  itemCount: deviceName.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F7F8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RadioListTile(
                          value: index,
                          activeColor: const Color(0XFF62A19B),
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = value;
                              choosedDevice = deviceName[index];
                            });
                          },
                          toggleable: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: Row(
                            children: [
                              Image.asset(
                                "assets/images/wristband.png",
                                scale: 1.3,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(deviceName[index]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF62A19B),
                    fixedSize: const Size(160, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Screens.routesName);
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
