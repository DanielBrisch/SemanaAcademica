import 'package:flutter/material.dart';
import 'package:semanaacademica2024/screens/mater_game_screen.dart';
import 'package:semanaacademica2024/screens/palestrantes_screen.dart';
import 'package:semanaacademica2024/screens/patrocinadores_screen.dart';
import 'package:semanaacademica2024/screens/top_screen.dart';
import 'package:semanaacademica2024/widgets/nav_bar.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => ScreenMainState();
}

class ScreenMainState extends State<ScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavBarHome(),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const ContainerHomeTop(),
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [Colors.blue, Colors.white.withOpacity(0.9)],
          //     ),
          //   ),
          // ),
          const QrCodeContainer(),
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [
          //         Colors.white,
          //         const Color(0xFF4BC8EF).withOpacity(0.9)
          //       ],
          //     ),
          //   ),
          // ),
          const PalestrantesPage(),
          const PatrocinadoresPage(),
        ],
      ),
    );
  }
}
