import 'dart:io';

main()async {
  var result = await Process.run('dart', ['pub','get']);
  stdout.write(result.stdout);
  stdout.write(result.stderr);
}