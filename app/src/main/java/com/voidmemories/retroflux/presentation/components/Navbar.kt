package com.voidmemories.retroflux.presentation.components

import android.app.Activity
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import com.voidmemories.retroflux.ui.theme.warningColor

@Composable
fun Navbar(isHomepage:Boolean,navController: NavController){
  val activity = (LocalContext.current as? Activity)
  Row(modifier = Modifier
    .fillMaxWidth()
    .padding(bottom = 24.dp),horizontalArrangement = Arrangement.SpaceBetween) {
    Text(text = "RETROLUX", style = MaterialTheme.typography.headlineMedium)
    Text(text = if(isHomepage)"EXIT" else "BACK", style = MaterialTheme.typography.headlineMedium.copy(color= warningColor), modifier = Modifier.clickable { if(!isHomepage)navController.popBackStack() else{
        activity?.finish()
    }
    })
  }
}
