class TimeVO {
  int? id;
  String? startTime;
  String? endTime;
  bool isCurrentTime;
  bool showCircle;
  TimeVO({
    this.id,
    this.startTime,
    this.endTime,
    this.isCurrentTime = true,
    this.showCircle = false,
  });
}
