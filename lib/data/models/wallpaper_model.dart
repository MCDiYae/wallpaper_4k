class Wallpaper {
  int id;
  String imageUrl;
  Src src;

  Wallpaper({
    required this.id,
    required this.imageUrl,
    required this.src,
  });

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      id: json['id'],
      imageUrl: json['url'],
      src: Src.fromJson(json['src']),
    );
  }
}

class Src {
  String original;
  String portrait;

  Src({
    required this.original,
    required this.portrait,
  });

  factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"],
        portrait: json["portrait"],
      );
}
