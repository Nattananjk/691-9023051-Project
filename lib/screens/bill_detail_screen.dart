import 'package:flutter/material.dart';
import '../models/electricity_bill.dart';
import 'payment_screen.dart';

class BillDetailScreen extends StatelessWidget {
  final ElectricityBill bill;

  const BillDetailScreen({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('รายละเอียดค่าไฟฟ้า')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'ใบแจ้งค่าไฟฟ้า',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF7B1FA2)),
                        ),
                        Chip(
                          label: Text(bill.month),
                          backgroundColor: Colors.purple.shade50,
                        ),
                      ],
                    ),
                    const Divider(),
                    _buildInfoRow('หมายเลขผู้ใช้ไฟฟ้า:', bill.caNumber),
                    _buildInfoRow('ชื่อผู้ใช้ไฟฟ้า:', bill.name),
                    _buildInfoRow('สถานที่ใช้ไฟฟ้า:', bill.address),
                    _buildInfoRow('จำนวนหน่วยที่ใช้:', '${bill.unitsUsed.toStringAsFixed(1)} หน่วย'),
                    _buildInfoRow('กำหนดชำระภายใน:', bill.dueDate, textColor: Colors.red),
                    const Divider(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('จำนวนเงินทั้งสิ้น:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                          '฿${bill.amount.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFF6F00)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(bill: bill),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6F00),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('ดำเนินการชำระเงิน', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 130, child: Text(label, style: const TextStyle(color: Colors.grey))),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.w500, color: textColor ?? Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}