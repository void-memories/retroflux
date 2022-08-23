package com.voidmemories.retroflux.presentation.components

import android.util.Log
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.CutCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Color.Companion
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import com.voidmemories.retroflux.presentation.routes.View
import com.voidmemories.retroflux.ui.theme.accentColor

@Composable
fun CustomButton(text:String,navController: NavController?,isHomepage:Boolean){
  Button(modifier = Modifier
    .padding(top = 24.dp)
    .fillMaxWidth()
    .height(50.dp), colors = ButtonDefaults.buttonColors(accentColor), shape = CutCornerShape(8),onClick = {
    if(isHomepage) navController?.navigate(View.CheckinView.route) else navController?.popBackStack()
  }) {
    Text(text = text, style = MaterialTheme.typography.bodyMedium.copy(color = Color.White))
  }
}
