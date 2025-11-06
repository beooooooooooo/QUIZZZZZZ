import 'package:flutter/material.dart';
import '../widgets/category_chip.dart';
import '../widgets/article_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          '232101140, Ari Firmansyah ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/me.jpg'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                  hintText: 'Search workouts or trainers',
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Row(
              children: [
                CategoryChip(label: 'For You', selected: true),
                CategoryChip(label: 'Workout'),
                CategoryChip(label: 'Nutrition'),
                CategoryChip(label: 'Motivation'),
                CategoryChip(label: 'Brain'),
              ],
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 200, // batasi tinggi card agar tidak terlalu besar
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ArticleCard(
                    imagePath: 'assets/images/gym.webp',
                    title: 'Full Body Workout',
                    subtitle: '30 mins fat burning session',
                  ),
                  ArticleCard(
                    imagePath: 'assets/images/gym2.jpg',
                    title: 'Healthy Meal Plan',
                    subtitle: '5 days of clean eating',
                  ),
                  ArticleCard(
                    imagePath: 'assets/images/gym3.jpg',
                    title: 'Fat Burning',
                    subtitle: '4 days of clean eating',
                  ),
                  ArticleCard(
                    imagePath: 'assets/images/makan.jpg',
                    title: 'Latihan Rutin',
                    subtitle: '5 days of clean eating',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xFF7DBE31),
            unselectedItemColor: Colors.grey.shade400,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() => _selectedIndex = index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_rounded),
                label: 'Schedule',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_rounded),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}