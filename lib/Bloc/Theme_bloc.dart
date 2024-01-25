  import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:login_fire_test/Bloc/Theme_event.dart';
abstract class ThemeBloc{}
  class theme extends Bloc<ThemeEvent,ThemeMode>{
  theme(): super(ThemeMode.light)
  {
    on<ThemeChanged>((event,emit){
      emit(event.isDark? ThemeMode.dark:ThemeMode.light);
    });

  }

  }