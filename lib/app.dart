import 'package:jaspr/jaspr.dart';
import 'package:jaspr_0_11_1_test/pages/stateful.dart';
import 'package:jaspr_router/jaspr_router.dart';

// A simple [StatelessComponent] with a [build] method.
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    // Without a div() outside Router, Stateful page throws Error
    yield Router(routes: [
      Route(
          path: '/',
          title: 'Home',
          builder: (context, state) => const Stateful()),
    ]);

    // With a div() outside Router, Stateful page works okay
    // yield div([
    //   Router(routes: [
    //     Route(
    //         path: '/',
    //         title: 'Home',
    //         builder: (context, state) => const Stateful()),
    //   ]),
    // ]);
  }
}
