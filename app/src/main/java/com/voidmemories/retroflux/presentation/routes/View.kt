package com.voidmemories.retroflux.presentation.routes

sealed class View(val route:String) {
  object HomeView:View("home_view")
  object CheckinView:View("checkin_view")
}
