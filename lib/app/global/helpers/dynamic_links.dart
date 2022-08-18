import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class CustomDynamicLinks {
  static Future<String> createDynamicLink(int id) async {
    final DynamicLinkParameters dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: 'https://adove.page.link',
      link: Uri.parse('https://adove.com/id=$id'),
      androidParameters: AndroidParameters(
        packageName: 'br.com.fedratecnologia.adove',
      ),
    );
    final dynamicUrl =
        await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);
    final shortUrl =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
    return shortUrl.previewLink.toString();
  }
}
