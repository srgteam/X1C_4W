import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:flutter_homescreen/volume_slider.dart';

final StackIndexProvider = StateProvider<int>((ref) => 0);

class BottomPanelWidget extends ConsumerStatefulWidget {
  final double height;
  final Color? color;

  BottomPanelWidget({Key? key, required this.height, required this.color})
      : super(key: key);

  @override
  _BottomPanelWidgetState createState() => _BottomPanelWidgetState();
}

class _BottomPanelWidgetState extends ConsumerState<BottomPanelWidget> {
  final iconColor = const Color(0xff4ee6f5);
  late RestartableTimer timer;

  initState() {
    super.initState();
    timer = new RestartableTimer(Duration(seconds: 3), _timerExpired);
  }

  void _timerExpired() {
    ref.read(StackIndexProvider.notifier).state = 0;
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final int index = ref.watch(StackIndexProvider);

    void handleLogoTap() {
      ref.read(StackIndexProvider.notifier).state = 1;
      timer.reset();
    }

    return SizedBox(
        height: widget.height,
        child: IndexedStack(index: index, children: <Widget>[
          GestureDetector(
            child: Container(
                color: widget.color,
                child: Align(
                    alignment: Alignment.center,
                    child: ScalableImageWidget.fromSISource(
                        si: ScalableImageSource.fromSvg(
                            rootBundle, 'images/Utility_Logo_Grey-01.svg')))),
            onTap: () => handleLogoTap(),
          ),
          Container(
              color: widget.color,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                  child: Stack(children: [
                    Column(children: [
                      Center(
                          child: Text("Volume",
                              style: TextStyle(
                                  fontSize: 32, color: Colors.white))),
                      Spacer()
                    ]),
                    Row(children: [
                      Container(width: 24),
                      Text("0 %",
                          style: TextStyle(fontSize: 32, color: Colors.white)),
                      Expanded(
                          child: VolumeSlider(
                              thumbColor: Colors.white,
                              activeColor: iconColor,
                              inactiveColor: Colors.grey.shade600,
                              activityTimer: timer)),
                      Text("100 %",
                          style: TextStyle(fontSize: 32, color: Colors.white)),
                      Container(width: 24)
                    ]),
                  ])))
        ]));
  }
}
