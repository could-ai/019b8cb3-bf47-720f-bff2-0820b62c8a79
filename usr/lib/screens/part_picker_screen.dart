import 'package:flutter/material.dart';

class PartPickerScreen extends StatefulWidget {
  const PartPickerScreen({super.key});

  @override
  State<PartPickerScreen> createState() => _PartPickerScreenState();
}

class _PartPickerScreenState extends State<PartPickerScreen> {
  // Mock Data for Logic Demonstration
  String? selectedCPU;
  String? selectedMotherboard;
  
  final Map<String, String> cpuSockets = {
    'Intel Core i5-12400F': 'LGA1700',
    'Intel Core i9-13900K': 'LGA1700',
    'AMD Ryzen 5 5600X': 'AM4',
    'AMD Ryzen 7 7800X3D': 'AM5',
  };

  final Map<String, String> moboSockets = {
    'ASUS Prime B660M-A': 'LGA1700',
    'MSI MAG B550 Tomahawk': 'AM4',
    'Gigabyte X670 AORUS': 'AM5',
  };

  String get compatibilityStatus {
    if (selectedCPU == null || selectedMotherboard == null) {
      return 'Pilih komponen untuk cek kompatibilitas.';
    }
    
    final cpuSocket = cpuSockets[selectedCPU];
    final moboSocket = moboSockets[selectedMotherboard];

    if (cpuSocket == moboSocket) {
      return 'KOMPATIBEL! Keduanya menggunakan soket $cpuSocket.';
    } else {
      return 'TIDAK COCOK. CPU butuh $cpuSocket, tapi Motherboard adalah $moboSocket.';
    }
  }

  Color get statusColor {
    if (selectedCPU == null || selectedMotherboard == null) return Colors.grey;
    return compatibilityStatus.startsWith('KOMPATIBEL') ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PC Part Picker (Demo)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Cek Kecocokan Komponen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Fitur ini menggunakan algoritma pencocokan soket untuk memastikan CPU dan Motherboard Anda bisa dipasang bersama.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // CPU Selection
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Pilih Processor (CPU)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.memory),
              ),
              value: selectedCPU,
              items: cpuSockets.keys.map((cpu) {
                return DropdownMenuItem(value: cpu, child: Text(cpu));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCPU = value;
                });
              },
            ),
            
            const SizedBox(height: 16),

            // Motherboard Selection
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Pilih Motherboard',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.developer_board),
              ),
              value: selectedMotherboard,
              items: moboSockets.keys.map((mobo) {
                return DropdownMenuItem(value: mobo, child: Text(mobo));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMotherboard = value;
                });
              },
            ),

            const SizedBox(height: 32),

            // Result Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                border: Border.all(color: statusColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Icon(
                    compatibilityStatus.startsWith('KOMPATIBEL') 
                        ? Icons.check_circle 
                        : (selectedCPU == null ? Icons.help_outline : Icons.cancel),
                    size: 48,
                    color: statusColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    compatibilityStatus,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
