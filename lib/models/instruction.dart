class Instruction {
  final String product;
  final int step;
  final String beanTemp;
  final String fan;
  final String heat;
  final String info;
  final String memo;
  final String time;

  Instruction({
    required this.product,
    required this.step,
    required this.beanTemp,
    required this.fan,
    required this.heat,
    required this.info,
    required this.memo,
    required this.time,
  });

  factory Instruction.fromFirestore(String productId, Map<String, dynamic> data) {
    return Instruction(
      product: productId,
      step: data['Step'] ?? 0,
      beanTemp: data['BeanTemp'] ?? '',
      fan: data['Fan'] ?? '',
      heat: data['Heat'] ?? '',
      info: data['Info'] ?? '',
      memo: data['Memo'] ?? '',
      time: data['Time'] ?? '',
    );
  }
}