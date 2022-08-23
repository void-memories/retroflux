package com.voidmemories.retroflux.data

class RemoteAPI {

  /* L1 -> 0-4 -> Not so good
  *  L2 -> 4-6 -> Good
  * L3 -> 6-8  -> Better
  * L4 -> 8-10 -> Best */

  fun getDataFromLevel(productivityLevel:Float):LinkedHashMap<String, Any>{
    val redHex=0xFFFF0000
    val yellowHex=0xFFFFFF00
    val greenHex=0xffB4FF15
    var responseObject=LinkedHashMap<String, Any>()


    val wordsL1= listOf("underperformance","unsatisfactory","poor","mediocre","abysmal","subpar","bummer","disappointing","regrettable","underachievement")
    val wordsL2= listOf("decent","good","modest","proper","respectable","feat","nice","reasonable","respect")
    val wordsL3= listOf("great","proud","showpiece","highlight","achievement","exemplary")
    val wordsL4= listOf("excellent","perfect","polished","exceptional","best")

    val emojiL1= listOf("\uD83D\uDE1E","\uD83D\uDE27","\uD83D\uDE3F","\uD83D\uDE2E\u200D\uD83D\uDCA8","\uD83E\uDD7A","\uD83D\uDE2D","\uD83D\uDE41")
    val emojiL2= listOf("\uD83D\uDE0A","\uD83D\uDE38","\uD83D\uDE42","\uD83D\uDE43")
    val emojiL3= listOf("\uD83E\uDD17","\uD83E\uDD29","\uD83D\uDE0C","\uD83D\uDE07","\uD83E\uDD2D","\uD83D\uDE0E","\uD83D\uDE80")
    val emojiL4= listOf("\uD83E\uDD70","\uD83C\uDF0B","\uD83D\uDD25","\uD83E\uDD95","\uD83C\uDF86","❤️\u200D\uD83D\uDD25","✨")


    if(productivityLevel<4){
      responseObject["word"]=wordsL1.random()
      responseObject["emoji"]=emojiL1.random()
    }
    else if(productivityLevel<6){
      responseObject["word"]=wordsL2.random()
      responseObject["emoji"]=emojiL2.random()
    }
    else if(productivityLevel<8){
      responseObject["word"]=wordsL3.random()
      responseObject["emoji"]=emojiL3.random()
    }
    else if(productivityLevel<10){
      responseObject["word"]=wordsL4.random()
      responseObject["emoji"]=emojiL4.random()
    }
    responseObject["color"]=floatArrayOf(productivityLevel.toFloat(),100f,50f)
    return responseObject
  }
}
