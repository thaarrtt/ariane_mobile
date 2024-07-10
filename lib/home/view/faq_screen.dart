import 'package:flutter/material.dart';
import 'package:flutter_easy_faq/flutter_easy_faq.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ariane_mobile/common/utils/app_style.dart';

class FAQScreen extends HookConsumerWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = useTextEditingController();

    return SizedBox(
      width: 0.96.sw,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 0.04.sh),
            Container(
              decoration: BoxDecoration(
                color: AppStyle.grayBrandColor,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 0.06.sh,
              width: 0.9.sw,
              child: Padding(
                padding: EdgeInsets.only(left: 0.02.sw),
                child: TextField(
                  controller: searchText,
                  onChanged: (value) {},
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 10, left: 10),
                    border: InputBorder.none,
                    hintText: 'Cari Pertanyaan',
                    alignLabelWithHint: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchText.clear();
                      },
                      icon: const Icon(Icons.clear, color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.02.sh),
            EasyFaq(
              backgroundColor: AppStyle.grayBrandColor,
              question: "Apa yang dimaksud dengan layanan perdata?",
              answer:
                  "Layanan perdata adalah layanan hukum yang berkaitan dengan sengketa atau masalah hukum antara individu atau badan hukum dalam ranah hukum perdata, seperti masalah kontrak, warisan, atau perkawinan.",
              collapsedIcon: const Icon(Icons.keyboard_arrow_down_outlined),
              expandedIcon: const Icon(Icons.keyboard_arrow_up_outlined),
            ),
            SizedBox(height: 0.02.sh),
            EasyFaq(
              backgroundColor: AppStyle.grayBrandColor,
              question: "Bagaimana cara mengajukan gugatan perdata?",
              answer:
                  "Untuk mengajukan gugatan perdata, Anda perlu menyiapkan surat gugatan, membayar biaya perkara, dan mendaftarkannya ke Pengadilan Negeri yang berwenang. Disarankan untuk berkonsultasi dengan pengacara terlebih dahulu.",
              collapsedIcon: const Icon(Icons.keyboard_arrow_down_outlined),
              expandedIcon: const Icon(Icons.keyboard_arrow_up_outlined),
            ),
            SizedBox(height: 0.02.sh),
            EasyFaq(
              backgroundColor: AppStyle.grayBrandColor,
              question: "Berapa lama proses penyelesaian perkara perdata?",
              answer:
                  "Lama proses bervariasi tergantung kompleksitas kasus. Secara umum, bisa memakan waktu 3-6 bulan, namun kasus yang rumit bisa berlangsung lebih lama.",
              collapsedIcon: const Icon(Icons.keyboard_arrow_down_outlined),
              expandedIcon: const Icon(Icons.keyboard_arrow_up_outlined),
            ),
            SizedBox(height: 0.02.sh),
            EasyFaq(
              backgroundColor: AppStyle.grayBrandColor,
              question:
                  "Apakah saya memerlukan pengacara untuk menangani kasus perdata?",
              answer:
                  "Meskipun tidak wajib, sangat disarankan untuk menggunakan jasa pengacara, terutama untuk kasus yang kompleks, agar hak-hak hukum Anda dapat terlindungi dengan baik.",
              collapsedIcon: const Icon(Icons.keyboard_arrow_down_outlined),
              expandedIcon: const Icon(Icons.keyboard_arrow_up_outlined),
            ),
            SizedBox(height: 0.02.sh),
            EasyFaq(
              backgroundColor: AppStyle.grayBrandColor,
              question:
                  "Apa perbedaan antara mediasi dan litigasi dalam penyelesaian sengketa perdata?",
              answer:
                  "Mediasi adalah proses penyelesaian sengketa di luar pengadilan dengan bantuan mediator, sedangkan litigasi adalah proses penyelesaian sengketa melalui pengadilan.",
              collapsedIcon: const Icon(Icons.keyboard_arrow_down_outlined),
              expandedIcon: const Icon(Icons.keyboard_arrow_up_outlined),
            ),
            SizedBox(height: 0.02.sh),
            EasyFaq(
              backgroundColor: AppStyle.grayBrandColor,
              question:
                  "Bagaimana jika saya tidak mampu membayar biaya perkara?",
              answer:
                  "Anda dapat mengajukan permohonan untuk berperkara secara cuma-cuma (prodeo) ke pengadilan dengan menyertakan surat keterangan tidak mampu dari kelurahan.",
              collapsedIcon: const Icon(Icons.keyboard_arrow_down_outlined),
              expandedIcon: const Icon(Icons.keyboard_arrow_up_outlined),
            ),
            SizedBox(height: 0.2.sh),
          ],
        ),
      ),
    );
  }
}
