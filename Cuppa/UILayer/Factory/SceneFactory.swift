//
//  SceneFactory.swift
//  Cuppa
//
//  Created by admin on 01.08.2025.
//

import UIKit

struct SceneFactory {
    // MARK: - Onboarding flow
    
    static func makeOnBoardingFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) -> OnboardingCoordinator {
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: finishDelegate)
        
        coordinator.addChildCoordinator(onboardingCoordinator)
        return onboardingCoordinator
    }
    
    static func makeLoginFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) -> LoginCoordinator {
        let loginCoordinator = LoginCoordinator(type: .login, navigationController: navigationController, finishDelegate: finishDelegate)
        
        coordinator.addChildCoordinator(loginCoordinator)
        return loginCoordinator
    }
    
    static func makeOnboardingScene(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        
        var pages = [OnboardingPartViewController]()
        
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow = UIImage(named: "Explore")
        firstVC.titleText = "Explore a world of taste"
        firstVC.descriptionText = "Experience the authentic flavor, where every detail contributes to the overall enjoyment."
        firstVC.buttonText = "Next"
        
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow = UIImage(named: "Coffee")
        secondVC.titleText = "Your perfect coffee"
        secondVC.descriptionText = "Our coffee is not just a beverage — it's a source of happiness."
        secondVC.buttonText = "Next"
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow = UIImage(named: "Community")
        thirdVC.titleText = "Our community"
        thirdVC.descriptionText = "Join our coffee community, where every guest is special and every visit is unforgettable"
        thirdVC.buttonText = "Cool!"
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        let  presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        
        return viewController
    }
    
    // MARK: - Main flow
    
    static func makeMainFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        
        let homeNavigatationcontroller = UINavigationController()
        let homeCootdinator = HomeCoordinator(type: .home, navigationController: homeNavigatationcontroller)
        homeCootdinator.finishDelegate = finishDelegate
        homeNavigatationcontroller.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "house"), tag: 0)
        homeCootdinator.finishDelegate = finishDelegate
        homeCootdinator.start()
        
        let orderNavigatationcontroller = UINavigationController()
        let orderCootdinator = OrderCoordinator(type: .order, navigationController: orderNavigatationcontroller)
        orderCootdinator.finishDelegate = finishDelegate
        orderNavigatationcontroller.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "heart.text.square"), tag: 1)
        orderCootdinator.start()
        
        let listNavigatationcontroller = UINavigationController()
        let listCootdinator = ListCoordinator(type: .list, navigationController: listNavigatationcontroller)
        listCootdinator.finishDelegate = finishDelegate
        listNavigatationcontroller.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "bookmark"), tag: 2)
        listCootdinator.start()
        
        let profileNavigatationcontroller = UINavigationController()
        let profileCootdinator = ProfileCoordinator(type: .profile, navigationController: profileNavigatationcontroller)
        profileCootdinator.finishDelegate = finishDelegate
        profileNavigatationcontroller.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "person"), tag: 3)
        profileCootdinator .start()
        
        coordinator.addChildCoordinator(homeCootdinator)
        coordinator.addChildCoordinator(orderCootdinator)
        coordinator.addChildCoordinator(listCootdinator)
        coordinator.addChildCoordinator(profileCootdinator)
        
        let tabBarControllers = [homeNavigatationcontroller, orderNavigatationcontroller, listNavigatationcontroller, profileNavigatationcontroller]
        
        let tabBarController = TabBarController(tabBarController: tabBarControllers)
        
        return  tabBarController
    }
    
    static func makeAuthScene(coordinator: LoginCoordinator) -> LoginViewController {
        let presenter = LoginPresenter(coordinator: coordinator)
        let controller = LoginViewController(viewOutput: presenter, state: .initial)
        presenter.viewInput = controller
        return controller
    }
    
    static func makeSignInScene(coordinator: LoginCoordinator) -> LoginViewController {
        let presenter = LoginPresenter(coordinator: coordinator)
        let controller = LoginViewController(viewOutput: presenter, state: .signIn)
        presenter.viewInput = controller
        return controller
    }
    
    static func makeSignUpScene(coordinator: LoginCoordinator) -> LoginViewController {
        let presenter = LoginPresenter(coordinator: coordinator)
        let controller = LoginViewController(viewOutput: presenter, state: .signUp)
        presenter.viewInput = controller
        return controller
    }
    
    static func makeHomeScene(coordinator: HomeCoordinator) -> HomeViewController {
        let presenter = HomePresenter(coordinator: coordinator)
        let controller = HomeViewController(presenter: presenter)
        return controller
    }
    
    static func makeOrderScene(coordinator: OrderCoordinator) -> OrderViewController {
        let presenter = OrderPresenter(coordinator: coordinator)
        let controller = OrderViewController(presenter: presenter)
        return controller
    }
    
    static func makeListScene(coordinator: ListCoordinator) -> ListViewController {
        let presenter = ListPresenter(coordinator: coordinator)
        let controller = ListViewController(presenter: presenter)
        return controller
    }
    
    static func makeProfileScene(coordinator: ProfileCoordinator) -> ProfileViewController {
        let presenter = ProfilePresenter(coordinator: coordinator)
        let controller = ProfileViewController(presenter: presenter)
        return controller
    }
}
