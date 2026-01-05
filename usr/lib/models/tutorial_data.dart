import 'package:flutter/material.dart';

class TutorialModule {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final List<TutorialStep> steps;

  TutorialModule({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.steps,
  });
}

class TutorialStep {
  final String title;
  final String content;
  final String warning; // For "Kesalahan Umum"
  final String imageUrl; // Placeholder for assets

  TutorialStep({
    required this.title,
    required this.content,
    this.warning = '',
    this.imageUrl = '',
  });
}

// Mock Data based on User's Curriculum Request
final List<TutorialModule> curriculumData = [
  TutorialModule(
    id: '1',
    title: 'Pengenalan & Persiapan',
    description: 'Pelajari komponen dasar dan alat yang dibutuhkan sebelum memulai.',
    icon: Icons.build, // build icon
    steps: [
      TutorialStep(
        title: 'Alat-alat yang Dibutuhkan',
        content: '1. Obeng Plus (Phillips Head) ukuran #2\n2. Wadah baut (mangkok magnetik)\n3. Gelang antistatis (opsional tapi disarankan)\n4. Kabel ties untuk manajemen kabel\n5. Ruang kerja yang bersih dan terang.',
        warning: 'Jangan merakit di atas karpet tebal karena risiko listrik statis tinggi.',
      ),
      TutorialStep(
        title: 'Mengenal Komponen Utama',
        content: 'PC terdiri dari: CPU (Otak), Motherboard (Tulang Punggung), RAM (Memori Jangka Pendek), GPU (Pengolah Grafis), PSU (Sumber Daya), dan Storage (SSD/HDD).',
      ),
    ],
  ),
  TutorialModule(
    id: '2',
    title: 'Perakitan Inti (Core)',
    description: 'Langkah krusial memasang CPU dan RAM ke Motherboard.',
    icon: Icons.memory, // memory icon
    steps: [
      TutorialStep(
        title: 'Memasang Prosesor (CPU)',
        content: '1. Buka tuas pengunci soket CPU di motherboard.\n2. Perhatikan tanda segitiga emas di sudut CPU dan segitiga di soket motherboard.\n3. Letakkan CPU dengan lembut tanpa ditekan.\n4. Kunci kembali tuas pengaman.',
        warning: 'KESALAHAN UMUM: Jangan menekan paksa CPU! Pin di soket sangat rapuh dan mudah bengkok. Jika tidak pas, angkat dan posisikan ulang.',
      ),
      TutorialStep(
        title: 'Memasang RAM',
        content: '1. Buka klip pengunci di slot RAM motherboard.\n2. Cocokkan celah (notch) pada stik RAM dengan tonjolan di slot.\n3. Tekan kedua ujung RAM secara bersamaan hingga terdengar bunyi "KLIK".',
        warning: 'Pastikan RAM terkunci sempurna. Jika hanya satu sisi yang bunyi klik, RAM belum terpasang benar dan PC tidak akan menyala.',
      ),
    ],
  ),
  TutorialModule(
    id: '3',
    title: 'Upgrade Laptop',
    description: 'Panduan khusus untuk upgrade komponen laptop.',
    icon: Icons.laptop, // laptop icon
    steps: [
      TutorialStep(
        title: 'Mengganti RAM Laptop',
        content: '1. Matikan laptop dan cabut baterai (jika bisa dilepas).\n2. Buka panel belakang akses RAM.\n3. Tarik klip besi di sisi RAM lama ke arah luar hingga RAM terangkat 45 derajat.\n4. Cabut RAM lama, masukkan RAM baru dengan sudut 45 derajat, lalu tekan ke bawah hingga terkunci.',
        warning: 'Pastikan tipe RAM (DDR3/DDR4/DDR5) dan voltase (biasa/Low Voltage) sesuai dengan spesifikasi laptop.',
      ),
      TutorialStep(
        title: 'Upgrade SSD Laptop',
        content: '1. Backup data lama Anda terlebih dahulu.\n2. Buka casing laptop.\n3. Lepas baut pengunci SSD M.2 atau HDD 2.5 inch.\n4. Pasang SSD baru dan kencangkan bautnya.',
      ),
    ],
  ),
];
