import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:yaplist/widgets/bottom/task_picker_modal.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/card/task_card.dart';
import 'package:yaplist/widgets/layout/layout.dart';
import 'package:yaplist/models/task.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  Map<PomodoroMode, int> modes = {
    PomodoroMode.focusMode: 25,
    PomodoroMode.shortBreak: 5,
    PomodoroMode.longBreak: 15,
  };

  int _minutoToSeconds(int minutes) => minutes * 60;

  final List<PomodoroMode> modesSequenceList = [
    PomodoroMode.focusMode,
    PomodoroMode.shortBreak,
    PomodoroMode.focusMode,
    PomodoroMode.shortBreak,
    PomodoroMode.focusMode,
    PomodoroMode.shortBreak,
    PomodoroMode.focusMode,
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
  PomodoroMode _mode = PomodoroMode.focusMode;
  Timer? _timer;
  Task? _selectedTask;

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
    WakelockPlus.disable();
    super.dispose();
  }

  void _startPause() {
    if (_isRunning) {
      _timer?.cancel();
      WakelockPlus.disable();
      setState(() => _isRunning = false);
      return;
    }

    _startTimer();
  }

  void _startTimer() {
    WakelockPlus.enable();
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
      title: tr(_mode.name.toString()),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: lowestSize * 0.6,
                    height: lowestSize * 0.6,
                    child: CircularProgressIndicator(
                      value: _progress(),
                      strokeWidth: 20,
                      backgroundColor:
                          Theme.of(context).primaryColor.withAlpha(200),
                      color: Colors.green,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _formatTime(_secondsRemaining),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 36),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: _reset,
                            icon: Icon(Icons.refresh, size: 30),
                          ),
                          IconButton(
                            onPressed: _startPause,
                            icon: Icon(
                                _isRunning ? Icons.pause : Icons.play_arrow,
                                size: 30),
                          ),
                          IconButton(
                            onPressed: _switchMode,
                            icon: Icon(Icons.skip_next, size: 30),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        child: _selectedTask != null
                            ? TaskCard(
                                task: _selectedTask!,
                                disableTaskOperations: true,
                              )
                            : MasterButton(
                                label: tr("selectGoal"),
                                onPressed: () {
                                  TaskPickerModal.show(
                                      context: context,
                                      onTaskSelected: (task) {
                                        setState(() {
                                          _selectedTask = task;
                                        });
                                      });
                                },
                                icon: Icons.checklist,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum PomodoroMode { focusMode, shortBreak, longBreak }
