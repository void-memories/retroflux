package com.voidmemories.retroflux.presentation.routes

import androidx.compose.runtime.Composable
import androidx.navigation.NavController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.voidmemories.retroflux.presentation.views.CheckinView
import com.voidmemories.retroflux.presentation.views.HomeView

@Composable
fun Navigation() {
 val navController= rememberNavController()
 NavHost(navController = navController, startDestination = View.HomeView.route){
  composable(route = View.HomeView.route){
   HomeView(navController = navController)
  }
  composable(route = View.CheckinView.route){
   CheckinView(navController=navController)
  }
 }

}
