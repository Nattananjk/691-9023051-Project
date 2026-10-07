class ElectricityBill {
  final String caNumber;
  final String name;
  final String address;
  final String month;
  final double unitsUsed;
  final double amount;
  final String dueDate;

  ElectricityBill({
    required this.caNumber,
    required this.name,
    required this.address,
    required this.month,
    required this.unitsUsed,
    required this.amount,
    required this.dueDate,
  });
}