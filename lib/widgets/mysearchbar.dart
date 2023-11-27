import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas/blocs/search/search_bloc.dart';
import 'package:mapas/delegates/delegates.dart';
import 'package:mapas/models/models.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) => state.displayManualMarket
            ? const SizedBox()
            : const _MySearchBarBody());
  }
}

class _MySearchBarBody extends StatelessWidget {
  const _MySearchBarBody();

  void onSearchResults(BuildContext context, SearchResult result) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    if (result.manual == true) {
      searchBloc.add(OnActivateManualMarketEvent());
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        height: 50,
        child: GestureDetector(
          onTap: () async {
            final result = await showSearch(
              context: context,
              delegate: SearchDestinationDelegate(),
            );
            if (result == null) return;
            if (context.mounted) {
              onSearchResults(context, result);
            }
          },
          child: FadeInDown(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 5))
                  ]),
              child: Text('¿A donde quieres ir?',
                  style: TextStyle(color: Colors.blue[100])),
            ),
          ),
        ),
      ),
    );
  }
}
