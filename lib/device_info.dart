import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceInfomation extends StatefulWidget {
  const DeviceInfomation({super.key});

  @override
  State<DeviceInfomation> createState() => _DeviceInfomationState();
}

class _DeviceInfomationState extends State<DeviceInfomation> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};
    print("Device: ${Platform.environment}");
    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{'Error': 'Failed to get Data'};
    }
    if (!mounted) return;
    setState(() {
      _deviceData = deviceData;
    });
    print("Device Data is : ${deviceData["androidId"]}");
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.id,
      'systemFeatures': build.systemFeatures,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Device Infomation")),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("VERSION SECURITY PATCH : ${_deviceData["version.securityPatch"]}"),
              Text("VERSION SDKINT  :  ${_deviceData["version.sdkInt"]}"),
              Text("VERSION RELEASE :  ${_deviceData["version.release"]}"),
              Text("VERSION PREVIEW SDKINT: ${_deviceData["version.previewSdkInt"]}"),
              Text("VERSION INCREMENTAL : ${_deviceData["version.incremental"]}"),
              Text("VERSION CODENAME : ${_deviceData["version.codename"]}"),
              Text("VERSION BASE_OS : ${_deviceData["version.baseOS"]}"),
              Text("BOARD : ${_deviceData["board"]}"),
              Text("BOOTLOADER  :  ${_deviceData["bootloader"]}"),
              Text("DEVICE  :  ${_deviceData["device"]}"),
              Text("DISPLAY  :  ${_deviceData["display"]}"),
              Text("FINGERPRINT  :  ${_deviceData["fingerprint"]}"),
              Text("HARDWARE  :  ${_deviceData["hardware"]}"),
              Text("HOST  :  ${_deviceData["host"]}"),
              Text("ID  :  ${_deviceData["id"]}"),
              Text("MANUFACTURE  :  ${_deviceData["manufacturer"]}"),
              Text("MODEL  :  ${_deviceData["model"]}"),
              Text("PRODUCT  :  ${_deviceData["product"]}"),
              Text("SUPPORTED 32BitAbis  :  ${_deviceData["supported32BitAbis"]}"),
              Text("SUPPORTED 64BitAbis  :  ${_deviceData["supported64BitAbis"]}"),
              Text("SUPPORTED Abis  :  ${_deviceData["supportedAbis"]}"),
              Text("TAGS  :  ${_deviceData["tags"]}"),
              Text("TYPES  :  ${_deviceData["type"]}"),
              Text("IS PHYSICAL DEVICE  :  ${_deviceData["isPhysicalDevice"]}"),
              Text("ANDROID ID  :  ${_deviceData["androidId"]}"),
              Text("SYSTEM FEATURES  :  ${_deviceData["systemFeatures"]}"),
            ],
          ),
        )),
      ),
    );
  }
}
