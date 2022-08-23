package com.voidmemories.retroflux.presentation.views

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Alignment.Companion
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import com.voidmemories.retroflux.presentation.components.CustomButton
import com.voidmemories.retroflux.presentation.components.Dashboard
import com.voidmemories.retroflux.presentation.components.HistoryItem
import com.voidmemories.retroflux.presentation.components.Navbar

@Composable
fun HomeView(navController: NavController){
  val sampleHistoryItems= listOf("1","2","3","2","3","2","3","2","3","2","3","2","3","2","3","2","3")
  Column(modifier = Modifier
    .padding(24.dp), horizontalAlignment = Alignment.CenterHorizontally,) {
    Navbar(isHomepage=true,navController)
    Dashboard()
    Row(verticalAlignment = Alignment.CenterVertically, modifier = Modifier.padding(top = 20.dp, bottom = 12.dp)) {
      Text(text = "The history of you", style = MaterialTheme.typography.titleMedium, modifier = Modifier.padding(end = 12.dp))
      Box(modifier = Modifier
        .background(Color.Black)
        .height(2.dp)
        .fillMaxWidth()
      )
    }
    LazyColumn(modifier = Modifier.weight(1f)){
      items(sampleHistoryItems){item->HistoryItem()}
    }

    CustomButton(text="Check-in your productivity",navController,true)
  }
}
