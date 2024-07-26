import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: const Row(
          children: [
            Text(
              "gokul_since_2_0_0_3",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_box_outlined, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.white)),
        ],
      ),
      body: ListView(
        children: [
          _buildProfileInfo(),
          _buildProfileButtons(),
          _buildStoryHighlights(),
          _buildTabController()
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildTabController() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[800]!, width: 0.5)),
            ),
            child: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.person_pin_outlined)),
              ],
              indicatorColor: Colors.white,
              indicatorWeight: 2,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
            ),
          ),
          SizedBox(
            height: 1000,
            child: TabBarView(
              children: [
                _buildPostGrid(),
                const Center(
                    child: Text('Tagged Posts',
                        style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/me.jpg'),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildInfluColumn("3", "posts"),
                    _buildInfluColumn("375", "followers"),
                    _buildInfluColumn("482", "following"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text("Gokul s",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const Text("✌", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildInfluColumn(String count, String label) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildProfileButtons() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {},
              child:
                  Text("Edit profile", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {},
              child:
                  Text("Share profile", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              icon: Icon(Icons.person_add, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStoryHighlights() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildStoryItem("dance", Icons.music_note),
          _buildStoryItem("frnds", Icons.people),
          _buildStoryItem("me!", Icons.person),
          _buildStoryItem("travel", Icons.flight),
          _buildStoryItem("food", Icons.restaurant),
          _buildStoryItem("work", Icons.work),
          _buildStoryItem("add", Icons.add),
        ],
      ),
    );
  }

  Widget _buildStoryItem(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[800],
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildPostGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 100,
      itemBuilder: (context, index) {
        return Image.network(
          'https://picsum.photos/200/200?random=$index',
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.add_box), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(
            icon: CircleAvatar(
                radius: 10, backgroundImage: AssetImage('assets/me.jpg')),
            label: ''),
      ],
    );
  }
}
