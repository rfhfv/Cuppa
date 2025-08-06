//
//  MainPresenter.swift
//  Cuppa
//
//  Created by admin on 30.07.2025.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    
    var categoryData: [DrinkCategory] { get }
    var drinkMenuData: [DrinkMenu] { get }
    var newsCategoryData: [NewsCategory] { get }
    var descriptionCategoryData: [DescriptionCategoty] { get }
    
    func gerSelectedCategory() -> DrinkCategory
    func gerSelectedMenyuCategory()  -> DrinkMenu
    func getSelectedNewsCatogory() -> NewsCategory
    func getSelectedDescriptionCategory() -> DescriptionCategoty
}
 
class HomePresenter: HomePresenterProtocol {
 
    let coordinator: HomeCoordinator
    // MARK: - Properties
    
    var categoryData: [DrinkCategory] = []
    var drinkMenuData: [DrinkMenu] = []
    var newsCategoryData: [NewsCategory] = []
    var descriptionCategoryData: [DescriptionCategoty] = []
    
    // MARK: - Initializers
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        getCategotyData()
        getCategoryMenuData()
        getCategoryNewsData()
        getCategoryDescriptionData()
    }
    
    // MARK: - Methods
    
    func gerSelectedCategory() -> DrinkCategory {
        return .none
    }
    
    func gerSelectedMenyuCategory() -> DrinkMenu {
        return .none
    }
    
    func getSelectedNewsCatogory() -> NewsCategory {
        return .none
    }
    
    func getSelectedDescriptionCategory() -> DescriptionCategoty {
        return .none
    }
    
    private func getCategotyData() {
        categoryData = [.coffee, .tea, .milkshake, .matcha, .soda, .water, .food]
    }
    
    private func getCategoryMenuData() {
        drinkMenuData = [.milkyWay, .milkNut, .iceWorld, .smallMoon, .firstLull, .sleepyOwl, .warmDawn, .purpleSky, .youngDew, .happyEnd, .truelove, .pureHeart, .softTouch, .wildFire]
    }
    
    private func  getCategoryNewsData() {
        newsCategoryData = [.firstNews, .secondNews, .thirdNews, .fourthNews, .fifthNews, .sixthNews, .seventhNews]
    }
    
    private func getCategoryDescriptionData() {
        descriptionCategoryData = [.first, .second, .third, .fourth, .fifth, .sixth, .seventh]
    }
}
