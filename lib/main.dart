// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Thanks for checking out Flutter!
// Like what you see? Tweet us @flutterio

import 'package:flutter/material.dart';
import 'views/loading.dart';
import 'theme/options.dart';
import 'test.dart';

class ImoocApp extends StatelessWidget {
  static final String pageTitle = 'Imooc';

  showLoadingPage() {
    return LoadingPage();
  }

  @override
  Widget build(BuildContext context) {
    //构建app的loading页面
    return MaterialApp(
      title: pageTitle,
      theme: initOptions.theme.data.copyWith(platform: initOptions.platform),
      home: showLoadingPage(),
    );
  }
}

void main() {
  runApp(ImoocApp());
}
