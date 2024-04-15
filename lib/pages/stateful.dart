import 'package:jaspr/jaspr.dart';

@client
class Stateful extends StatefulComponent {
  const Stateful();

  @override
  State createState() => _StatefulState();
}

class _StatefulState extends State<Stateful> {

  DummyChangeNotifier changeNotifier = DummyChangeNotifier();

  bool _initDone = false;

  @override
  void initState() {
    if(kIsWeb) {
      _init();
    }
    super.initState();
  }

  @override
  void dispose() {
    changeNotifier.removeListener(_handleChange);
    changeNotifier.dispose();
    super.dispose();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if(kIsWeb) {
      if (!_initDone) {
        yield div([text('Stateful Client waiting to init...')]);
      } else {
        yield div([text('Stateful Client message: ${changeNotifier.message}')]);
      }
    }
  }

  _init() async {
    changeNotifier.addListener(_handleChange);
    Future.delayed(Duration(seconds: 5), () {
      changeNotifier.changeState(message: 'If you can see this then all is good!');
      _initDone = true;
    });
  }



  _handleChange() {
    setState(() { });
  }
}

class DummyChangeNotifier with ChangeNotifier {
  String message = '';

  @override
  void changeState({String message = ''}) {
    this.message = message;
    notifyListeners();
  }
}

