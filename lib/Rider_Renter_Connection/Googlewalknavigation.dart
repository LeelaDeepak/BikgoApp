import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googlemapurl =
        'google.navigation:q=$latitude, $longitude&key=$mapKey';

    if (await canLaunchUrl(Uri.parse(googlemapurl))) {
      await launchUrl(Uri.parse(googlemapurl));
      print("Its Working");
    } else {
      print("Not Working");
    }
  }
}
