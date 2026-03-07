// Chapter 1: Uses numbers 100 to 1999

// A simple way to structure our story data. 
  // Each index corresponds to a piece of text and two choices.
  final Map<int, Map<String, dynamic>> chapter1 = {
    100: {
      "text": "The old red bus wheezes as it climbs the final gear, its engine a rhythmic rattle that has been Elara's only company for three hours. It stops with a hiss of air brakes. Elara steps out, her boots hitting the gravel with a satisfying crunch. \n\n The bus disappears around the bend, its red paint a vanishing spark against the green. Silence rushes in to fill the void. Elara walks to the edge of the road, and there it is: The Golden Valley. It looks like a quilt of emerald and honey, draped over the earth. Far below, the terracotta roofs of the village huddle together like sleeping cats. The air up here is thin, cool, and smells of wild thyme.",
      "image": "assets/images/red-bus2.jpg", // Add your image path here!
      "choice1": "Close your eyes and breathe",
      "nextIndex1": 104,
      "choice2": "Take out a small, cracked camera",
      "nextIndex2": 105,
    },
    101: {
      "text": "In front of her Elara see a lovable cosy valley. A small village of a few old stone houses is sitting above a river running through the valley.",
      "image": "assets/images/valley_2.jpg", // And here!
      "choice1": "Walk to the vilage",
      "nextIndex1": 102,
      "choice2": "Check the bus",
      "nextIndex2": 100,
    },
    102: {
      "text": "Elara walks down the road heading to the small village. She immediately recognizes the calmness of this place, so different from the rush and noise of the city she left just a few hours ago. She walks into the village and after a few moments she stands in front of a little house.",
      "image": "assets/images/village.jpg", // And here!
      "choice1": "Look at your new home",
      "nextIndex1": 103,
    },
    103: {
      "text": "It's him. The small old house left to you by your excentric aunt Bella. She spent here a big part of her life. It was a place she occasionaly left for her adventurous travels around the Europe.",
      "image": "assets/images/house.jpg", // And here!
      "choice1": "Walk to the vilage",
      "nextIndex1": 102,
      "choice2": "Check the bus",
      "nextIndex2": 100,
    },
    104: {
      "text": "Elara lets the suitcase handle slip from her hand, the soft thud absorbed by the tall grass. The view is too large to process, too different from the cramped subway walls of her old life. Slowly, she draws a breath, filling her lungs with the mountain air. \n\n It doesn’t just smell of wild thyme and sun-baked earth; it smells of distance. It smells like permission. The cool wind rushes past her, tangling the loose strands of her braid and carrying away the phantom scents of city exhaust and stale coffee. When she opens her eyes, the valley hasn't changed, but she has. Her shoulders have dropped an inch. She picks up her bag, feeling lighter than she has in months.",
      "image": "assets/images/breath_in.jpg", // And here!
      "choice1": "Look around",
      "nextIndex1": 101,
    },
    105: {
      "text": "Elara’s instinct is to categorize, to capture, to find the "perfect" composition before the feeling can escape. She reaches into her satchel and pulls out the vintage, cracked analog camera she bought years ago at a flea market. It’s heavy, reliable, and has survived worse days than this. \n\n She holds the lens to her eye. Through the viewfinder, the overwhelming expanse of the valley becomes a manageable, perfect moment. Click. The shutter’s sharp, confident sound punctuates the silence. She advances the film, the mechanism whirring gently. She doesn't just see the valley now; she sees a photograph—a physical memory of the exact moment she chose to be happy. The camera is her anchor, and the valley is her new canvas.",
      "image": "assets/images/taking_picture.jpg", // And here!
      "choice1": "Look around",
      "nextIndex1": 101,
    },
  };