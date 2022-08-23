package com.voidmemories.retroflux.presentation.views

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.wrapContentSize
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.CutCornerShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.material.OutlinedTextField
import androidx.compose.material.Slider
import androidx.compose.material.SliderColors
import androidx.compose.material.SliderDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Shape
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextAlign.Companion
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import com.voidmemories.retroflux.presentation.components.ColorPicker
import com.voidmemories.retroflux.presentation.components.CustomButton
import com.voidmemories.retroflux.presentation.components.Navbar
import com.voidmemories.retroflux.ui.theme.PurpleGrey40


@Composable
fun CheckinView(navController: NavController){
  var inputText by remember { mutableStateOf("") }

  Column(modifier = Modifier
    .padding(24.dp), horizontalAlignment = Alignment.CenterHorizontally,){
    Navbar(isHomepage=false,navController=navController)
    Text(text = "Checkin", style = MaterialTheme.typography.bodyLarge, modifier = Modifier.padding(top = 28.dp))
    Text(text = "Fill the below details to complete today’s check-in.", style = MaterialTheme.typography.bodySmall, modifier = Modifier
      .padding(top = 4.dp, bottom = 40.dp)
      .width(180.dp), textAlign = TextAlign.Center)

    OutlinedTextField(value = inputText ,onValueChange = {if(it.length<=50)inputText=it}, modifier = Modifier
      .fillMaxWidth()
      .height(50.dp), placeholder = { Text(
      text = "Describe your day in less than 50 characters.", style = MaterialTheme.typography.bodySmall,
    )})

    Row(horizontalArrangement = Arrangement.SpaceBetween, modifier = Modifier.padding(start = 8.dp, end = 8.dp, top = 8.dp, bottom = 24.dp).fillMaxWidth()) {
      Text(text = "Eg. a smooth trip", style = MaterialTheme.typography.bodySmall)
      Text(text = "${inputText.length}/50", style = MaterialTheme.typography.bodySmall)
    }

    ColorPicker()
    Spacer(modifier = Modifier.weight(1f))
    CustomButton(text="Save",navController,false)
  }
}
