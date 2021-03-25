//
//  AnimalType.swift
//  CityQuiz
//
//  Created by mac on 25.03.2021.
//

enum CityType: String {
    case spb = "Санкт-Петербург"
    case dubai = "Дубай"
    case dikson = "Диксон"
    case colombo = "Коломбо"
    
    var definition: String {
        switch self {
        case .spb:
            return "Вы любите неспеша прогуляться и помечтать."
        case .dubai:
            return "Вы покоритель пустыни! Засуха и тонны песка не мешают вам наслаждаться жизнью."
        case .dikson:
            return "Вы отлично поладите с моржами! Румяные щеки и пар изо рта - ваши любимые атрибуты."
        case .colombo:
            return "Тропический климат, океан и яркие краски, что еще нужно для счастья!"
        }
    }
}
