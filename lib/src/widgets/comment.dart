import 'package:flutter/material.dart';
import '../models/item_model.dart';

class Comment extends StatelessWidget {

  const Comment({required this.itemId, required this.itemMap, Key? key})
      : super(key: key);

  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: itemMap[itemId],
      builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
        if(!snapshot.hasData){
          return Text('Still loading comment');
        }

        return Text(snapshot.data!.text!);
      },
    );
  }
}
