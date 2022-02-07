import 'package:flutter/material.dart';
import 'package:dijkstra/dijkstra.dart';

Future dialogEditPoint(
    BuildContext context,
    var e,
    int id,
    int prev,
    int inicio,
    Function centralizar,
    var widget,
    List<Map<dynamic, dynamic>> points,
    var graph) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Ponto ${e["id"]}"),
        content: Text("X = ${e["x"]}\nY = ${e["y"]}\nPrev = ${e['vizinhos']}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          TextButton(
            onPressed: e["id"] == id
                ? () {
                    points.remove(e);

                    Navigator.pop(context);
                  }
                : null,
            child: const Text(
              "Remover",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          TextButton(
            onPressed: () {
              prev = e["id"];
              Navigator.pop(context);
            },
            child: const Text(
              "Usar como anterior",
              style: TextStyle(color: Colors.green),
            ),
          ),
          TextButton(
            child: const Text(
              "Objetivo",
              style: TextStyle(color: Colors.deepPurple),
            ),
            onPressed: () async {
              // TODO: Caminho melhor
              // fechar pop up
              Navigator.pop(context);

              // lista do caminho a ser seguido
              List tracker = Dijkstra.findPathFromGraph(graph, 0, 1);
              tracker.removeAt(0);
              tracker.add(e["id"]);

              for (var i = 0; i < tracker.length; i++) {
                widget.person.setx = points
                    .firstWhere((element) => element['id'] == tracker[i])['x'];
                widget.person.sety = points
                    .firstWhere((element) => element['id'] == tracker[i])['y'];
                inicio = tracker[i];
                await Future.delayed(const Duration(seconds: 3));
                centralizar(true);
              }

              // pegando o ponto inicial
              // Map pointInit = points
              //     .where((element) =>
              //         element["x"] == widget.person.x &&
              //         element["y"] == widget.person.y)
              //     .first;

              // // traçar o caminho, caso o caminho seja de volta
              // while (pointInit["id"] != e["id"]) {
              //   tracker.add(e);
              //   e = points.where((element) => element["id"] == e["prev"]).first;
              // }

              // tracker = tracker.reversed.toList();

              // print(tracker);

              // for (var i = 0; i < tracker.length; i++) {
              //   widget.person.setx = tracker[i]["x"];
              //   widget.person.sety = tracker[i]["y"];
              //   inicio = tracker[i]["id"];
              //   await Future.delayed(const Duration(seconds: 2));
              //   centralizar(true);
              // }
            },
          ),
        ],
      );
    },
  );
}
