part of '../helpers.dart';

Future<void> launchUrlFromString(String urlTolaunch) async {
  final Uri url = Uri.parse(urlTolaunch);
  if (!await launchUrl(
    url, /* mode: LaunchMode.externalApplication */
  )) {
    throw Exception('Could not launch $url');
  }
}
