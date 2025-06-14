
class AdminRejectsGiftcardReqBody {
  final String remark;

  AdminRejectsGiftcardReqBody({required this.remark});

  Map<String, dynamic> toJson() {
    return {
      'remark': remark,
    };
  }
}
