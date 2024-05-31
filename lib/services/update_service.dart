import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:convert';

class UpdateService {
  final String versionCheckUrl = 'https://3ilab.fr/api/version';

  Future<bool> isUpdateAvailable() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final response = await http.get(Uri.parse(versionCheckUrl));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final String latestVersion = jsonResponse['latestVersion'];
        // Implémentez votre logique de comparaison de version ici
        final String currentVersion = packageInfo.version;
        return latestVersion != currentVersion;
      } else {
        // print("Erreur lors de la récupération de la version : ${response.statusCode}");
        return false;
      }
    } catch (e) {
      // print("Exception lors de la vérification de la version : $e");
      return false;
    }
  }
}
