package com.voidmemories.retroflux.ui.theme

import androidx.compose.material3.Typography
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Color.Companion
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp
import com.voidmemories.retroflux.R

// Set of Material typography styles to start with
val Roboto= FontFamily(
  Font(R.font.roboto_regular),
  Font(R.font.roboto_light,FontWeight.Light),
  Font(R.font.roboto_medium,FontWeight.Medium),
  Font(R.font.roboto_thin,FontWeight.Thin),
  )

val BebasNeue= FontFamily(
  Font(R.font.bebasneue_regular),
)

val Typography = Typography(
  headlineMedium = TextStyle(
    fontFamily = BebasNeue,
    fontWeight = FontWeight.Normal,
    fontSize = 16.sp,
    letterSpacing = 1.3.sp,
    color = Color.Black
  ),

  bodyLarge = TextStyle(
    fontFamily = Roboto,
    fontWeight = FontWeight.Normal,
    fontSize = 24.sp,
    color = Color.Black
  ),

  bodyMedium = TextStyle(
    fontFamily = Roboto,
    fontWeight = FontWeight.Normal,
    fontSize = 12.sp,
    color = accentColor
  ),

  bodySmall = TextStyle(
    fontFamily = Roboto,
    fontWeight = FontWeight.Normal,
    fontSize = 10.sp,
    color = greyTextColor
  ),

  titleSmall =TextStyle(
    fontFamily = Roboto,
    fontWeight = FontWeight.Light,
    fontSize = 32.sp,
    color = secondaryAccentColor
  ),

  titleMedium =TextStyle(
    fontFamily = Roboto,
    fontWeight = FontWeight.Medium,
    fontSize = 16.sp,
    color = accentColor
  ),

  titleLarge =TextStyle(
    fontFamily = Roboto,
    fontWeight = FontWeight.Medium,
    fontSize = 48.sp,

    color = accentColor,
  ),

)
