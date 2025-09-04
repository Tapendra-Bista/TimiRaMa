enum StoryItemType {
  image,
  video,
}

class StoryItem {
  final String url;
  final StoryItemType type;
  final int duration; // in seconds
  final String? caption;

  const StoryItem({
    required this.url,
    required this.type,
    this.duration = 5,
    this.caption,
  });
}