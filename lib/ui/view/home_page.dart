import 'package:flutter/material.dart';
import 'package:pokedex_project/ui/components/tabs/pokemon_selection_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  void scrollTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 80.0,
          centerTitle: true,
          title:
              GestureDetector(onTap: scrollTop, child: const Text('Pokédex')),
          leading: Image.asset(
            'assets/img/pokemongo_icon.png',
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: PokemonSelectionTab(
              controller: _scrollController,
            ))
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
