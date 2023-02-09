import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class Permissions extends StatefulWidget {
  const Permissions({Key? key}) : super(key: key);

  @override
  State<Permissions> createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  var title = "Permissions";

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0
      ),
      body: ListView(
          children: Permission.values
              .where((permission) {
            bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
            if (isIOS) {
              return permission != Permission.unknown &&
                  permission != Permission.sms &&
                  permission != Permission.storage &&
                  permission != Permission.ignoreBatteryOptimizations &&
                  permission != Permission.accessMediaLocation &&
                  permission != Permission.activityRecognition &&
                  permission != Permission.manageExternalStorage &&
                  permission != Permission.systemAlertWindow &&
                  permission != Permission.requestInstallPackages &&
                  permission != Permission.accessNotificationPolicy &&
                  permission != Permission.bluetoothScan &&
                  permission != Permission.bluetoothAdvertise &&
                  permission != Permission.bluetoothConnect;
            } else {
              return permission != Permission.unknown &&
                  permission != Permission.mediaLibrary &&
                  permission != Permission.photos &&
                  permission != Permission.photosAddOnly &&
                  permission != Permission.reminders &&
                  permission != Permission.appTrackingTransparency &&
                  permission != Permission.criticalAlerts;
            }
          })
              .map((permission) => PermissionWidget(permission))
              .toList()),

    );
  }
}




/// Permission widget containing information about the passed [Permission]
class PermissionWidget extends StatefulWidget {
  /// Constructs a [PermissionWidget] for the supplied [Permission]
  const PermissionWidget(this._permission);

  final Permission _permission;

  @override
  _PermissionState createState() => _PermissionState(_permission);
}

class _PermissionState extends State<PermissionWidget> {
  _PermissionState(this._permission);

  final Permission _permission;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();

    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  Color getPermissionColor() {
    switch (_permissionStatus) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      case PermissionStatus.limited:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _permission.toString(),
        style: TextStyle(
          color: Colors.white
        ),
      ),
      subtitle: Text(
        _permissionStatus.toString(),
        style: TextStyle(color: getPermissionColor()),
      ),
      trailing: (_permission is PermissionWithService)
          ? IconButton(
          icon: const Icon(
            Icons.info,
            color: Colors.white,
          ),
          onPressed: () {
            checkServiceStatus(
                context, _permission as PermissionWithService);
          })
          : null,
      onTap: () {
        requestPermission(_permission);
      },
    );
  }

  void checkServiceStatus(
      BuildContext context, PermissionWithService permission) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text((await permission.serviceStatus).toString()),
    ));
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
    });
  }
}
