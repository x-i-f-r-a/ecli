import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:args/command_runner.dart';

class GetV extends Command{
  @override
  final name = 'version';

  @override
  final description = 'Show the momentum framework current version';

  @override
  void run(){
    showV();
  }

  Future showV() async {
      final response = await http.get(Uri.parse('https://pub.dev/api/packages/Momentum'));
      if(response.statusCode == HttpStatus.notFound){
        print(response.body);
        exit(1);
      }
      final data = json.decode(response.body);
      var version = data['latest']['version'];
      print('Momentum v$version');
  }
}