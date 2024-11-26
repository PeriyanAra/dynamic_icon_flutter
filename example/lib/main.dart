// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dynamic_icon_flutter/dynamic_icon_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final listAvailableIcon = <String>[
    "nozomi",
    "moonlight",
    "ipsc",
    "vanphuc",
    "hadopm",
    "default",
    "MainActivity"
  ];

  int batchIconNumber = 0;

  String currentIconName = "nozomi";

  bool loading = false;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // DynamicIconFlutter.getAlternateIconName().then((v) {
    //   setState(() {
    //     currentIconName = v ?? "nozomi`";
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Dynamic App Icon'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Current Icon Name: $currentIconName",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.ac_unit),
                label: const Text("Team Fortress"),
                onPressed: () async {
                  if (Platform.isAndroid) {
                    Future.delayed(Duration(seconds: 2), () async {
                      await DynamicIconFlutter.setIcon(
                        icon: listAvailableIcon[2],
                        listAvailableIcon: listAvailableIcon,
                      );
                    });
                  } else {
                    try {
                      if (await DynamicIconFlutter.supportsAlternateIcons) {
                        await DynamicIconFlutter.setAlternateIconName(
                            listAvailableIcon[2]);
                        print("App icon change successful");
                        return;
                      }
                    } on PlatformException {
                      if (await DynamicIconFlutter.supportsAlternateIcons) {
                        await DynamicIconFlutter.setAlternateIconName(null);
                        print("Change back to default app icon");
                        return;
                      } else {
                        print("Failed to change app icon");
                      }
                    }
                  }
                },
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.ac_unit),
                label: const Text("Photos"),
                onPressed: () async {
                  try {
                    if (await DynamicIconFlutter.supportsAlternateIcons) {
                      await DynamicIconFlutter.setAlternateIconName("photos");
                      _scaffoldKey.currentState?.hideCurrentSnackBar();
                      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                        content: Text("App icon change successful"),
                      ));
                      DynamicIconFlutter.getAlternateIconName().then((v) {
                        setState(() {
                          currentIconName = v ?? "`primary`";
                        });
                      });
                      return;
                    }
                  } on PlatformException {
                    _scaffoldKey.currentState?.hideCurrentSnackBar();
                    _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                      content: Text("Failed to change app icon"),
                    ));
                  }
                },
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.ac_unit),
                label: const Text("Chills"),
                onPressed: () async {
                  try {
                    if (await DynamicIconFlutter.supportsAlternateIcons) {
                      await DynamicIconFlutter.setAlternateIconName("chills");
                      _scaffoldKey.currentState?.hideCurrentSnackBar();
                      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                        content: Text("App icon change successful"),
                      ));
                      DynamicIconFlutter.getAlternateIconName().then((v) {
                        setState(() {
                          currentIconName = v ?? "`primary`";
                        });
                      });
                      return;
                    }
                  } on PlatformException {
                    _scaffoldKey.currentState?.hideCurrentSnackBar();
                    _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                      content: Text("Failed to change app icon"),
                    ));
                  }
                },
              ),
              const SizedBox(
                height: 28,
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.restore_outlined),
                label: const Text("Restore Icon"),
                onPressed: () async {
                  try {
                    if (await DynamicIconFlutter.supportsAlternateIcons) {
                      await DynamicIconFlutter.setAlternateIconName(null);
                      _scaffoldKey.currentState?.hideCurrentSnackBar();
                      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                        content: Text("App icon restore successful"),
                      ));
                      DynamicIconFlutter.getAlternateIconName().then((v) {
                        setState(() {
                          currentIconName = v ?? "`primary`";
                        });
                      });
                      return;
                    }
                  } on PlatformException {
                    _scaffoldKey.currentState?.hideCurrentSnackBar();
                    _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                      content: Text("Failed to change app icon"),
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
