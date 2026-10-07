import 'package:flutter/material.dart';
import '../models/electricity_bill.dart';
import 'bill_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _caController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _caController.dispose();
    super.dispose();
  }

  void _searchBill() {
    if (_formKey.currentState!.validate()) {
      final ca = _caController.text.trim();
      late ElectricityBill mockBill;

      // ตรวจสอบหมายเลขที่กรอกเพื่อดึงข้อมูลจำลอง
      if (ca == '6714421021') {
        mockBill = ElectricityBill(
          caNumber: ca,
          name: 'นายณัฐนันท์ พันธุเดช',
          address: '45/12 หมู่ 5 ต.แสนสุข อ.เมือง จ.ชลบุรี 20130',
          month: 'ตุลาคม 2026',
          unitsUsed: 520.0,
          amount: 2485.50,
          dueDate: '20 ตุลาคม 2026',
        );
      } else {
        // ค่าเริ่มต้นสำหรับหมายเลขอื่นๆ
        mockBill = ElectricityBill(
          caNumber: ca,
          name: 'นายสมชาย ใจดี',
          address: '123/45 ถ.สุขุมวิท อ.เมือง จ.ชลบุรี 20000',
          month: 'ตุลาคม 2026',
          unitsUsed: 342.5,
          amount: 1485.50,
          dueDate: '20 ตุลาคม 2026',
        );
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BillDetailScreen(bill: mockBill),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การไฟฟ้าส่วนภูมิภาค PEA'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.electric_bolt,
                size: 80,
                color: Color(0xFF7B1FA2),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'บริการชำระค่าไฟฟ้าออนไลน์',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'กรอกหมายเลขผู้ใช้ไฟฟ้า เพื่อตรวจสอบยอดชำระ',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _caController,
                        keyboardType: TextInputType.number,
                        maxLength: 12,
                        decoration: const InputDecoration(
                          labelText: 'หมายเลขผู้ใช้ไฟฟ้า (CA/Account No.)',
                          hintText: 'เช่น 6714421021 หรือ 020001234567',
                          prefixIcon: Icon(Icons.pin),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'กรุณากรอกหมายเลขผู้ใช้ไฟฟ้า';
                          }
                          if (value.trim().length < 10) {
                            return 'หมายเลขผู้ใช้ไฟฟ้าต้องมีอย่างน้อย 10 หลัก';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      // ปุ่มทางลัดสำหรับทดสอบกรอกหมายเลขอย่างรวดเร็ว
                      Wrap(
                        spacing: 8,
                        children: [
                          ActionChip(
                            avatar: const Icon(Icons.person, size: 16, color: Color(0xFF7B1FA2)),
                            label: const Text('6714421021 (ณัฐนันท์)'),
                            backgroundColor: Colors.purple.shade50,
                            onPressed: () {
                              setState(() {
                                _caController.text = '6714421021';
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _searchBill,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7B1FA2),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'ตรวจสอบยอดค่าไฟฟ้า',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}