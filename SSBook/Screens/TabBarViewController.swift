//
//  TabBarViewController.swift
//  SSBook
//
//  Created by Victor Vieira on 24/09/22.
//

import UIKit


class TabBarViewController: UIViewController {
  
  let tabBarVc = UITabBarController()
  let arrayViews = [UINavigationController(rootViewController:
                                            HomeViewController(viewModel: HomeViewModel(userModel: "", favoriteBooksModel: [], favoriteAuthorsModel: [], allBooksModel: [], categoriesBook: []))),
                    
                    UINavigationController(rootViewController: ScreenAddViewController()),
                    
                    UINavigationController(rootViewController: ScreenSearchViewController()),
                    
                    UINavigationController(rootViewController: ScreenFavoritesViewController())]
  
  
  let arrayNamesItens = ["Início", "Adicionar", "Buscar", "Favoritos"]
  let itensTabBarNames = ["house.fill", "plus.circle","magnifyingglass", "heart.fill"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 147/255, green: 108/255, blue: 223/255, alpha: 1)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    tabBarVc.setViewControllers(arrayViews, animated: false)
    tabBarVc.modalPresentationStyle = .fullScreen
    tabBarVc.tabBar.backgroundColor = .white
    tabBarVc.tabBar.isTranslucent = false
    tabBarVc.tabBar.barTintColor = .white
    tabBarVc.tabBar.tintColor = UIColor(red: 160/255, green: 118/255, blue: 242/255, alpha: 1)
    
    for x in 0..<arrayNamesItens.count{
      arrayViews[x].title = arrayNamesItens[x]
    }
    guard let items = tabBarVc.tabBar.items else{
      return
    }
    for x in 0..<itensTabBarNames.count{
      items[x].image = UIImage(systemName: itensTabBarNames[x])
    }
    present(tabBarVc, animated: false, completion: nil)
    
  }
}

