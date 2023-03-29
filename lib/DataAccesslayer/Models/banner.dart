class Banner {
  final int id;
  final String type;
  final String? staticImage;
  final String? backgroundColor;
  final String? dynamicImage;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final String? buttonUrl;

  Banner({
    required this.id,
    required this.type,
    this.staticImage,
    this.backgroundColor,
    this.dynamicImage,
    this.title,
    this.subtitle,
    this.buttonText,
    this.buttonUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'static_image': staticImage,
      'background_color': backgroundColor,
      'dynamic_image': dynamicImage,
      'title': title,
      'subtitle': subtitle,
      'button_text': buttonText,
      'button_url': buttonUrl,
    };
  }

  factory Banner.fromMap(Map<String, dynamic> map) {
    return Banner(
      id: map['id'],
      type: map['type'],
      staticImage: map['static_image'],
      backgroundColor: map['background_color'],
      dynamicImage: map['dynamic_image'],
      title: map['title'],
      subtitle: map['subtitle'],
      buttonText: map['button_text'],
      buttonUrl: map['button_url'],
    );
  }
}
