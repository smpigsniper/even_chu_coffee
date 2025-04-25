class InstructionStep {
  final int step;
  final String beanTemp;
  final String fan;
  final String heat;
  final String info;
  final String memo;
  final String time;

  InstructionStep({
    required this.step,
    required this.beanTemp,
    required this.fan,
    required this.heat,
    required this.info,
    required this.memo,
    required this.time,
  });

  factory InstructionStep.fromMap(Map<String, dynamic> data) {
    return InstructionStep(
      step: data['Step'] ?? 0,
      beanTemp: data['BeanTemp'] ?? '',
      fan: data['FAN'] ?? '',
      heat: data['Heat'] ?? '',
      info: data['INFO'] ?? '',
      memo: data['MEMO'] ?? '',
      time: data['TIME'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Step': step,
      'BeanTemp': beanTemp,
      'FAN': fan,
      'Heat': heat,
      'INFO': info,
      'MEMO': memo,
      'TIME': time,
    };
  }
}
