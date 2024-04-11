import 'package:flutter/material.dart';

class SliverTabBar extends StatefulWidget {
  const SliverTabBar({Key? key}) : super(key: key);

  @override
  _SliverTabBarState createState() => _SliverTabBarState();
}

class _SliverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int index = 0;
  String image = 'https://www.caifanes.com.mx/Caifanes-FotoZeus.jpg';

  List<String> miImages = [
    'https://raw.githubusercontent.com/AnayaMarinAngelAlejandro/img_iOS/main/disco1.jpg',
    'https://m.media-amazon.com/images/I/91+lErtfNSL._UF1000,1000_QL80_.jpg',
    'https://indierocks.sfo3.digitaloceanspaces.com/wp-content/uploads/2022/05/portada-caifanes-el-silencio.jpg',
    'https://i2.wp.com/2.bp.blogspot.com/-_A95iIGYwPU/VX8Mca0YrXI/AAAAAAAAGSI/r3sBQBo5OuI/s1600/CaiElNerDelVol.jpg',
  ];

  void _tabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    tabController.addListener(_tabListener);
  }

  @override
  void dispose() {
    tabController!.removeListener(_tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0.0,
          pinned: true,
          backgroundColor: Color(0xff615760),
          expandedHeight: 350.0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("Discos de Caifanes"),
            background: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverAppBar(
          pinned: true,
          primary: false,
          elevation: 8.0,
          backgroundColor: Color(0xffcbc6bc),
          title: Align(
            alignment: AlignmentDirectional.center,
            child: TabBar(
              indicatorColor: Color(0xff250020),
              isScrollable: true,
              controller: tabController,
              tabs: [
                Tab(text: "Disco 1"),
                Tab(text: "Disco 2"),
                Tab(text: "Disco 3"),
                Tab(text: "Disco 4"),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 800.0,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: TabBarView(
                controller: tabController,
                children: [
                  Text("Volumen 1. (1987)"),
                  Text("Volumen 2. (1990)"),
                  Text("El silencio. (1994)"),
                  Text("El nervio del volcan (1994)"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
