

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_app/feature/cubit/cubit/travel_cubit_dart_cubit.dart';
import 'package:tutorial_app/feature/model/travel.model.dart';
import 'package:tutorial_app/feature/product/padding/padding_view.dart';

class TravelView extends StatefulWidget {
  const TravelView({Key? key}) : super(key: key);

  @override
  State<TravelView> createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> {
  final data = 'Where do you want to go today?';
  final data2 = 'Popular destinations near you';
  final data3 = 'see all';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TravelCubitDartCubit>(
      create: (context) => TravelCubitDartCubit()..fetcItems(),
      child: BlocConsumer<TravelCubitDartCubit, TravelCubitDartState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const PagePadding.all(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data, style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold)),
                   TextField(
                    onChanged: (value) {
                      context.read<TravelCubitDartCubit>().searchByItems(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data2, style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold)),
                      InkWell(
                        onTap: () {
                          context.read<TravelCubitDartCubit>().seeAllItems();
                        },
                        child: Text(
                          data3,
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).errorColor),
                        ),
                      ),
                    ],
                  ),
                 
                  Container(
                    height: 200,
                    child: _itemsCastle(context),
                  ),
                   Expanded(child: ListView.builder(
                    itemCount: state is TravelItemsSeeAll? state.images.length:0,
                    itemBuilder: (BuildContext context, int index) {
                      final image=(state as TravelItemsSeeAll).images[index];
                      return Image.asset(image) ;
                    },
                  ),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _itemsCastle(BuildContext context) {
    return BlocSelector<TravelCubitDartCubit, TravelCubitDartState, List<TravelModel>>(
      selector: (state) {
        return state is TravelItemsLoaded? state.items:context.read<TravelCubitDartCubit>().allItems;
      },
      builder: (context, state) {
         return ListView.builder(
                    itemCount:state.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: SizedBox(width: 130, child: Image.asset(TravelModel.mockItems[index].imagePath)),
                      );
                    },
                  );
      },
    );

   
  }
}
