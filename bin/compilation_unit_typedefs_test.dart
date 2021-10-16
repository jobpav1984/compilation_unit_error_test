import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:dart_style/dart_style.dart';

const input = '''
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const kHomeRouteName = '/home';

typedef HomeRoutePageBuilder = Widget Function(
    ValueNotifier<bool> progressController);

class TestApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _TestAppState extends State<TestApp> {
  ValueNotifier<bool>? progressController;

  @override
  void initState() {
    progressController = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    progressController?.dispose();
    progressController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Container();
  }
}

class MainPageArguments {
  final TabItem? startWith;

  MainPageArguments({this.startWith});
}
''';

void main(List<String> arguments) {
  final parseResult = parseString(content: input);
  final formattedInput = DartFormatter().format(parseResult.unit.toSource());
  print(formattedInput);
}
