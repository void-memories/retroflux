package com.voidmemories.retroflux.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.voidmemories.retroflux.ui.theme.greyDivider

@Composable
fun HistoryItem(){
  Row(verticalAlignment = Alignment.CenterVertically, modifier = Modifier.padding(top = 12.dp)) {
    Text(text = "\uD83D\uDE80", style = TextStyle(fontSize = 24.sp), modifier = Modifier.padding(start = 12.dp, end = 12.dp))
    Column() {
      Row(horizontalArrangement = Arrangement.SpaceBetween,modifier = Modifier
        .fillMaxWidth()
        .padding(start = 4.dp, end = 12.dp, bottom = 8.dp),) {
        Column(verticalArrangement = Arrangement.Center, horizontalAlignment = Alignment.Start) {
          Text("August 8th, 2022", modifier = Modifier.padding(bottom = 4.dp), style = MaterialTheme.typography.bodyMedium)
          Text("a smooth enjoyable day.", style = MaterialTheme.typography.bodySmall)
        }

        Column(verticalArrangement = Arrangement.Center, horizontalAlignment = Alignment.End ) {
          Text("9.67", modifier = Modifier.padding(bottom = 4.dp), style = MaterialTheme.typography.bodyMedium)
          Text("Perfect", style = MaterialTheme.typography.bodySmall)
        }

      }
      Box(modifier = Modifier
        .height(1.dp)
        .background(greyDivider)
        .fillMaxWidth())
    }
  }
}
