import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';

import 'extensions.dart';

FutureOr repository(List<String> args) async {
  List<String> names = args.sublist(1);

  if (names.isEmpty) {
    return;
  }

  String directory = absolute('lib/repository');
  Directory dir = Directory(directory);

  if (!dir.existsSync()) {
    dir.createSync();
  }

  RegExp alpha = RegExp(r'^[a-zA-Z]+$');

  for (String name in names) {
    if (alpha.hasMatch(name)) {
      _createRepository(name.toLowerCase(), directory);
    }
  }
}

FutureOr _createRepository(String name, String directory) async {
  String filename = '${name}_repository.dart';
  String className = '${name.inCaps}Repository';

  File file = File('$directory/$filename');

  if (!file.existsSync()) {
    file.createSync();
    file.writeAsStringSync('''
import 'package:oryn/oryn.dart';

class $className extends Repository {
  $className(App app) : super(app);
}''');

    print('''
Your $className is ready at ${separator}lib${separator}repository$separator$filename
    ''');
  }
}
