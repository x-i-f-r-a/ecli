import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

class CreateProj extends Command{
  @override
  final name = 'create';

  @override
  final description = 'Create a new web app project using Momentum framework';

  @override
  void run(){
    createFiles(argResults?.arguments[0]);
  }

  FutureOr createFiles(projectName) async{

  var indexHtml = 
"""
<!DOCTYPE html>
<html lang="en">
<head>
<title>#title</title>
<style>
    body {
        margin: 0;
    }
    
    svg {
        width: 100%;
    }
    .center {
        display: block;
        margin-left: auto;
        margin-right: auto;
        width: 50%;
    }
    center, a {
        color: #2bbaff;
    }

</style>
</head>
<body>
    <svg viewbox="0 0 1440 320" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <style type="text/css">
            .wave {
              animation: wave 8s linear infinite;
            }
      
            .wave1 {
              animation: wave1 10s linear infinite;
            }
      
            .wave2 {
              animation: wave2 12s linear infinite;
            }
      
            @keyframes wave {
              0% {
                transform: translateX(0%);
              }
      
              100% {
                transform: translateX(100%);
              }
            }
      
            @keyframes wave1 {
              0% {
                transform: scaleY(1.2) translateX(0%);
              }
      
              100% {
                transform: scaleY(1.2) translateX(100%);
              }
            }
      
            @keyframes wave2 {
              0% {
                transform: scaleY(.8) translateX(0%);
              }
      
              100% {
                transform: scaleY(.8) translateX(100%);
              }
            }
          </style>
          <path id='sineWave' fill="#0099ff" fill-opacity="0.2" d="M0,160 C320,300,420,300,740,160 C1060,20,1120,20,1440,160 V0 H0" />
        </defs>
        <use class="wave" href="#sineWave" />
        <use class="wave" x="-100%" href="#sineWave" />
        <use class="wave1" href="#sineWave" />
        <use class="wave1" x="-100%" href="#sineWave" />
        <use class="wave2" href="#sineWave" />
        <use class="wave2" x="-100%" href="#sineWave" />
      </svg>
      <br>
      <img src="data:image/png;base64,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GNDJ0dauXYt//OMfCAQCMbPGoy1fvhydnZ2aNcMff/xxfP7znzdM+1qRn5+PqqoqvPzyyzHPR9aU33XXXcJtDgwMxKTSr7/+emzevDnmmEAggN/97neaY+bJUldXh7/97W+YMmVKwmsulwtZWVl45ZVXErIc9913Hx588MGEYYKnn34aX/rSl0YeL1y4EE888URC24899hhuv/12ZGZmJumdEH26MeVOjrZ+/XpUVlYmBLp4v/3tb/GTn/wEf//731FZWYn+/n40NDTg+uuvT1jmJuuBBx7AL37xC9x1112oqalBb28vdu3ahbvuugvz588Xbm/lypW47777sGLFCtx4442orKxETU0N1q9fj9raWvT19aG5uRkPPPAAHnzwwaS8By2LFy/GF7/4Rd3lbbW1tdi0aRMKCgpinq+rq8P58+fx9a9/HbW1tUhLS0NjYyNqamrwla98ZeS4/Px8rF69GrfddhuWL1+OoaEhNDQ04DOf+UzSfjdEY4ErzEWaRJYFg0Hs378fWVlZI4VNkm1oaAjNzc0YP3485syZYzjpzEx3dzcURRmZQAYAfX19aGlpQUFBge68gE8TRVHQ2tqK4eFhlJSUaE7YA9TfTUtLCzweD0pKSqTW3xONZf8PAAD//+3WgQwAAACAMH/rPNovUYIOAAMWFgAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGBB0ABgQdAAYEHQAGAlIqNjEZbzoeAAAAAElFTkSuQmCC" class="center" height="300px" width="300px">
      <center>
          Momentum is up and running!!
      </center>
      <br>
      <footer>
        <center>
          <a href="https://momentum.fraternitygroup.co.in/">Docs</a>
        </center>
      </footer>
</body>
</html>
<! Thanks to https://codepen.io/pushkar8723 for the wave ––>







""";
  var content = 
"""
import 'app/myApp.dart';

void main() async {


  final app = App();

  app.main();
}

  """;

var app = 
'''
// Using 'server' in app.runServer() is not mandatory. 
// But you have to add 'server' in app.runServer() if you are clustering your app using isolator.


import 'package:momentum_web/momentum_web.dart';
import '../Controllers/Home.dart';

class App{
  void main({server}) async {

  var app = Momentum();

  app.GET('/', RootController().Home);

  // Kindly remove below 'server' from app.runServer() if you are not clustering app into multiple isolates.

  await app.runServer(server: server);
}
}
''';
  var homeController = 
"""
import 'dart:async';
import 'package:momentum_web/momentum_web.dart';


class RootController{


  FutureOr Home(Request req, Response res) async {

    res.Template('index.html', {'title': 'My Momentum App'});
    
  }
}


  
  """;


  var dockerfile = '''

FROM google/dart

WORKDIR  ${Directory.current.path}
COPY bin .
COPY pubspec.yaml .

RUN pub get
ADD . /app
RUN pub get --offline

CMD []
ENTRYPOINT ["/usr/bin/dart", "main.dart"]
  
  ''';

  var pubspecyaml = 

  """
name: $projectName
description: A simple high performance Momentum web application.
version: 1.0.0
homepage: https://www.$projectName.com

environment:
  sdk: '>=2.17.5 <3.0.0'

dependencies:
  path: ^1.8.0
  args: ^2.3.1
  momentum_web: any

  
  """;



var isolator = 
"""
// Do not delete this generated file.
// This code is generated for the clustering of your app using isolates.

import 'dart:io';
import 'package:args/args.dart';
import 'dart:isolate';
import 'app/myApp.dart';

void main(List<String> args){

    var parser = new ArgParser()
      ..addOption('address', abbr: 'a', defaultsTo: '127.0.0.1')
      ..addOption('port', abbr: 'p', defaultsTo: '4545')
      ..addOption('isolate', abbr: 'i', defaultsTo: '2');
    var arguments = parser.parse(args);

    _startMomenter(List args)async{
      var server = await HttpServer.bind(arguments['address'],  int.parse(arguments['port']), shared: true);
      final app = App();
      app.main(server: server);
   }

    var nbOfIsolates = int.parse(arguments['isolate']);
    for (int i = 0; i < nbOfIsolates; i++) {
      Isolate.spawn(_startMomenter, [i]);
    }

    print('Print CTRL-C to shutdown!');
    stdin.readByteSync();


}



""";

  File('${Directory.current.path}/$projectName/main.dart').create(recursive: true).then((value) {
    File file = value;
    file.writeAsString(content);
    print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/app/main.dart created');
  }).then((value) {
    File('${Directory.current.path}/$projectName/Controllers/Home.dart').create(recursive: true).then((value) {
      File file = value;
      file.writeAsString(homeController);
      print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/Controllers/Home.dart created!');
    }).then((value) {
      File('${Directory.current.path}/$projectName/docker/Dockerfile').create(recursive: true).then((value) {
        File file = value;
        file.writeAsString(dockerfile);
        print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/docker/Dockerfile created!');
    }).then((value) {
      File('${Directory.current.path}/$projectName/isolator.dart').create(recursive: true).then((value) {
        File file = value;
        file.writeAsString(isolator);
        print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/isolator.dart created!');
    }).then((value) {
      File('${Directory.current.path}/$projectName/templates/index.html').create(recursive: true).then((value) {
      File file = value;
      file.writeAsString(indexHtml);
      print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/templates/index.html created!');
       
    }).then((value) {
      File('${Directory.current.path}/$projectName/pubspec.yaml').create(recursive: true).then((value) {
        File file = value;
        file.writeAsString(pubspecyaml);
        print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/pubspec.yaml created!');
      
      
      }).then((value) {
        File('${Directory.current.path}/$projectName/app/$projectName.dart').create(recursive: true).then((value) {
        File file = value;
        file.writeAsString(app);
        print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/app/$projectName.dart created!');
      
      
      }).then((value) {
        print('\x1B[34m[ * ]\x1B[0m Project created!');
        print('\n\n\x1B[34m[ * ]\x1B[0m    cd $projectName');
        print('\n\n\x1B[34m[ * ]\x1B[0m    moment dev\n\n');
      });
      });
    });
    });
     
    });
    });
  });
}

}

