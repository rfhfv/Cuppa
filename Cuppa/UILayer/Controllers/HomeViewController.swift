//
//  MainViewController.swift
//  Cuppa
//
//  Created by admin on 29.07.2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let presenter: HomePresenterProtocol
    
    // MARK: - Views
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let searchField = FDSearchField()
    private let bigHCollectionTitle = FDCollectionTitle()
    private let bigVCollectionTitle = FDCollectionTitle()
    private let geoMarkImage = UIImageView()
    private let geoLabel = UILabel()
    
    lazy var smallHCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.headerReferenceSize = .zero
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 1
        return collection
    }()
    
    lazy var bigHCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.headerReferenceSize = .zero
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 2
        return collection
    }()
    
    lazy var bigVCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = .zero
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isScrollEnabled = false
        collection.tag = 3
        return collection
    }()
    
    // MARK: - Initializers
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lificycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Layout

extension HomeViewController {
    func setupLayout() {
        setupview()
        configureScrollView()
        configureContentView()
        prepareScrollView()
        configureSearchField()
        configureGeoMark()
        configureGeoLabel()
        setupSmallCollection()
        configureHBigCollectionTitle()
        setupBigCollection()
        configureVBigCollectionTitle()
        setupBigVCollection()
        calculateContentSize()
    }
    
