// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ImoocTheme {
  //私有构造方法,不允许外部直接创建对象
  const ImoocTheme._(this.name, this.data);

  final String name;
  final ThemeData data;
}

//创建好所有的主题，语法基本就是java和js的结合，直接使用定义在其它文件中的变量
final ImoocTheme kDarkGalleryTheme = ImoocTheme._('Dark', _buildDarkTheme());
final ImoocTheme kLightGalleryTheme = ImoocTheme._('Light', _buildLightTheme());

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    title: base.title.copyWith(
      fontFamily: 'GoogleSans',
    ),
  );
}

ThemeData _buildDarkTheme() {
  const Color primaryColor = Color(0xFF0175c2);
  const Color secondaryColor = Color(0xFF13B9FD);
  final ThemeData base = ThemeData.dark();
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  return base.copyWith(
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    accentColor: secondaryColor,
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF202124),
    backgroundColor: const Color(0xFFDDDDDD),
    errorColor: const Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}

ThemeData _buildLightTheme() {
  const Color primaryColor = Color(0xFFFED952);
  const Color secondaryColor = Color(0xFF13B9FD);
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Color(0xFFEFEFF4),
    errorColor: const Color(0xFFB00020),
    hintColor: const Color(0xFFcdcdcd),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}
