import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../model/bluetooth.dart';

class DevicePage extends StatelessWidget {
 const DevicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Bluetooth>(
        builder: (context, child, model) {
          return  Scaffold(
              appBar:  AppBar(
                title: Text(model.device != null ? model.device!.name : "Disconnected"),
                actions: _buildActionButtons(model),
              ),
              body:  Column(
                  children: <Widget>[
                    _buildDeviceStateTile(context, model),
                    _buildDeviceMetrics(context, model)
                  ]
              )
          );
        }
    );
  }

  _buildActionButtons(Bluetooth model) {
    if (model.isConnected) {
      return <Widget>[
         IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () => model.disconnect(),
        )
      ];
    }
  }

  _buildDeviceStateTile(BuildContext context, Bluetooth model) {
    return  ListTile(
        leading: (model.deviceState == BluetoothDeviceState.connected)
            ? const Icon(Icons.bluetooth_connected)
            : const Icon(Icons.bluetooth_disabled),
        title: new Text('Device is ${model.deviceState.toString().split('.')[1]}'),
    );
  }

  _buildDeviceMetrics(BuildContext context, Bluetooth model) {
    Column column =  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildMetric("Battery",  model.battery.toString() , "%", "battery"),
        _buildMetric("Heart rate", model.heartRate.toString() , "BPM", "heart_rate"),
        _buildMetric("Respiration rate", model.respirationRate.toString() , "Resp/min", "breathing_rate"),
        _buildMetric("Step count" ,model.stepCount.toString(), null??" ", "steps"),
        _buildMetric("Activity", model.activity.toString() , "G", "activity"),
        _buildMetric("Cadence", model.cadence.toString() , "Steps/min", "cadence")
      ],
    );
    return  column != null ? column :  Container();
  }

  _buildMetric(String name, String value, String unit, String image) {
    return  ListTile(
      leading:  Image.asset("assets/images/"+ image + ".png", height: 30),
      title: Text(name),
      subtitle: unit != null ? Text(unit) :const  Text(""),
      trailing: value != null ? Text(value) :const  Text(""),
    );
  }
}