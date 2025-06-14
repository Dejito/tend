
class AdminCreateGiftCardType {
  final String typeName;
  final double rate;

  AdminCreateGiftCardType({
    required this.typeName,
    required this.rate,
  });

  Map<String, dynamic> toJson() {
    return {
      'type_name': typeName,
      'rate': rate,
    };
  }
}
