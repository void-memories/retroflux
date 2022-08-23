package com.voidmemories.retroflux.data.repositoryImpl

import com.voidmemories.retroflux.data.RemoteAPI
import com.voidmemories.retroflux.data.models.ProductivityNumberDetailsModel
import com.voidmemories.retroflux.domain.repositories.CheckinViewRepository


//class CheckinViewRepositoryImpl : CheckinViewRepository {
//  val remoteAPI:RemoteAPI= RemoteAPI()
//
//  override fun getProductivityNumberDetails(productivityNumber: Float): ProductivityNumberDetailsModel {
//    val response=remoteAPI.getDataFromLevel(productivityNumber)
//    return ProductivityNumberDetailsModel(word = response["word"] as String, emoji = response["emoji"] as String, color = response["color"] as ArrayList<Float> /* = java.util.ArrayList<kotlin.Float> */)
//  }
//}
