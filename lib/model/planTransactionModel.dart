class PlanTransactionModel {
  PlanTransactionModel({
    required this.id,
    required this.plan,
    required this.planStartDateTime,
    required this.planEndDateTime,
  });

  final int? id;
  final String? plan;
  final String? planStartDateTime;
  final String? planEndDateTime;

  factory PlanTransactionModel.fromMap(Map<String, dynamic> json) =>
      PlanTransactionModel(
        id: json["id"],
        plan: json["plan"],
        planStartDateTime: json["planStartDateTime"],
        planEndDateTime: json["planEndDateTime"],
      );

  Map<String, dynamic> transactionToMap() => {
        "id": id,
        "plan": plan,
        "planStartDateTime": planStartDateTime,
        "planEndDateTime": planEndDateTime,
      };
}
