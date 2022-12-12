import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neurocare_task/data.dart';
import 'package:neurocare_task/drug.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data = Data();

  List<Drug> drugs = [];
  String valueToBeSearched = '';
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 100),
        child: Stack(
          children: [
            TextField(
              controller: textEditingController,
              onChanged: ((value) async {
                valueToBeSearched = value;
                if (valueToBeSearched.isEmpty) {
                  drugs.clear();
                  setState(() {});
                } else {
                  drugs.clear();
                  drugs = await data.getData(valueToBeSearched);
                  setState(() {});
                }
              }),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                suffixIcon: GestureDetector(
                    onTap: () {
                      textEditingController.clear();
                      drugs.clear();
                      setState(() {});
                    },
                    child: Icon(Icons.close)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              height: drugs.isEmpty ? 0 : 300,
              child: drugs.isEmpty
                  ? SizedBox(
                      height: 0,
                    )
                  : ListView.builder(
                      itemCount: drugs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            textEditingController.text = drugs[index].drugName!;
                            drugs.clear();
                            drugs = await data.getData(valueToBeSearched);

                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(drugs[index].drugName!),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
