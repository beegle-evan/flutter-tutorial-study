package com.beegle.labs.clone.flutter_tutorial_study

import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    companion object {
        const val CHANNEL = "example.com/value"
    }

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)

//        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { methodCall, result ->
//            if (methodCall.method == "getValue") {
//                result.success("성공")
//            } else {
//                result.notImplemented()
//            }
//        }
    }
}
