import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manage/provider/fav_provider.dart';
import 'package:state_manage/screens/favorite/my_fav.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider =
        Provider.of<FavoriteItemProvider>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite screen"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MyFavScreen();
                },
              ));
            },
            child: Icon(
              Icons.favorite,
              size: 20,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: ((context, index) {
            return Consumer<FavoriteItemProvider>(
                builder: (context, value, child) {
              return ListTile(
                onTap: () {
                  if (value.selectedItem.contains(index)) {
                    value.removeItem(index);
                  } else {
                    value.addItem(index);
                  }
                },
                title: Text("item" + index.toString()),
                trailing: value.selectedItem.contains(index)
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border_outlined),
              );
            });
          })),
    );
  }
}
