class SellerUploadGiftCardReqBody {
  final String gift_card_type_id;
  final double price;
  final String card_pin;
  final DateTime card_expiration_date;
  final String image_url;
  final String? subcategory;

  SellerUploadGiftCardReqBody({
    required this.gift_card_type_id,
    required this.price,
    required this.card_pin,
    required this.card_expiration_date,
    required this.image_url,
    this.subcategory,
  });

  Map<String, dynamic> toJson() {
    return {
      'gift_card_type_id': gift_card_type_id,
      'price': price,
      'card_pin': card_pin,
      'card_expiration_date': card_expiration_date.toIso8601String(),
      'image_url': image_url,
      'subcategory': subcategory,
    };
  }
}