    func setupview() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }
    
    func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .clear
    }
    
    func configureContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .clear
    }
    
    func prepareScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func configureSearchField() {
        contentView.addSubview(searchField)
        searchField.translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            searchField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            searchField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            searchField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureGeoMark() {
        contentView.addSubview(geoMarkImage)
        geoMarkImage.image = UIImage(named: "geoMark")
        geoMarkImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            geoMarkImage.heightAnchor.constraint(equalToConstant: 20),
            geoMarkImage.widthAnchor.constraint(equalToConstant: 18),
            geoMarkImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            geoMarkImage.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 10)
        ])
    }
    
    func configureGeoLabel() {
        contentView.addSubview(geoLabel)
        geoLabel.text = "9 West 46 Th Street, New York City"
        geoLabel.translatesAutoresizingMaskIntoConstraints = false
        geoLabel.numberOfLines = 0
        geoLabel.font = UIFont.systemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            geoLabel.centerYAnchor.constraint(equalTo: geoMarkImage.centerYAnchor, constant: 0),
            geoLabel.leadingAnchor.constraint(equalTo: geoMarkImage.leadingAnchor, constant: 25),
            geoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            geoLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    func setupSmallCollection() {
        contentView.addSubview(smallHCollection)
        smallHCollection.backgroundColor = .clear
        smallHCollection.translatesAutoresizingMaskIntoConstraints = false
        smallHCollection.delegate = self
        smallHCollection.dataSource = self
        smallHCollection.register(SmallHCViewCell.self, forCellWithReuseIdentifier: "SmallHCViewCell")
        smallHCollection.showsHorizontalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            smallHCollection.topAnchor.constraint(equalTo: geoLabel.topAnchor, constant: 50),
            smallHCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            smallHCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            smallHCollection.heightAnchor.constraint(equalToConstant: 91)
        ])
    }
    
    func configureHBigCollectionTitle() {
        contentView.addSubview(bigHCollectionTitle)
        bigHCollectionTitle.text = "Author's Menu"
        bigHCollectionTitle.textColor = .black
        bigHCollectionTitle.isUserInteractionEnabled = false
        bigHCollectionTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        bigHCollectionTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bigHCollectionTitle.topAnchor.constraint(equalTo: smallHCollection.bottomAnchor, constant: 30),
            bigHCollectionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigHCollectionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bigHCollectionTitle.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    func setupBigCollection() {
        contentView.addSubview(bigHCollection)
        bigHCollection.backgroundColor = .clear
        bigHCollection.translatesAutoresizingMaskIntoConstraints = false
        bigHCollection.delegate = self
        bigHCollection.dataSource = self
        bigHCollection.register(BigHCViewCell.self, forCellWithReuseIdentifier: "BigHCViewCell")
        bigHCollection.showsHorizontalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            bigHCollection.topAnchor.constraint(equalTo: bigHCollectionTitle.bottomAnchor, constant: 30),
            bigHCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigHCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bigHCollection.heightAnchor.constraint(equalToConstant: 130 * 2 + 20)
        ])
    }
    
    func configureVBigCollectionTitle() {
        contentView.addSubview(bigVCollectionTitle)
        bigVCollectionTitle.translatesAutoresizingMaskIntoConstraints = false
        bigVCollectionTitle.text = "News"
        bigVCollectionTitle.textColor = .black
        bigVCollectionTitle.isUserInteractionEnabled = false
        bigVCollectionTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        NSLayoutConstraint.activate([
            bigVCollectionTitle.topAnchor.constraint(equalTo: bigHCollection.bottomAnchor, constant: 30),
            bigVCollectionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigVCollectionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bigVCollectionTitle.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    func setupBigVCollection() {
        contentView.addSubview(bigVCollection)
        bigVCollection.backgroundColor = .clear
        bigVCollection.translatesAutoresizingMaskIntoConstraints = false
        bigVCollection.delegate = self
        bigVCollection.dataSource = self
        bigVCollection.register(BigVCViewCell.self, forCellWithReuseIdentifier: "BigVCViewCell")
        
        NSLayoutConstraint.activate([
            bigVCollection.topAnchor.constraint(equalTo: bigVCollectionTitle.bottomAnchor, constant: 30),
            bigVCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigVCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bigVCollection.heightAnchor.constraint(equalToConstant: 1000),
            bigVCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func calculateContentSize() {
        var totalHieght: CGFloat = 370 + 50 + 50 + 22 + 22 + 30 + 30 + 30 + 30 + smallHCollection.bounds.height + bigHCollection.bounds.height
        
        for index in 0..<bigVCollection.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: index, section: 0)
            let cellHeight = collectionView(bigVCollection, layout: bigVCollection.collectionViewLayout, sizeForItemAt: indexPath).height
            totalHieght += cellHeight
        }
        
        let spacing =
        CGFloat(bigVCollection.numberOfItems(inSection: 0) - 1) * 30
        contentView.heightAnchor.constraint(equalToConstant: totalHieght + spacing).isActive = true
    }
}

// MARK: - CollectionView delegate

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return presenter.categoryData.count
        case 2:
            return presenter.drinkMenuData.count
        case 3:
            return presenter.newsCategoryData.count
            //            + presenter.descriptionCategoryData.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 1:
            let category = presenter.categoryData[indexPath.row]
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SmallHCViewCell", for: indexPath) as? SmallHCViewCell
            cell?.configure(with: category)
            return cell ?? UICollectionViewCell()
        case 2:
            let category = presenter.drinkMenuData[indexPath.row]
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "BigHCViewCell", for: indexPath)as? BigHCViewCell
            cell?.configure(with: category)
            return cell ?? UICollectionViewCell()
        case 3:
            let category = presenter.newsCategoryData[indexPath.row]
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "BigVCViewCell", for: indexPath)as? BigVCViewCell
            cell?.configure(with: category)
            return cell ?? UICollectionViewCell()
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView.tag {
        case 1:
            let cell = collectionView.cellForItem(at: indexPath) as? SmallHCViewCell
            cell?.toggleSelection()
            
        case 2:
            let cell = collectionView.cellForItem(at: indexPath) as? BigHCViewCell
            cell?.toggleSelection()
            let selectedCategory = presenter.drinkMenuData[indexPath.row]
            let detailVC = DetailViewController(drink:  selectedCategory)
            navigationController?.pushViewController(detailVC, animated: true)
        case 3:
            let cell = collectionView.cellForItem(at: indexPath) as? BigVCViewCell
            cell?.toggleSelection()
        default:
            print()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            return  CGSize(width: 70, height: 91)
        case 2:
            return CGSize(width: 130, height: 130)
        case 3:
            let width = collectionView.bounds.width
            let hieght = 130.0
            return CGSize(width: width, height: hieght)
        default:
            
            return CGSize(width: 0, height: 0)
        }
    }
}
