import 'package:junior/model/novel.dart';

// all changes to the novel data remain here while not saved.
// it's a separate file cause it's spread over a lot of widgets so this
// is easier to manage.

class NovelData {
  static Novel novel;
  static bool isChanged;
}
