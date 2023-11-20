import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:flutter_homescreen/layout_size_helper.dart';
import 'package:flutter_homescreen/generated/applauncher.pb.dart';

// The Applications page.
class AppsPage extends StatefulWidget {
  final Future<List<AppInfo>> Function() getApps;
  final Function(String id) startApp;

  const AppsPage({Key? key, required this.getApps, required this.startApp})
      : super(key: key);

  @override
  _AppsPageState createState() => _AppsPageState();
}

class _AppsPageState extends State<AppsPage> {
  List<AppInfo> apps = [];

  @override
  initState() {
    widget.getApps().then((val) => setState(() {
          val.sort((a, b) => a.name.compareTo(b.name));
          apps = val;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeHelper = LayoutSizeHelper(context);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey.shade800, Colors.grey.shade900])),
      constraints: BoxConstraints.expand(),
      alignment: Alignment.center,
      child: Column(children: [
        SizedBox(height: 160.0),
        GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: apps.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return GridTile(
                  child: Container(
                      alignment: Alignment.center,
                      child: _AppsPageEntry(
                        id: apps[index].id,
                        label: apps[index].name,
                        iconPath: apps[index].iconPath,
                        appSelected: widget.startApp,
                      )));
            })
      ]),
    );
  }
}

// Each one of the items on the Home page.
class _AppsPageEntry extends StatefulWidget {
  final String id;
  final String label;
  final String iconPath;
  final void Function(String id) appSelected;

  const _AppsPageEntry(
      {Key? key,
      required this.id,
      required this.label,
      required this.iconPath,
      required this.appSelected})
      : super(key: key);

  @override
  _AppsPageEntryState createState() => _AppsPageEntryState();
}

class _AppsPageEntryState extends State<_AppsPageEntry> {
  late ScalableImage svgIcon;
  bool svgIconLoaded = false;
  final iconColor = const Color(0xff4ee6f5);

  @override
  void initState() {
    if (widget.iconPath.endsWith(".svg")) {
      readSvgIcon().then((val) => setState(() {
            svgIconLoaded = val;
          }));
    }
    super.initState();
  }

  Future<bool> readSvgIcon() async {
    if (widget.iconPath.endsWith(".svg")) {
      var iconFile = File(widget.iconPath);
      if (await iconFile.exists()) {
        svgIcon = await ScalableImage.fromSvgStream(
            iconFile.openRead().transform(utf8.decoder));
        return true;
      }
    }
    return false;
  }

  Widget buildIcon() {
    if (svgIconLoaded) {
      return GestureDetector(
          onTap: () {
            widget.appSelected(widget.id);
          },
          child: SizedBox.expand(child: ScalableImageWidget(si: svgIcon)));
    } else {
      return OutlinedButton(
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(8),
            side: BorderSide(width: 3, color: iconColor),
          ),
          onPressed: () {
            widget.appSelected(widget.id);
          },
          child: SizedBox(
              height: 160,
              width: 160,
              child: Center(
                  child: Text(widget.label.toUpperCase().substring(0, 1),
                      style: TextStyle(
                        fontSize: 100,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = iconColor,
                      )))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: [
            Expanded(child: buildIcon()),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                widget.label,
                style: DefaultTextStyle.of(context).style.copyWith(
                      fontSize: 28,
                      color: iconColor,
                    ),
              ),
            ),
          ],
        ));
  }
}
