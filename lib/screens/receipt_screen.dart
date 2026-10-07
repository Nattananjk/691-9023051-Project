import 'package:flutter/material.dart';
import '../models/electricity_bill.dart';
import 'home_screen.dart';

class ReceiptScreen extends StatelessWidget {
  final ElectricityBill bill;

  const ReceiptScreen({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ใบเสร็จรับเงิน'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.check_circle, size: 80, color: Colors.green),
            const SizedBox(height: 12),
            const Text('ชำระเงินสำเร็จ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 20),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildReceiptRow('เลขที่รายการ:', 'TXN-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}'),
                    _buildReceiptRow('วัน-เวลาทำรายการ:', '07/10/2026 12:40 น.'),
                    _buildReceiptRow('หมายเลขผู้ใช้ไฟฟ้า:', bill.caNumber),
                    _buildReceiptRow('ชื่อผู้ใช้ไฟฟ้า:', bill.name),
                    _buildReceiptRow('ประจำเดือน:', bill.month),
                    const Divider(),
                    _buildReceiptRow('จำนวนเงินที่ชำระ:', '฿${bill.amount.toStringAsFixed(2)}', isBold: true),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false,
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Color(0xFF7B1FA2)),
                ),
                child: const Text('กลับสู่หน้าหลัก', style: TextStyle(fontSize: 16, color: Color(0xFF7B1FA2))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 16 : 14,
              color: isBold ? const Color(0xFF7B1FA2) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}