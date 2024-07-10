import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ariane_mobile/common/utils/app_style.dart';

// Message model
class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({required this.text, required this.isUser, required this.timestamp});
}

// StateNotifier to manage messages
class MessageNotifier extends StateNotifier<List<Message>> {
  MessageNotifier() : super([]);

  void addMessage(String text, bool isUser) {
    state = [
      Message(text: text, isUser: isUser, timestamp: DateTime.now()),
      ...state,
    ];

    if (isUser) {
      // Simulate a delay before the bot responds
      Future.delayed(const Duration(seconds: 1), () {
        final botReply = generateBotReply(text);
        addMessage(botReply, false);
      });
    }
  }

  String generateBotReply(String userMessage) {
    final random = Random();
    final lowercaseMessage = userMessage.toLowerCase();

    if (lowercaseMessage.contains('halo') ||
        lowercaseMessage.contains('hi') ||
        lowercaseMessage.contains('hello')) {
      final greetings = [
        'Halo! Ada yang bisa saya bantu?',
        'Selamat datang! Apa yang bisa saya lakukan untuk Anda hari ini?',
        'Hi there! Senang bertemu dengan Anda. Ada yang bisa saya bantu?',
        'Halo! Terima kasih sudah menghubungi kami. Apa yang Anda butuhkan?'
      ];
      return greetings[random.nextInt(greetings.length)];
    } else if (lowercaseMessage.contains('bantuan') ||
        lowercaseMessage.contains('help')) {
      final helpResponses = [
        'Tentu, saya siap membantu Anda. Apa yang Anda butuhkan?',
        'Saya di sini untuk membantu. Bisa jelaskan lebih detail apa yang Anda perlukan?',
        'Dengan senang hati saya akan membantu. Apa masalah yang Anda hadapi?',
        'Bantuan adalah prioritas kami. Silakan ceritakan apa yang bisa kami lakukan untuk Anda.'
      ];
      return helpResponses[random.nextInt(helpResponses.length)];
    } else if (lowercaseMessage.contains('konsultasi')) {
      final consultationResponses = [
        'Untuk konsultasi, silakan jelaskan masalah hukum yang Anda hadapi. Kami akan berusaha memberikan saran terbaik.',
        'Kami siap memberikan konsultasi. Bisa Anda jelaskan lebih detail tentang situasi hukum Anda?',
        'Konsultasi adalah langkah pertama yang tepat. Apa jenis kasus hukum yang ingin Anda diskusikan?',
        'Kami menyediakan layanan konsultasi komprehensif. Silakan jelaskan masalah Anda, dan kami akan membantu sebisa mungkin.'
      ];
      return consultationResponses[
          random.nextInt(consultationResponses.length)];
    } else if (lowercaseMessage.contains('biaya') ||
        lowercaseMessage.contains('tarif')) {
      final feeResponses = [
        'Biaya layanan kami bervariasi tergantung pada jenis kasus. Untuk informasi lebih lanjut, silakan hubungi kantor kami.',
        'Kami memiliki struktur biaya yang fleksibel. Bisa Anda jelaskan lebih detail tentang kasus Anda agar kami bisa memberikan estimasi?',
        'Tarif kami disesuaikan dengan kompleksitas kasus. Bagaimana jika kita jadwalkan konsultasi untuk membahas ini lebih lanjut?',
        'Kami berkomitmen untuk menyediakan layanan hukum dengan harga yang wajar. Mari kita diskusikan kebutuhan Anda untuk memberikan penawaran yang sesuai.'
      ];
      return feeResponses[random.nextInt(feeResponses.length)];
    } else if (lowercaseMessage.contains('terima kasih')) {
      final thanksResponses = [
        'Sama-sama! Senang bisa membantu Anda.',
        'Terima kasih kembali. Jangan ragu untuk menghubungi kami jika ada hal lain yang bisa kami bantu.',
        'Kami senang bisa membantu. Semoga hari Anda menyenangkan!',
        'Terima kasih atas kepercayaan Anda. Kami selalu siap membantu kapan pun Anda butuhkan.'
      ];
      return thanksResponses[random.nextInt(thanksResponses.length)];
    } else {
      final defaultResponses = [
        'Terima kasih atas pesan Anda. Tim kami akan segera merespons. Apakah ada hal lain yang ingin Anda tanyakan?',
        'Kami telah menerima pesan Anda dan akan menindaklanjutinya segera. Ada lagi yang bisa saya bantu?',
        'Pesan Anda sudah kami catat. Sementara menunggu respons lebih lanjut, apakah ada informasi tambahan yang ingin Anda sampaikan?',
        'Terima kasih telah menghubungi kami. Kami akan memproses permintaan Anda. Sementara itu, apakah ada pertanyaan lain yang bisa saya jawab?'
      ];
      return defaultResponses[random.nextInt(defaultResponses.length)];
    }
  }
}

// Provider for messages
final messageProvider = StateNotifierProvider<MessageNotifier, List<Message>>(
  (ref) => MessageNotifier(),
);

class ChatPage extends ConsumerWidget {
  ChatPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messageProvider);

    return Scaffold(
      backgroundColor: AppStyle.pastelWhite,
      appBar: AppBar(
        backgroundColor: AppStyle.pastelWhite,
        title: const Text('CHAT (account)'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return MessageBubble(message: message);
              },
            ),
          ),
          SizedBox(height: 0.02.sh),
          MessageInput(
            controller: _controller,
            onSend: (text) {
              if (text.isNotEmpty) {
                ref.read(messageProvider.notifier).addMessage(text, true);
                _controller.clear();
              }
            },
          ),
          SizedBox(height: 0.04.sh),
        ],
      ),
    );
  }
}

// MessageBubble and MessageInput classes remain the same as in your original code

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: message.isUser ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              DateFormat('dd MMM yyyy - HH:mm').format(message.timestamp),
              style: TextStyle(
                fontSize: 10,
                color: message.isUser ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSend;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => onSend(controller.text),
          ),
        ],
      ),
    );
  }
}
