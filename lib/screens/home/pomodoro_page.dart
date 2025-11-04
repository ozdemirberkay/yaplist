import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  Map<PomodoroMode, int> modes = {
    PomodoroMode.pomodoro: 25,
    PomodoroMode.shortBreak: 5,
    PomodoroMode.longBreak: 15,
  };

  int _minutoToSeconds(int minutes) => minutes * 60;

  final List<PomodoroMode> modesSequenceList = [
    PomodoroMode.pomodoro,
    PomodoroMode.shortBreak,
    PomodoroMode.pomodoro,
    PomodoroMode.shortBreak,
    PomodoroMode.pomodoro,
    PomodoroMode.shortBreak,
    PomodoroMode.pomodoro,
    PomodoroMode.longBreak,
  ];

  int _sequenceIndex = 0;
  PomodoroMode nextModeFromSequenceIndex(int index) {
    final nextIndex = (index + 1) % modesSequenceList.length;
    return modesSequenceList[nextIndex];
  }

  late int _secondsRemaining;
  late int _currentDurationSeconds;

  bool _isRunning = false;
  PomodoroMode _mode = PomodoroMode.pomodoro;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _sequenceIndex = 0;
    _mode = modesSequenceList[_sequenceIndex];
    _currentDurationSeconds = _minutoToSeconds(modes[_mode]!);
    _secondsRemaining = _currentDurationSeconds;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startPause() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() => _isRunning = false);
      return;
    }

    _startTimer();
  }

  void _startTimer() {
    setState(() => _isRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining <= 0) {
        _switchMode(autoStart: true);
        return;
      }
      setState(() => _secondsRemaining--);
    });
  }

  void _switchMode({bool autoStart = false}) {
    _timer?.cancel();
    setState(() {
      _sequenceIndex = (_sequenceIndex + 1) % modesSequenceList.length;
      _mode = modesSequenceList[_sequenceIndex];
      _currentDurationSeconds = _minutoToSeconds(modes[_mode]!);
      _secondsRemaining = _currentDurationSeconds;
      _isRunning = false;
    });

    if (autoStart) {
      Future.microtask(() => _startTimer());
    }
  }

  void _reset() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _currentDurationSeconds = _minutoToSeconds(modes[_mode]!);
      _secondsRemaining = _currentDurationSeconds;
    });
  }

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  double _progress() {
    if (_currentDurationSeconds == 0) return 0;
    return 1 - (_secondsRemaining / _currentDurationSeconds);
  }

  @override
  Widget build(BuildContext context) {
    final lowestSize =
        MediaQuery.sizeOf(context).width < MediaQuery.sizeOf(context).height
            ? MediaQuery.sizeOf(context).width
            : MediaQuery.sizeOf(context).height;
    return Layout(
      title: tr('focusMode'),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: lowestSize * 0.6,
                  height: lowestSize * 0.6,
                  child: CircularProgressIndicator(
                    value: _progress(),
                    strokeWidth: 10,
                    backgroundColor: Theme.of(context).primaryColor,
                    color: Colors.green,
                  ),
                ),
                Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    tr(_mode.name.toString()),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _formatTime(_secondsRemaining),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: _startPause,
                        icon: Icon(
                            _isRunning ? Icons.pause_circle : Icons.play_circle,
                            size: 30),
                      ),
                      IconButton(
                        onPressed: _reset,
                        icon: Icon(Icons.refresh, size: 30),
                      ),
                      IconButton(
                        onPressed: _switchMode,
                        icon: Icon(Icons.skip_next, size: 30),
                      ),
                    ],
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum PomodoroMode { pomodoro, shortBreak, longBreak }
