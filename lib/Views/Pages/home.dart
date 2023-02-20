import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_hidden_photo/Cubits/HomeCubit/home_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_hidden_photo/Cubits/ResultCubit/result_cubit.dart';
import 'package:my_hidden_photo/Views/Pages/result.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hidden"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: BlocConsumer<HomeCubit, HomeCubitState>(
          builder: (context, state) {
            return state.when(
              loadingDefault: () => buildDefault(),
              main: (
                Image image1,
                Image image2,
                bool decode1Available,
                bool decode2Available,
                bool codeAvailable,
                int codeDirection,
                int bitsToUse,
                int maxSideLength,
              ) {
                return buildMainView(context, image1, image2, decode1Available, decode2Available, codeAvailable,
                    codeDirection, bitsToUse, maxSideLength);
              },
              goToResults: (_) {
                return Center(child: Text("Please wait..."));
              },
              computing: (double percentage) {
                return Center(child: Text("Computing image..."));
              },
            );
          },
          listener: (context, state) {
            state.whenOrNull(goToResults: (Image image) {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: ((context, animation, secondaryAnimation) {
                    return Result(image);
                  }),
                ),
              ).then((value) => BlocProvider.of<HomeCubit>(context).emitMainState());
            });
          },
        ),
      ),
    );
  }

  Widget buildDefault() {
    return Container();
  }

  Widget buildMainView(BuildContext context, Image image1, Image image2, bool decode1Available, bool decode2Available,
      bool codeAvailable, int codeDirection, int bitsToUse, int maxSideLength) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 1,
                child: imageWithDecode(context, image1, decode1Available, 1),
              ),
            ),
            IconButton(
                onPressed: () {
                  BlocProvider.of<HomeCubit>(context).changeCodeDirection();
                },
                iconSize: 40,
                padding: EdgeInsets.all(0),
                icon: codeDirection == 1 ? Icon(Icons.west) : Icon(Icons.east),
                visualDensity: VisualDensity.compact),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 1,
                child: imageWithDecode(context, image2, decode2Available, 2),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: ElevatedButton(
            onPressed: !codeAvailable
                ? null
                : () {
                    BlocProvider.of<HomeCubit>(context).code();
                  },
            child: Text("Code"),
          ),
        ),
        Text(
          "Bit to use",
          style: textTheme.labelLarge,
          textAlign: TextAlign.left,
        ),
        Text(
          "Increasing this will increase the hidden image resolution but might make it noticable in the host image.",
          style: textTheme.bodySmall!.copyWith(color: Colors.grey),
        ),
        Slider(
          value: bitsToUse.toDouble(),
          label: bitsToUse.toString(),
          onChanged: (double value) {
            BlocProvider.of<HomeCubit>(context).bitNumberChanged(value);
          },
          min: 1,
          max: 8,
          divisions: 7,
        ),
        Text("Max output side length", style: textTheme.labelLarge),
        Text(
          "Reduce the size of the longest size of the host image to this value if it is greater. Increasing this will raise computing time.",
          style: textTheme.bodySmall!.copyWith(color: Colors.grey),
        ),
        Slider(
          value: maxSideLength.toDouble(),
          label: maxSideLength.toString(),
          onChanged: (double value) {
            print(maxSideLength);
            BlocProvider.of<HomeCubit>(context).maxSideLengthChanged(value);
          },
          min: 200,
          max: 4000,
          divisions: 4000 - 200,
        ),
      ],
    );
  }

  Widget imageWithDecode(BuildContext context, Image image, bool decodeAvailable, int slot) {
    return Column(
      children: [
        image,
        ElevatedButton(
          onPressed: () {
            final ImagePicker _picker = ImagePicker();
            _picker.getImage(source: ImageSource.gallery).then((value) {
              if (value != null) {
                final cubit = BlocProvider.of<HomeCubit>(context);
                cubit.imagePicked(value, slot);
              }
            });
          },
          child: Text("Pick image"),
        ),
        ElevatedButton(
          onPressed: decodeAvailable
              ? () {
                  BlocProvider.of<HomeCubit>(context).decode(slot);
                }
              : null,
          child: Text("Decode"),
        )
      ]
          .map((e) => Padding(
                padding: EdgeInsets.all(5),
                child: e,
              ))
          .toList(),
    );
  }
}
