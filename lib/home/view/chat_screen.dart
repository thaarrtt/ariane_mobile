import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ariane_mobile/common/utils/app_style.dart';
import 'package:ariane_mobile/router/routes.dart';

// Dummy Ticket Model
class Ticket {
  final String id;
  final String subject;
  final String msg;
  final DateTime createdAt;
  final String status;

  Ticket({
    required this.id,
    required this.subject,
    required this.msg,
    required this.createdAt,
    required this.status,
  });
}

// Dummy data
final List<Ticket> dummyTickets = [
  Ticket(
    id: '001',
    subject: 'Konsultasi Hukum Perdata',
    msg: 'Saya ingin berkonsultasi mengenai masalah sengketa tanah',
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
    status: 'Open',
  ),
  Ticket(
    id: '002',
    subject: 'Bantuan Drafting Kontrak',
    msg: 'Mohon bantuan untuk menyusun kontrak kerjasama bisnis',
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
    status: 'In Progress',
  ),
  Ticket(
    id: '003',
    subject: 'Mediasi Perceraian',
    msg: 'Membutuhkan mediator untuk proses perceraian',
    createdAt: DateTime.now(),
    status: 'Closed',
  ),
  Ticket(
    id: '004',
    subject: 'Gugatan Wanprestasi',
    msg: 'Ingin mengajukan gugatan atas pelanggaran kontrak',
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
    status: 'Open',
  ),
  Ticket(
    id: '005',
    subject: 'Pendaftaran Hak Cipta',
    msg: 'Butuh bantuan untuk mendaftarkan hak cipta karya seni',
    createdAt: DateTime.now().subtract(const Duration(days: 4)),
    status: 'In Progress',
  ),
  Ticket(
    id: '006',
    subject: 'Sengketa Warisan',
    msg: 'Konsultasi mengenai pembagian harta warisan',
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
    status: 'Open',
  ),
];

// Ticket list notifier
class TicketListNotifier extends StateNotifier<List<Ticket>> {
  TicketListNotifier() : super(dummyTickets);

  void addTicket(Ticket ticket) {
    state = [ticket, ...state];
  }

  Future<void> refresh() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    // In a real app, you'd fetch new data here
    // For now, we'll just shuffle the existing list
    state = [...state]..shuffle();
  }
}

final ticketListProvider =
    StateNotifierProvider<TicketListNotifier, List<Ticket>>(
        (ref) => TicketListNotifier());

class TicketListPage extends ConsumerWidget {
  const TicketListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(ticketListProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.pastelWhite,
        appBar: AppBar(
          backgroundColor: AppStyle.pastelWhite,
          leading: const SizedBox.shrink(),
          title: const Text(
            'Chat list',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: RefreshIndicator(
            onRefresh: () => ref.read(ticketListProvider.notifier).refresh(),
            child: ListView.separated(
              itemCount: tickets.length,
              separatorBuilder: (context, index) => const SizedBox(height: 6),
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return TicketListItem(ticket: ticket);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TicketListItem extends StatelessWidget {
  final Ticket ticket;

  const TicketListItem({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        const ChatDetailRoute().push(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID#${ticket.id} - ${DateFormat('d MMM yyyy').format(ticket.createdAt)}',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ticket.subject,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ticket.msg,
                    style: const TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getStatusColor(ticket.status),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                ticket.status,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return Colors.green;
      case 'in progress':
        return Colors.orange;
      case 'closed':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}
