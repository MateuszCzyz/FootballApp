import 'package:jiffy/jiffy.dart';

Map<String, String> calculateTimeOfArticle({String date}) {
  String formatedDate = Jiffy(date).format('d MMMM y H:mm');
  String timeSincePublished = Jiffy(date).fromNow().toString();
  return {'date': formatedDate, 'timeSincePublished': timeSincePublished};
}
