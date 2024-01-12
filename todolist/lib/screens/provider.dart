// this is not part of project this only for my basic learning about provider ,........

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const op());
}

class op extends StatelessWidget {
  const op({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) {
        return Data();
      },
      child: MaterialApp(
        home: Scaffold(
            // appBar: AppBar(title: mytext()),
            body: Column(
          children: [level1(), level2(), level3()],
        )),
      ),
    );
  }
}

class level1 extends StatelessWidget {
  const level1({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context, listen: true).data);
  }
}

class level2 extends StatelessWidget {
  const level2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: mytextfield(),
    );
  }
}

class level3 extends StatelessWidget {
  const level3({super.key});

  @override
  Widget build(BuildContext context) {
    return mytext();
  }
}

class mytext extends StatelessWidget {
  const mytext({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context, listen: true).data);
  }
}

class mytextfield extends StatelessWidget {
  const mytextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(onChanged: ((value) {
      Provider.of<Data>(context, listen: false).chnagedata(value);
    }));
  }
}

class Data extends ChangeNotifier {
  String data = "";

  chnagedata(value) {
    this.data = value;
    notifyListeners();
  }
}
