import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:starspace/shared/models/character.dart';
import 'characters_store.dart';
import 'package:flutter/material.dart';

class CharactersPage extends StatefulWidget {
  final String title;
  const CharactersPage({Key? key, this.title = 'Personagens'})
      : super(key: key);
  @override
  CharactersPageState createState() => CharactersPageState();
}

class CharactersPageState
    extends ModularState<CharactersPage, CharactersStore> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _filter = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    when((_) => !controller.loaded, () => controller.load());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.nextPage();
      }
    });

    _filter.addListener(() {
      if (_filter.text.isNotEmpty) {
        controller.search(_filter.text);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _filter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return !controller.searching
              ? Text(widget.title)
              : TextField(
                  controller: _filter,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Pesquisar ...'),
                );
        }),
        actions: [
          Observer(builder: (_) {
            return controller.loaded
                ? IconButton(
                    icon: Icon(
                        !controller.searching ? Icons.search : Icons.close),
                    onPressed: () {
                      if (controller.searching) {
                        _filter.text = '';
                        controller.search(_filter.text);
                      }
                      controller.changeSearching();
                    })
                : Container();
          })
        ],
      ),
      body: Observer(builder: (_) {
        print(controller.characters.isNotEmpty);
        return controller.characters.isNotEmpty ? _listView() : _loadPage();
      }),
    );
  }

  Widget _listView() {
    return ListView.builder(
        padding: EdgeInsets.all(6),
        controller: _scrollController,
        itemCount: controller.pageitem.length,
        itemBuilder: (BuildContext context, int index) {
          Character character = controller.pageitem[index];
          return Card(
              color: Theme.of(context).accentColor,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(character.image),
                ),
                title: Title(
                    color: Colors.red,
                    child: Text(
                      character.name.toLowerCase(),
                      style: TextStyle(
                          fontFamily: "Start Jedi",
                          color: Theme.of(context).primaryColor,
                          fontSize: 20),
                    )),
                subtitle: Text(character.species.toLowerCase(),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: "Start Jedi")), //           <-- subtitle
              ));
        });
  }

  Widget _loadPage() {
    return Column(children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.8,
          alignment: Alignment.center,
          width: double.infinity,
          child: Lottie.asset('lotties/bb8.json'))
    ]);
  }
}
