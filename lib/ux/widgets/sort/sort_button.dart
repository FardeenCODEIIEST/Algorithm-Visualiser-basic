import 'package:algorithms_visualiser/providers/sort/sort_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortButton<T extends SortProvider> extends StatelessWidget {
  const SortButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Selector<BubbleSortProvider, bool>(
    // selector: (_, bubble) => bubble.isSorting,
    // builder: (_, data, child) {
    //   return RaisedButton(
    //       onPressed: data
    //           ? null
    //           : () {
    //               Provider.of<BubbleSortProvider>(context, listen: false)
    //                   .sort();
    //             },
    //       child: child);
    // },
    // child: const Text('Sort'));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Selector<T, bool>(
        selector: (_, provider) => provider.isSorting,
        builder: (_, isSorting, child) {
          return ElevatedButton(
            child: child,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shadowColor: MaterialStateProperty.all(Colors.blueGrey),
            ),
            onPressed: isSorting
                ? null
                : () {
                    Provider.of<T>(context, listen: false).sort();
                  },
          );
        },
        child: const Text('Sort', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
