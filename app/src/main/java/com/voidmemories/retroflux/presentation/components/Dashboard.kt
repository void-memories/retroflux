package com.voidmemories.retroflux.presentation.components

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Alignment.Companion
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.dp

@Composable
fun Dashboard(){
  Box(modifier = Modifier
    .height(150.dp)
    .fillMaxWidth()) {
    Graph()
    Column(modifier = Modifier.fillMaxSize(), verticalArrangement = Arrangement.Center, horizontalAlignment = Alignment.CenterHorizontally) {
      Text(
        text = buildAnnotatedString {
          withStyle(style = MaterialTheme.typography.titleLarge.toSpanStyle()
          ) {
            append("82.")
          }
          withStyle(MaterialTheme.typography.titleSmall.toSpanStyle()){
            append("54")
          }
        })

      Text(text = "Last 7 day’s performance", style = MaterialTheme.typography.bodySmall)
    }
  }
}
