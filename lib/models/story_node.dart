class StoryContent {
  final String text;
  final String choice1;
  final String? choice2;

  const StoryContent({
    required this.text,
    required this.choice1,
    this.choice2,
  });

  factory StoryContent.fromMap(Map<String, dynamic> map) {
    return StoryContent(
      text: map['text'] as String,
      choice1: map['choice1'] as String,
      choice2: map['choice2'] as String?,
    );
  }

  bool get hasSecondChoice => choice2 != null;
}

class StoryNode {
  final String image;
  final String? music;
  final String? sfx;
  final int nextIndex1;
  final int? nextIndex2;
  final Map<String, StoryContent> _localized;

  const StoryNode({
    required this.image,
    this.music,
    this.sfx,
    required this.nextIndex1,
    this.nextIndex2,
    required Map<String, StoryContent> localized,
  }) : _localized = localized;

  factory StoryNode.fromMap(Map<String, dynamic> map) {
    final localized = <String, StoryContent>{};
    // Dynamically pick up any language key (non-system keys are language codes)
    const systemKeys = {'image', 'music', 'sfx', 'nextIndex1', 'nextIndex2'};
    for (final key in map.keys) {
      if (!systemKeys.contains(key) && map[key] is Map<String, dynamic>) {
        localized[key] = StoryContent.fromMap(map[key] as Map<String, dynamic>);
      }
    }

    return StoryNode(
      image: map['image'] as String,
      music: map['music'] as String?,
      sfx: map['sfx'] as String?,
      nextIndex1: map['nextIndex1'] as int,
      nextIndex2: map['nextIndex2'] as int?,
      localized: localized,
    );
  }

  StoryContent contentFor(String lang) => _localized[lang] ?? _localized['en']!;
}
