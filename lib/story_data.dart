import 'models/story_node.dart';
import 'chapter_1.dart';
import 'chapter_2.dart';
import 'chapter_3.dart';

final Map<int, Map<String, dynamic>> _rawStoryData = {
  0: {
    "image": "assets/images/title.jpg",
    "nextIndex1": 100,
    "en": {
      "text": "Welcome to Aura of Gold.",
      "choice1": "Begin Story",
    },
    "cs": {
      "text": "Vítejte v Aura of Gold.",
      "choice1": "Začít příběh",
    }
  },
  ...chapter1,
  ...chapter2,
  ...chapter3,
};

final Map<int, StoryNode> storyNodes = _rawStoryData.map(
  (key, value) => MapEntry(key, StoryNode.fromMap(value)),
);
