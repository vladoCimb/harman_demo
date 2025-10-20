import 'package:harman_demo/app/app.dart';
import 'package:harman_demo/main/bootstrap/bootstrap.dart';

void main() async {
  bootstrap(() async {
    return const App();
  });
}
