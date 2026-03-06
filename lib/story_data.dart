// story_data.dart
import 'chapter_1.dart';
import 'chapter_2.dart';
import 'chapter_3.dart';

// The "..." is called the spread operator. 
// It unpacks all the scenes from your chapter files and pours them into this one master map!
final Map<int, Map<String, dynamic>> storyData = {
  // Your starting node can live right here
  0: {
    "text": "Welcome to Aura of Gold.",
    "image": "assets/images/title.jpg",
    "choice1": "Begin Story",
    "nextIndex1": 100, // Jumps to the first node in Chapter 1!
  },
  
  // Plugs in all your chapter files
  ...chapter1,
  ...chapter2,
  ...chapter3,
};