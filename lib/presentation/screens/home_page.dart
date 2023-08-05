import 'package:flutter/material.dart';
import 'package:prov/data/providers/movie_provider.dart';
import 'package:provider/provider.dart';

import '../../data/const/const.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
  final vm = context.watch<MovieProvide>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            children: [
               TextField(controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),const SizedBox(height: 25,),
              ElevatedButton(
                onPressed: () {
                  context.read<MovieProvide>().getMovie(controller.text);
                  },
                child: const Icon(Icons.search),
              ),const SizedBox(height: 25,),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: vm.data?.search?.length ?? 0, 
                itemBuilder:(context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('${ vm.data?.search?[index].title}',
                    textAlign: TextAlign.center, 
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25,),
                      Image.network(
                        vm.data?.search?[index].poster ?? Consts.errorImage,
                        height: 400, 
                        width: double.infinity,
                      ), const SizedBox(height: 25,),
                      Text('${ vm.data?.search?[index].year}',
                    textAlign: TextAlign.center, 
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),const Divider(thickness: 10, height: 10,color: Colors.black,)
                    ],
                  ),
                )
                ,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
