import 'dart:io';
import 'dart:convert';

/// run selected file
Future<Process> runCmd(String file) async {
  print('\n\x1B[34m[  watchdog  ]\x1B[0m started running ');
  print('\n\x1B[34m[  watchdog  ]\x1B[0m watching $file ');
  Process process = await Process.start('dart', [file]);
  print('\n\x1B[34m[  watchdog  ]\x1B[0m started process - ${ process.pid.toString()}');
  print('\n\x1B[34m[  watchdog  ]\x1B[0m sys output  =>');
  process.stdout.transform(utf8.decoder).listen(print);
  process.stderr.transform(utf8.decoder).listen(print);
  return process;
}
