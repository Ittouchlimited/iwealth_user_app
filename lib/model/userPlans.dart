class UserPlan {
  int? id;
  String planName;
  String planStartDateTime;
  String planEndDateTime;

  UserPlan({this.id, required this.planName, required this.planStartDateTime, required this.planEndDateTime,});

  UserPlan.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        planName = res["plan_name"],
        planStartDateTime = res["plan_start_date_time"],
        planEndDateTime = res["plan_end_date_time"];

  Map<String, Object?> toMap() {
    return {'id': id, 'plan_name': planName, 'plan_start_date_time': planStartDateTime, 'plan_end_date_time': planEndDateTime};
  }
}