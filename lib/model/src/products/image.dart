class ShopifyImage {
  final String id;
  final String altText;
  final String originalSource;

  ShopifyImage({this.id, this.altText, this.originalSource});

  factory ShopifyImage.fromJson(Map<String, dynamic> data) => ShopifyImage(
        id: (data ?? {})['id'],
        altText: (data ?? {})['altText'],
        originalSource: (data ?? {})['originalSrc'],
      );
}
