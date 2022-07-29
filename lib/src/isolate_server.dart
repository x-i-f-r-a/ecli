import 'dart:io';

import 'package:args/command_runner.dart';

class IsolateServer extends Command{
  @override
  final name = 'isolate';

  @override
  final description = 'Run the server as cluster';

  @override
  void run(){
    buildapp(argResults?.arguments);
  }

  Future buildapp(no) async {
      ProcessResult results = await Process.run('dart', ['${Directory.current.path}/isolater.dart' ,'-i','$no']);
      print(results.stdout);
  }
}