import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_tal/controller/dataTrack.c.dart';
import 'package:sih_tal/utils/misc.dart';

class DataInfo extends StatefulWidget {
  const DataInfo({Key? key}) : super(key: key);

  @override
  State<DataInfo> createState() => _DataInfoState();
}

class _DataInfoState extends State<DataInfo> {
  late DataTrackController _dtc;

  @override
  void initState() {
    super.initState();
    _dtc = Get.put(DataTrackController());
  }

  @override
  void dispose() {
    super.dispose();
    _dtc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                _dtc.disposed.value = true;
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          title: const Text('Box ID : dfw35n228h'),
        ),
        body: Stack(
          children: [
            Obx(() {
              final sensorValues = _dtc.fieldData.value;
              if (_dtc.isLoading.value) {
                return Center(child: Misc(context).customProgressIndicator());
              }
              return SizedBox(
                width: _size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Temperature Level : ${sensorValues[0].temperature}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Humidity Level : ${sensorValues[0].humidity}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Gas Composition : ${sensorValues[0].gasComp}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ]),
              );
            }),
            Misc(context).sihLogo(),
            Misc(context).circleAsset()
          ],
        ));
  }
}
