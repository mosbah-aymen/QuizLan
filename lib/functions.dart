import 'impots.dart';

void waiting(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()));
}
