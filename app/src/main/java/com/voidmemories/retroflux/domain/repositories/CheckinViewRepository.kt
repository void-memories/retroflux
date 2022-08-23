package com.voidmemories.retroflux.domain.repositories

import com.voidmemories.retroflux.data.models.ProductivityNumberDetailsModel

interface CheckinViewRepository {
  fun getProductivityNumberDetails(productivityNumber:Float):ProductivityNumberDetailsModel
  fun saveCheckin(checkinData:Map<String,Any>):ProductivityNumberDetailsModel
}
