import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_poc_with_socket/app/home_screen/home_screen_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          "https://azikar24.com/wp-content/uploads/2020/08/cropped-azikar24-logo-2048x2048.png",
          width: 40,
          height: 40,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocSelector<HomeScreenBloc, HomeScreenState, dynamic>(
              selector: (state) {
                return state.partnerName;
              },
              builder: (context, partnerName) {
                return Text(
                  partnerName,
                  style: Theme.of(context).textTheme.titleMedium,
                );
              },
            ),
            BlocSelector<HomeScreenBloc, HomeScreenState, bool>(
              selector: (state) {
                return state.isPartnerTyping;
              },
              builder: (context, isPartnerTyping) {
                return Text(
                  isPartnerTyping ? "Typing..." : "",
                  style: Theme.of(context).textTheme.titleMedium,
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
