import 'package:flutter/material.dart';

void main() {
  runApp(const ShiftlyApp());
}

class ShiftlyApp extends StatelessWidget {
  const ShiftlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shiftly - Moving & Packing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        fontFamily: 'Arial',
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int index = 0;

  final pages = const [
    HomePage(),
    ServicesPage(),
    BookingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: 'Services'),
          NavigationDestination(icon: Icon(Icons.receipt_long_outlined), selectedIcon: Icon(Icons.receipt_long), label: 'Bookings'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, Sharan 👋', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      SizedBox(height: 5),
                      Text('Ready for a smooth move?',
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xFFE8F0FF),
                  child: Icon(Icons.person, color: Color(0xFF2563EB)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2563EB), Color(0xFF4F8DF7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Moving made simple.',
                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Book trusted professionals for packing, moving and delivery.',
                      style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.4)),
                  SizedBox(height: 20),
                  _SmallStatRow(),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text('Quick Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(child: ServiceCard(icon: Icons.local_shipping, title: 'Home Move', color: Colors.blue)),
                const SizedBox(width: 12),
                Expanded(child: ServiceCard(icon: Icons.inventory_2, title: 'Packing', color: Colors.orange)),
                const SizedBox(width: 12),
                Expanded(child: ServiceCard(icon: Icons.business, title: 'Office Move', color: Colors.green)),
              ],
            ),
            const SizedBox(height: 28),
            const Text('How it works',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            const StepTile(number: '01', icon: Icons.edit_location_alt, title: 'Enter your details',
                subtitle: 'Tell us where you are moving from and to.'),
            const StepTile(number: '02', icon: Icons.calendar_month, title: 'Choose a date',
                subtitle: 'Select a convenient moving date and time.'),
            const StepTile(number: '03', icon: Icons.local_shipping, title: 'We move it',
                subtitle: 'Our professionals handle your move safely.'),
          ],
        ),
      ),
    );
  }
}

class _SmallStatRow extends StatelessWidget {
  const _SmallStatRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _Stat(text: '500+', label: 'Moves'),
        SizedBox(width: 28),
        _Stat(text: '4.9★', label: 'Rating'),
        SizedBox(width: 28),
        _Stat(text: '24/7', label: 'Support'),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  final String text;
  final String label;
  const _Stat({required this.text, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final MaterialColor color;

  const ServiceCard({super.key, required this.icon, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BookingPage(service: title))),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [BoxShadow(color: Color(0x11000000), blurRadius: 12, offset: Offset(0, 4))],
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color.shade50,
              child: Icon(icon, color: color.shade700),
            ),
            const SizedBox(height: 9),
            Text(title, textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class StepTile extends StatelessWidget {
  final String number;
  final IconData icon;
  final String title;
  final String subtitle;

  const StepTile({super.key, required this.number, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xFFE8F0FF),
            child: Icon(icon, color: const Color(0xFF2563EB)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('$number  $title', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            ]),
          ),
        ],
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      ['Home Relocation', Icons.home_work, 'Complete home moving service'],
      ['Packing & Unpacking', Icons.all_inbox, 'Careful packing of your belongings'],
      ['Office Relocation', Icons.apartment, 'Professional office shifting'],
      ['Vehicle Transport', Icons.directions_car, 'Safe vehicle transportation'],
      ['Storage', Icons.warehouse, 'Short and long-term storage'],
      ['Furniture Assembly', Icons.chair, 'Disassembly and reassembly'],
    ];

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Our Services', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('Choose the service that fits your move.',
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 22),
          ...services.map((s) => Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0xFFE8F0FF),
                child: Icon(s[1] as IconData, color: const Color(0xFF2563EB)),
              ),
              title: Text(s[0] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(s[2] as String),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BookingPage(service: s[0] as String)),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class BookingPage extends StatefulWidget {
  final String service;
  const BookingPage({super.key, required this.service});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final phoneController = TextEditingController();
  DateTime? selectedDate;

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 180)),
      initialDate: DateTime.now().add(const Duration(days: 1)),
    );
    if (date != null) setState(() => selectedDate = date);
  }

  void submitBooking() {
    if (fromController.text.isEmpty || toController.text.isEmpty || selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete the required details.')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Booking Confirmed 🎉'),
        content: Text('Your ${widget.service} request has been submitted successfully.'),
        actions: [
          TextButton(onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              child: const Text('Done')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book a Service')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(widget.service, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 22),
          _Field(controller: fromController, label: 'Pickup Location', icon: Icons.location_on_outlined),
          _Field(controller: toController, label: 'Drop Location', icon: Icons.location_searching),
          _Field(controller: phoneController, label: 'Phone Number', icon: Icons.phone, keyboardType: TextInputType.phone),
          const SizedBox(height: 4),
          InkWell(
            onTap: pickDate,
            borderRadius: BorderRadius.circular(14),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Moving Date',
                prefixIcon: Icon(Icons.calendar_month),
                border: OutlineInputBorder(),
              ),
              child: Text(
                selectedDate == null
                    ? 'Select date'
                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Additional Notes', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Tell us about floors, elevators, fragile items, etc.',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 28),
          FilledButton.icon(
            onPressed: submitBooking,
            icon: const Icon(Icons.check_circle_outline),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Text('Confirm Booking', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;

  const _Field({required this.controller, required this.label, required this.icon, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('My Bookings', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFE8F0FF),
                    child: Icon(Icons.local_shipping, color: Color(0xFF2563EB)),
                  ),
                  SizedBox(width: 14),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Home Relocation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    Text('Booking #SHF-1024', style: TextStyle(color: Colors.grey)),
                  ])),
                  Chip(label: Text('Upcoming')),
                ]),
                Divider(height: 28),
                Text('Pickup', style: TextStyle(color: Colors.grey)),
                Text('Hyderabad, Telangana', style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text('Drop', style: TextStyle(color: Colors.grey)),
                Text('Secunderabad, Telangana', style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text('Date: 20 October 2026', style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.location_on_outlined),
            label: const Text('Track Moving Team'),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Profile', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Center(
            child: CircleAvatar(
              radius: 42,
              backgroundColor: Color(0xFFE8F0FF),
              child: Icon(Icons.person, size: 45, color: Color(0xFF2563EB)),
            ),
          ),
          const SizedBox(height: 10),
          const Center(child: Text('Sharan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          const Center(child: Text('sharan@example.com', style: TextStyle(color: Colors.grey))),
          const SizedBox(height: 28),
          const _ProfileOption(icon: Icons.person_outline, title: 'Personal Information'),
          const _ProfileOption(icon: Icons.location_on_outlined, title: 'Saved Addresses'),
          const _ProfileOption(icon: Icons.payment_outlined, title: 'Payment Methods'),
          const _ProfileOption(icon: Icons.notifications_none, title: 'Notifications'),
          const _ProfileOption(icon: Icons.help_outline, title: 'Help & Support'),
          const _ProfileOption(icon: Icons.settings_outlined, title: 'Settings'),
        ],
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ProfileOption({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF2563EB)),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
