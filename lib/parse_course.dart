import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'video.dart';

void main() {
  _parseCourses();
}

void _parseCourses() async {
  const url = 'https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/';
  const courseElementsClassName = 'section--previewable-item--3C8nb udlite-block-list-item udlite-block-list-item-small udlite-block-list-item-link udlite-text-sm';

  final response = await http.Client().get(Uri.parse(url));
  var courseList = <Video>[];

  if (response.statusCode == 200) {
    var document = parse(response.body);
    var courseElements = document.getElementsByClassName(courseElementsClassName);

    courseElements.forEach((element) {
      var name = element.children[1].children[0].children[0].text;
      var duration = element.children[1].children[3].text;
      courseList.add(Video(name, duration));
    });

    courseList.sort((a, b) => int.parse(a.duration.replaceAll(':', '')).compareTo(int.parse(b.duration.replaceAll(':', ''))));
    courseList.forEach((element) {
      print(element);
    });
  }
}
