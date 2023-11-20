import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_homescreen/config.dart';
import 'package:grpc/grpc.dart';
import 'package:flutter_homescreen/generated/applauncher.pbgrpc.dart';
import 'package:flutter_homescreen/page_apps.dart';
import 'package:flutter_homescreen/widget_clock.dart';
import 'package:flutter_homescreen/bottom_panel.dart';

enum PageIndex { home, dashboard, hvac, media }

class Homescreen extends StatefulWidget {
  Homescreen({Key? key, required this.client}) : super(key: key);
  final HttpClient client;

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  int _previousIndex = 0;

  late ClientChannel channel;
  late AppLauncherClient stub;
  List<String> apps_stack = [];
  static const agl_shell_channel = MethodChannel('flutter/agl_shell');

  Future<List<AppInfo>> getAppList() async {
    var response = await stub.listApplications(ListRequest());
    for (AppInfo info in response.apps) {
      debugPrint("Got app:");
      debugPrint("$info");
    }
    return response.apps;
  }

  addAppToStack(String id) {
    if (!apps_stack.contains(id)) {
      apps_stack.add(id);
    } else {
      int current_pos = apps_stack.indexOf(id);
      if (current_pos != (apps_stack.length - 1)) {
        apps_stack.removeAt(current_pos);
        apps_stack.add(id);
      }
    }
  }

  activateApp(String id) async {
    try {
      agl_shell_channel
          .invokeMethod('activate_app', {'app_id': id, 'index': 0});
    } catch (e) {
      print('Could not invoke flutter/agl_shell/activate_app: $e');
    }
    addAppToStack(id);
  }

  deactivateApp(String id) async {
    if (apps_stack.contains(id)) {
      apps_stack.remove(id);
      if (apps_stack.isNotEmpty) {
        activateApp(apps_stack.last);
      }
    }
  }

  handleAppStatusEvents() async {
    try {
      var response = stub.getStatusEvents(StatusRequest());
      await for (var event in response) {
        if (event.hasApp()) {
          AppStatus app_status = event.app;
          debugPrint("Got app status:");
          debugPrint("$app_status");
          if (app_status.hasId() && app_status.hasStatus()) {
            if (app_status.status == "started") {
              activateApp(app_status.id);
            } else if (app_status.status == "terminated") {
              deactivateApp(app_status.id);
            }
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  initState() {
    debugPrint("_HomescreenState.initState!");
    channel = ClientChannel('localhost',
        port: 50052,
        options: ChannelOptions(credentials: ChannelCredentials.insecure()));

    stub = AppLauncherClient(channel);

    handleAppStatusEvents();

    super.initState();
  }

  void startApp(String id) async {
    await stub.startApplication(StartRequest(id: id));
  }

  setNavigationIndex(int index) {
    switch (PageIndex.values[index]) {
      case PageIndex.dashboard:
        startApp("dashboard_app");
        return;
      case PageIndex.hvac:
        startApp("flutter_hvac");
        return;
      case PageIndex.media:
        startApp("mediaplayer");
        return;
      default:
        setState(() {
          _previousIndex = _selectedIndex;
          _selectedIndex = index;
        });
        activateApp("homescreen");
    }
  }

  Widget _childForIndex(int selectedIndex) {
    switch (PageIndex.values[selectedIndex]) {
      case PageIndex.home:
        return AppsPage(
            key: ValueKey(selectedIndex),
            getApps: getAppList,
            startApp: startApp);
      default:
        return Text('Undefined');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: LayoutBuilder(
      builder: _buildLayout,
    )));
  }

  Widget _buildLayout(BuildContext context, BoxConstraints constraints) {
    var railSize = 160.0;
    var iconSize = railSize / 2;
    var foregroundColor = Theme.of(context)
        .navigationBarTheme
        .iconTheme!
        .resolve({MaterialState.pressed})!.color!;

    return Scaffold(
      body: Column(
        children: <Widget>[
          IntrinsicHeight(
            child: Row(children: <Widget>[
              Theme(
                data: Theme.of(context).copyWith(
                  // Disable indicator (for now?)
                  navigationBarTheme: NavigationBarTheme.of(context)
                      .copyWith(indicatorColor: Colors.transparent),
                  // Disable splash animations
                  splashFactory: NoSplash.splashFactory,
                  hoverColor: Colors.transparent,
                ),
                child: Expanded(
                  child: NavigationBar(
                      onDestinationSelected: (int index) {
                        setState(() {
                          setNavigationIndex(index);
                        });
                      },
                      selectedIndex: _selectedIndex,
                      height: railSize,
                      animationDuration: Duration(seconds: 0),
                      destinations: <Widget>[
                        NavigationDestination(
                          icon: Icon(Icons.home, size: iconSize),
                          label: 'Home',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.drive_eta, size: iconSize),
                          label: 'Dashboard',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.thermostat, size: iconSize),
                          label: 'HVAC',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.music_note, size: iconSize),
                          label: 'Media',
                        ),
                      ]),
                ),
              ),
              SizedBox(
                  width: 128,
                  child: Container(
                      color: NavigationBarTheme.of(context).backgroundColor)),
              Container(
                  color: NavigationBarTheme.of(context).backgroundColor,
                  child: VerticalDivider(
                      width: 32,
                      thickness: 1,
                      color: foregroundColor,
                      indent: railSize / 16,
                      endIndent: railSize / 16)),
              Container(
                  color: NavigationBarTheme.of(context).backgroundColor,
                  child:
                      ClockWidget(textColor: foregroundColor, size: railSize)),
              Container(
                  color: NavigationBarTheme.of(context).backgroundColor,
                  child: VerticalDivider(
                      width: 32,
                      thickness: 1,
                      color: foregroundColor,
                      indent: railSize / 16,
                      endIndent: railSize / 16)),
              Container(
                  color: NavigationBarTheme.of(context).backgroundColor,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.bluetooth, color: foregroundColor, size: 32),
                        Icon(Icons.wifi, color: foregroundColor, size: 32),
                        Icon(Icons.signal_cellular_4_bar,
                            color: foregroundColor, size: 32),
                      ])),
              SizedBox(
                  width: 16,
                  child: Container(
                      color: Theme.of(context)
                          .navigationBarTheme
                          .backgroundColor)),
            ]),
          ),
          // This is the main content.
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              reverseDuration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              transitionBuilder: (Widget child, Animation<double> animation) {
                if (child.key != ValueKey(_selectedIndex)) {
                  return FadeTransition(
                    opacity:
                        Tween<double>(begin: 1.0, end: 1.0).animate(animation),
                    child: child,
                  );
                }
                Offset beginOffset = new Offset(
                    0.0, (_selectedIndex > _previousIndex ? 1.0 : -1.0));
                return SlideTransition(
                  position: Tween<Offset>(begin: beginOffset, end: Offset.zero)
                      .animate(animation),
                  child: FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Interval(0.5, 1.0),
                      ),
                    ),
                    child: child,
                  ),
                );
              },
              child: _childForIndex(_selectedIndex),
            ),
          ),
          Stack(children: [
            BottomPanelWidget(
                height: railSize,
                color: NavigationBarTheme.of(context).backgroundColor),
            Align(
                alignment: Alignment.bottomLeft,
                child: GetConfig(client: widget.client))
          ]),
        ],
      ),
    );
  }
}
