// Chapter 1: Uses numbers 100 to 1999

// A simple way to structure our story data. 
  // Each index corresponds to a piece of text and two choices.
  final Map<int, Map<String, dynamic>> chapter1 = {
    100: {
      "text": "The old red bus wheezes as it climbs the final gear, its engine a rhythmic rattle that has been Elara's only company for three hours. It stops with a hiss of air brakes. Elara steps out, her boots hitting the gravel with a satisfying crunch. \n\n The bus disappears around the bend, its red paint a vanishing spark against the green. Silence rushes in to fill the void. Elara walks to the edge of the road, and there it is: The Golden Valley. It looks like a quilt of emerald and honey, draped over the earth. Far below, the terracotta roofs of the village huddle together like sleeping cats. The air up here is thin, cool, and smells of wild thyme.",
      "image": "assets/images/red-bus2.jpg",
      "choice1": "Close your eyes and breathe",
      "nextIndex1": 104,
      "choice2": "Take out a small, cracked camera",
      "nextIndex2": 105,
    },
    101: {
      "text": "Before moving, Elara stands still, letting the reality of her arrival sink in. From up here, the valley doesn't look like a place on a map; it looks like a living tapestry. \n\n The 'Golden Valley' earned its name well. The light hits the hills at such an angle that the wild grasses shimmer like silk, and the groves of olive trees look like puffs of silver smoke rising from the earth. She can see the winding 'white road' snaking its way down toward the village, disappearing between stone walls and reappearing near the central piazza.",
      "image": "assets/images/valley_2.jpg",
      "choice1": "Walk down to the village",
      "nextIndex1": 102,
    },
    102: {
      "text": "The village looks so small from this height—a handful of terracotta tiles and a single belfry huddled together for warmth. It’s hard to believe that within those tiny walls, coffee is being poured, laundry is being hung, and lives are moving at a pace she had forgotten existed. The air is so clear she can see the tiny, dark specks of birds circling the church tower. \n\n Everything is so quiet, so still, that for a moment she feels like she’s looking at a painting. But the scent of rosemary on the wind reminds her: this is real. And it's waiting for her.",
      "image": "assets/images/village.jpg",
      "choice1": "Enter the streets of the village",
      "nextIndex1": 106,
    },
    103: {
      "text": "It's him. The small old house left to you by your excentric aunt Bella. She spent here a big part of her life. It was a place she occasionaly left for her adventurous travels around the Europe.",
      "image": "assets/images/house.jpg",
      "choice1": "Walk to the vilage",
      "nextIndex1": 102,
      "choice2": "Check the bus",
      "nextIndex2": 100,
    },
    104: {
      "text": "Elara lets the suitcase handle slip from her hand, the soft thud absorbed by the tall grass. The view is too large to process, too different from the cramped subway walls of her old life. Slowly, she draws a breath, filling her lungs with the mountain air. \n\n It doesn’t just smell of wild thyme and sun-baked earth; it smells of distance. It smells like permission. The cool wind rushes past her, tangling the loose strands of her braid and carrying away the phantom scents of city exhaust and stale coffee. When she opens her eyes, the valley hasn't changed, but she has. Her shoulders have dropped an inch. She picks up her bag, feeling lighter than she has in months.",
      "image": "assets/images/breath_in.jpg",
      "choice1": "Look around",
      "nextIndex1": 101,
    },
    105: {
      "text": "Elara's instinct is to categorize, to capture, to find the perfect composition before the feeling can escape. She reaches into her satchel and pulls out the vintage, cracked analog camera she bought years ago at a flea market. It’s heavy, reliable, and has survived worse days than this. \n\n She holds the lens to her eye. Through the viewfinder, the overwhelming expanse of the valley becomes a manageable, perfect moment. Click. The shutter’s sharp, confident sound punctuates the silence. She advances the film, the mechanism whirring gently. She doesn't just see the valley now; she sees a photograph—a physical memory of the exact moment she chose to be happy. The camera is her anchor, and the valley is her new canvas.",
      "image": "assets/images/taking_picture.jpg",
      "choice1": "Look around",
      "nextIndex1": 101,
    },
    106: {
      "text": "The walk down the hill is a slow transition. The wind from the ridge dies down, replaced by the scent of baking bread and the distant, melodic chime of a church bell striking the hour—not with a sense of urgency, but like a heartbeat. \n\n The village of San Vido feels like a living thing. As Elara turns a corner, she finds herself in a small piazza. It’s empty of people, but full of life. A wooden crate of overripe lemons sits by a doorway with a sign that simply says 'Prendete' (Take some). \n\n Just as she passes the central fountain, she spots a small movement near a stack of empty wine crates. A very round, very fluffy calico cat is perched there, watching her with emerald eyes. It looks like it has lived here for twenty years and knows every secret the stones have to tell.",
      "image": "assets/images/piazza.jpg",
      "choice1": "Pick up the lemon",
      "nextIndex1": 107,
      "choice2": "Pet the cat",
      "nextIndex2": 108,
    },
  };