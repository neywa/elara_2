// story_data.dart
import 'chapter_1.dart';
import 'chapter_2.dart';
import 'chapter_3.dart';

// The "..." is called the spread operator. 
// It unpacks all the scenes from your chapter files and pours them into this one master map!
final Map<int, Map<String, dynamic>> storyData = {
  
  // Your starting node, now with multi-language support!
  0: {
    // --- 1. UNIVERSAL DATA ---
    "image": "assets/images/title.jpg",
    "nextIndex1": 100, // Jumps to the first node in Chapter 1!

    // --- 2. ENGLISH (en) ---
    "en": {
      "text": "Welcome to Aura of Gold.",
      "choice1": "Begin Story",
    },

    // --- 3. CZECH (cs) ---
    "cs": {
      "text": "Vítejte v Aura of Gold.", 
      "choice1": "Začít příběh",
    }
  },
  
  // Plugs in all your chapter files
  ...chapter1,
  ...chapter2,
  ...chapter3,
};