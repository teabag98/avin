import 'package:dog_project/controller/api_client.dart';
import 'package:dog_project/view/selected_dog.dart';
import 'package:flutter/material.dart';
import 'package:dog_project/model/dog_model.dart';

class DogView extends StatefulWidget {
  const DogView({Key? key}) : super(key: key);

  @override
  _DogViewState createState() => _DogViewState();
}

class _DogViewState extends State<DogView> {
  ApiClient api = ApiClient();

  List<DogModel> _dogs = [];

  //build future to receive our list
  Future loadDogs() async {
    await api.getDogs().then((dogs) => setState(() {
          _dogs = dogs;
        }));
    return _dogs;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: loadDogs(),
              builder: (context, snapshot) {
                return Container(
                  color: Colors.white,
                  child: snapshot.hasData
                      ? ListView.builder(
                          itemCount: _dogs.length,
                          itemBuilder: ((context, index) {
                            print(_dogs[index].name);
                            return ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (cxt) => DogSelected(
                                              imageUrl: _dogs[index]
                                                  .image!
                                                  .url
                                                  .toString(),
                                              bredFor: _dogs[index].bredFor,
                                              weigth: _dogs[index]
                                                  .weight!
                                                  .metric
                                                  .toString(),
                                              name: _dogs[index].name,
                                              lifespan:
                                                  _dogs[index].lifeSpan))),
                                  child: Container(
                                    color: Colors.brown.withOpacity(0.2),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                          foregroundImage: NetworkImage(
                                              _dogs[index]
                                                  .image!
                                                  .url
                                                  .toString())),
                                      isThreeLine: true,
                                      subtitle: Text(
                                          "Bred for: ${_dogs[index].bredFor}"),
                                      //  trailing: Text( " ${_dogs[index].breedGroup}" ),
                                      title: Text(_dogs[index].name ?? ""),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }))
                      : Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: CircularProgressIndicator(
                              color: Colors.brown,
                            ),
                          ),
                        ),
                );
              },
            )
            // Container(child: ,)
            ),
      ),
    );
  }
}
