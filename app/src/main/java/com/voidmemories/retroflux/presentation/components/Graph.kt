package com.voidmemories.retroflux.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.width
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

@Composable
fun Graph(){
  val barColor=Color(0xffE4E4E4)
  Row(verticalAlignment = Alignment.Bottom, modifier = Modifier.fillMaxSize()) {
    Box(modifier = Modifier
      .height(80.dp)
      .weight(1f)
      .background(barColor))
    Spacer(modifier = Modifier.width(4.dp))
    Box(modifier = Modifier
      .height(54.dp)
      .weight(1f)
      .background(barColor))
    Spacer(modifier = Modifier.width(4.dp))
    Box(modifier = Modifier
      .height(63.dp)
      .weight(1f)
      .background(barColor))
    Spacer(modifier = Modifier.width(4.dp))
    Box(modifier = Modifier
      .height(26.dp)
      .weight(1f)
      .background(barColor))
    Spacer(modifier = Modifier.width(4.dp))
    Box(modifier = Modifier
      .height(68.dp)
      .weight(1f)
      .background(barColor))
    Spacer(modifier = Modifier.width(4.dp))
    Box(modifier = Modifier
      .height(98.dp)
      .weight(1f)
      .background(barColor))
    Spacer(modifier = Modifier.width(4.dp))
    Box(modifier = Modifier
      .height(55.dp)
      .weight(1f)
      .background(barColor))
  }
}
