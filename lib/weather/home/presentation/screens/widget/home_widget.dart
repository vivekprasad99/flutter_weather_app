import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_app/core/widget/toast/toast.dart';
import 'package:flutter_weather_app/weather/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_weather_app/weather/home/presentation/screens/widget/weather_widget.dart';

import '../../../../../core/widget/network_sensitive/presentation/internet_sensitive.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});

  final TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.teal,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if(state is WeatherFailureState)
            {
              toastForFailureMessage(
                  context: context,
                  msg: state.failure.message ?? "");
            }
        },
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.teal, Colors.teal, Colors.lightBlue])),
            child: InternetSensitive(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      searchWidget(context),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildWeatherWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget searchWidget(BuildContext context) {
    bool isLoadingg = false;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is LoadingState) {
          isLoadingg = state.isloading;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: searchBox(context)),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: isLoadingg
                  ? null
                  : () {
                    getWeatherData(context);
                    _searchText.clear();
                    FocusScope.of(context).unfocus();
                    },
              child: CircleAvatar(
                radius: 26,
                backgroundColor: isLoadingg ? Colors.grey : Colors.white,
                child: const Icon(Icons.search),
              ),
            )
          ],
        );
      },
    );
  }

  Widget searchBox(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: _searchText,
        onChanged: (String value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: InkWell(
            child: const Icon(Icons.close),
            onTap: () {
              _searchText.clear();
              FocusScope.of(context).unfocus();
            },
          ),
          hintText: 'Enter your City name...',
          contentPadding: const EdgeInsets.all(16),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(26)),
          ),
        ),
      ),
    );
  }

  Widget buildWeatherWidget() {
    return BlocBuilder<HomeCubit, HomeState>(buildWhen: (prev, cur) {
      return prev is WeatherSuccessState != cur is WeatherSuccessState ||
          prev is LoadingState != cur is LoadingState;
    }, builder: (context, state) {
      if (state is LoadingState && state.isloading) {
        return Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
          child: Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).indicatorColor,
            strokeWidth: 4,
          )),
        );
      } else if (state is WeatherSuccessState &&
          (state.weatherModel?.name?.isNotEmpty ?? false)) {
        return WeatherWidget(state.weatherModel);
      }
      return buildEmptyWidgets(context);
    });
  }

  Widget buildEmptyWidgets(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 72),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/ic_no_data_found.svg',
            ),
          ],
        ),
      ),
    );
  }

  void getWeatherData(BuildContext context)
  {
    if(_searchText.text.length > 2)
      {
        BlocProvider.of<HomeCubit>(context)
            .getWeatherData(_searchText.text);
      }else {
      toastForFailureMessage(
          context: context,
          msg: "Please enter atleast three letter");
    }
  }
}
