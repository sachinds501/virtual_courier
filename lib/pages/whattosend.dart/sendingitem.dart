// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:velocity_x/velocity_x.dart';

class SendingItem extends StatefulWidget {
  const SendingItem({Key? key}) : super(key: key);

  @override
  State<SendingItem> createState() => _SendingItemState();
}

class _SendingItemState extends State<SendingItem> {
  var parser = EmojiParser();
  var coffee = Emoji('coffee', '☕');

  @override
  Widget build(BuildContext context) {
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Container(
              color: Colors.grey[100],
              child: parser.emojify(':coffee:  Food').text.bold.xl.make().p(12),
            ).cornerRadius(12).p8(),
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Theme.of(context).colorScheme.secondary, width: 2),
              ),
              child:
                  parser.emojify(':book:  Document').text.bold.xl.make().p(12),
            ).p8(),
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              color: Colors.grey[100],
              child:
                  parser.emojify(':shirt:  Cloths').text.bold.xl.make().p(12),
            ).cornerRadius(12).p12(),
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              color: Colors.grey[100],
              child: parser.emojify(':key:  Keys').text.bold.xl.make().p(12),
            ).cornerRadius(12).p12(),
          ),
        ),
      ],
    );
  }
}
