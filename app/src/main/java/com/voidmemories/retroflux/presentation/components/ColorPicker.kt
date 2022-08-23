package com.voidmemories.retroflux.presentation.components

import android.util.Log
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.CutCornerShape
import androidx.compose.material.Slider
import androidx.compose.material.SliderDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import android.graphics.Color as colz


@Composable
fun ColorPicker(){
  var sliderPosition by remember { mutableStateOf(0f) }
  val redHex=0xFFFF0000
  val yellowHex=0xFFFFFF00
  val greenHex=0xffB4FF15


  Column() {
    Box(modifier = Modifier
      .height(50.dp)
      .clip(shape = CutCornerShape(8))
      .fillMaxWidth()
      .background(
        Brush.horizontalGradient(
          0f to Color.Red,
          0.5f to Color.Yellow,
          1.0f to Color(0xffB4FF15)
        )
      )){
      Slider(value = sliderPosition, onValueChange ={
        sliderPosition=it

                                                    }, colors = SliderDefaults.colors(thumbColor = Color.Transparent, disabledThumbColor = Color.Transparent,activeTrackColor = Color.Transparent, disabledActiveTrackColor = Color.Transparent, inactiveTrackColor = Color.Transparent,))
    }
    Row(modifier = Modifier
      .fillMaxWidth()
      .padding(8.dp), horizontalArrangement = Arrangement.SpaceBetween) {
      Text(text = "Not so good", style = MaterialTheme.typography.bodySmall)
      Text(text = (sliderPosition*100).toString().substring(0,if((sliderPosition*100).toString().length==3) 3 else 5), style = MaterialTheme.typography.bodySmall.copy(fontWeight = FontWeight.Bold, color = Color(0xff555555)))
      Text(text = "Perfect", style = MaterialTheme.typography.bodySmall)
    }

    Box(modifier = Modifier
      .height(150.dp)
      .fillMaxWidth()
      .background(Color(colz.HSVToColor(floatArrayOf(sliderPosition*100,100.0f,50.0f)))))
  }
}
