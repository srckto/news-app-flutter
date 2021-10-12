import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static openUrl(String url) async {
    if (await canLaunch(url))
      await launch(
        url,
        // forceSafariVC: true,
        // forceWebView: true,
        // enableJavaScript: true,
      );
    else
      throw "Could not launch $url";
  }
}
