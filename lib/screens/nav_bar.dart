import 'package:flutter/material.dart';
import 'dart:async';

class NavBarHome extends StatelessWidget {
  const NavBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 8.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.grey, Colors.black],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              DropdownMenu(
                buttonTitleStyle:
                    TextStyle(color: Colors.white, fontSize: 18.0),
                dropdownWidth: 300,
                buttonTitle: 'Navegação',
                dropdownItems: [
                  ListTile(
                    mouseCursor: SystemMouseCursors.click,
                    title: Text('Open', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    mouseCursor: SystemMouseCursors.click,
                    title: Text('New', style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
              height: 40,
              width: 180,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/inscricoes');
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blue, Colors.purple],
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Inscreva-se!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class DropdownMenu extends StatefulWidget {
  final TextStyle buttonTitleStyle;
  final double dropdownWidth;
  final String buttonTitle;
  final List<ListTile> dropdownItems;

  const DropdownMenu({
    super.key,
    required this.buttonTitleStyle,
    required this.dropdownWidth,
    required this.buttonTitle,
    required this.dropdownItems,
  });

  @override
  DropdownMenuState createState() => DropdownMenuState();
}

class DropdownMenuState extends State<DropdownMenu> {
  bool isDropdownVisible = false;
  Timer? hideTimer;

  void showDropdown() {
    hideTimer?.cancel();
    setState(() {
      isDropdownVisible = true;
    });
  }

  void startHideDropdownTimer() {
    hideTimer = Timer(const Duration(milliseconds: 200), () {
      setState(() {
        isDropdownVisible = false;
      });
    });
  }

  void cancelHideDropdownTimer() {
    hideTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        MouseRegion(
          onEnter: (_) => showDropdown(),
          onExit: (_) => startHideDropdownTimer(),
          child: SizedBox(
            width: 100,
            child: GestureDetector(
              onTap: () {},
              child: Text(widget.buttonTitle, style: widget.buttonTitleStyle),
            ),
          ),
        ),
        if (isDropdownVisible)
          Positioned(
            top: 50,
            child: MouseRegion(
              onEnter: (_) => cancelHideDropdownTimer(),
              onExit: (_) => startHideDropdownTimer(),
              child: Container(
                width: widget.dropdownWidth,
                color: Colors.black,
                child: Column(
                  children: widget.dropdownItems,
                ),
              ),
            ),
          ),
      ],
    );
  }
}