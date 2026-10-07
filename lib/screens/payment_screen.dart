import 'package:flutter/material.dart';
import '../models/electricity_bill.dart';
import 'receipt_screen.dart';

class PaymentScreen extends StatelessWidget {
  final ElectricityBill bill;

  const PaymentScreen({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ชำระเงิน')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text('สแกน QR Code เพื่อชำระเงิน', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('รองรับแอปพลิเคชันทุกธนาคาร (PromptPay)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 20),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300, width: 2),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.qr_code_2, size: 140, color: Color(0xFF7B1FA2)),
                          Text('PromptPay', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF7B1FA2))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'ยอดชำระ: ฿${bill.amount.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFF6F00)),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ReceiptScreen(bill: bill)),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('ยืนยันการชำระเงิน (จำลอง)', style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}