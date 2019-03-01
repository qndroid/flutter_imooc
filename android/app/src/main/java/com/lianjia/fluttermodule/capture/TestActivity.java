package com.lianjia.fluttermodule.capture;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import com.lianjia.fluttermodule.host.R;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class TestActivity extends AppCompatActivity {

  @Override protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_test);
    Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
    setSupportActionBar(toolbar);

    FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
    fab.setOnClickListener(new View.OnClickListener() {
      @Override public void onClick(View view) {
        String json = "{\"name\", \"renzhiqiang\"}";

        Intent intent = new Intent();
        intent.putExtra("result", json);

        setResult(RESULT_OK, intent);
        finish();
      }
    });

    Map data = (Map) getIntent().getSerializableExtra("params");
    Log.e("renzhiqing", data.get("user_name").toString());
  }
}
