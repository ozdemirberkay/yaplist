import 'dart:math';

class DatabaseHelper {
  String generateUniqueId() {
    final random = Random();
    final uniqueId = DateTime.now().millisecondsSinceEpoch.toString() +
        random.nextInt(999999).toString();
    return uniqueId;
  }
}
