// Chapter 1: Uses numbers 100 to 1999

// A simple way to structure our story data. 
  // Each index corresponds to a piece of text and two choices.
  final Map<int, Map<String, dynamic>> chapter1 = {
    100: {
      "text": "The old rusty bus shut his doors and slowly, with a loud rattling, vanished behind the hill. Elara was alone on the edge of the road.",
      "image": "assets/images/red-bus.jpg", // Add your image path here!
      "choice1": "Look around",
      "nextIndex1": 101,
    },
    101: {
      "text": "In front of her Elara see a lovable cosy valley. A small village of a few old stone houses is sitting above a river running through the valley.",
      "image": "assets/images/valley_1.jpg", // And here!
      "choice1": "Walk to the vilage",
      "nextIndex1": 102,
      "choice2": "Check the bus",
      "nextIndex2": 100,
    },
    102: {
      "text": "Elara walks down the road heading to the small village. She immediately recognizes the calmness of this place, so different from the rush and noise of the city she left just a few hours ago. She walks into the village and after a few moments she stands in front of a little house.",
      "image": "assets/images/valley.jpg", // And here!
      "choice1": "Look at your new home",
      "nextIndex1": 103,
    },
    103: {
      "text": "It's him. The small old house left to you by your excentric aunt Bella. She spent here a big part of her life. It was a place she occasionaly left for her adventurous travels around the Europe.",
      "image": "assets/images/background.jpg", // And here!
      "choice1": "Walk to the vilage",
      "nextIndex1": 102,
      "choice2": "Check the bus",
      "nextIndex2": 100,
    },
  };