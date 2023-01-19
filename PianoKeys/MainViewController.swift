//
//  MainViewController.swift
//  PianoKeys
//
//  Created by Tim Akhmetov on 19.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
     var delegate: ViewControllerDelegate?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        scrollView.enableZoom()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var doButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(pushDoButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedDoButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var reButton: UIButton = {
        let button = WhiteButtonModel()
        button.setImage(Constants.Image.whiteButton, for: .normal)
        button.addTarget(self, action: #selector(pushReButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedReButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var miButton: UIButton = {
        let button = WhiteButtonModel()
        button.setImage(Constants.Image.whiteButton, for: .normal)
        button.addTarget(self, action: #selector(pushMiButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedMiButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var faButton: UIButton = {
        let button = WhiteButtonModel()
        button.addTarget(self, action: #selector(pushFaButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedFaButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var solButton: UIButton = {
        let button = WhiteButtonModel()
        button.addTarget(self, action: #selector(pushSolButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedSolButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var lyaButton: UIButton = {
        let button = WhiteButtonModel()
        button.addTarget(self, action: #selector(pushLyaButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedLyaButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var siButton: UIButton = {
        let button = WhiteButtonModel()
        button.addTarget(self, action: #selector(pushSiButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedSiButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var doDiesButton: UIButton = {
        let button = BlackButtonModel()
        button.addTarget(self, action: #selector(pushDoDiesButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedDoDiesButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var reDiesButton: UIButton = {
        let button = BlackButtonModel()
        button.addTarget(self, action: #selector(pushReDiesButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedReDiesButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var faDiesButton: UIButton = {
        let button = BlackButtonModel()
        button.addTarget(self, action: #selector(pushFaDiesButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedFaDiesButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var solDiesButton: UIButton = {
        let button = BlackButtonModel()
        button.addTarget(self, action: #selector(pushSolDiesButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedSolDiesButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var lyaDiesButton: UIButton = {
        let button = BlackButtonModel()
        button.setImage(Constants.Image.blackButton, for: .normal)
        button.addTarget(self, action: #selector(pushLyaDiesButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedLyaDiesButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        
        setupViews()
        setConstrints()
    
        self.delegate = LoggingViewControllerDelegate()
    }
    
    private func setupViews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(doButton)
        scrollView.addSubview(reButton)
        scrollView.addSubview(miButton)
        scrollView.addSubview(faButton)
        scrollView.addSubview(solButton)
        scrollView.addSubview(lyaButton)
        scrollView.addSubview(siButton)
        scrollView.addSubview(doDiesButton)
        scrollView.addSubview(reDiesButton)
        scrollView.addSubview(faDiesButton)
        scrollView.addSubview(solDiesButton)
        scrollView.addSubview(lyaDiesButton)
    }
    
    // MARK: - setConstrints
    
    private func setConstrints() {
      
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            doButton.widthAnchor.constraint(equalToConstant: 50),
            doButton.heightAnchor.constraint(equalToConstant: 200),
            doButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            doButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            
            reButton.widthAnchor.constraint(equalToConstant: 50),
            reButton.heightAnchor.constraint(equalToConstant: 200),
            reButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            reButton.leadingAnchor.constraint(equalTo: doButton.trailingAnchor, constant: 9),
            
            miButton.widthAnchor.constraint(equalToConstant: 50),
            miButton.heightAnchor.constraint(equalToConstant: 200),
            miButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            miButton.leadingAnchor.constraint(equalTo: reButton.trailingAnchor, constant: 9),
            
            faButton.widthAnchor.constraint(equalToConstant: 50),
            faButton.heightAnchor.constraint(equalToConstant: 200),
            faButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            faButton.leadingAnchor.constraint(equalTo: miButton.trailingAnchor, constant: 9),
            
            solButton.widthAnchor.constraint(equalToConstant: 50),
            solButton.heightAnchor.constraint(equalToConstant: 200),
            solButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            solButton.leadingAnchor.constraint(equalTo: faButton.trailingAnchor, constant: 9),
            
            lyaButton.widthAnchor.constraint(equalToConstant: 50),
            lyaButton.heightAnchor.constraint(equalToConstant: 200),
            lyaButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            lyaButton.leadingAnchor.constraint(equalTo: solButton.trailingAnchor, constant: 9),

            siButton.widthAnchor.constraint(equalToConstant: 50),
            siButton.heightAnchor.constraint(equalToConstant: 200),
            siButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            siButton.leadingAnchor.constraint(equalTo: lyaButton.trailingAnchor, constant: 9),

            doDiesButton.widthAnchor.constraint(equalToConstant: 30),
            doDiesButton.heightAnchor.constraint(equalToConstant: 135),
            doDiesButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            doDiesButton.leadingAnchor.constraint(equalTo: doButton.leadingAnchor, constant: 27),
            
            reDiesButton.widthAnchor.constraint(equalToConstant: 30),
            reDiesButton.heightAnchor.constraint(equalToConstant: 135),
            reDiesButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            reDiesButton.leadingAnchor.constraint(equalTo: reButton.leadingAnchor, constant: 27),
            
            faDiesButton.widthAnchor.constraint(equalToConstant: 30),
            faDiesButton.heightAnchor.constraint(equalToConstant: 135),
            faDiesButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            faDiesButton.leadingAnchor.constraint(equalTo: faButton.leadingAnchor, constant: 27),
            
            solDiesButton.widthAnchor.constraint(equalToConstant: 30),
            solDiesButton.heightAnchor.constraint(equalToConstant: 135),
            solDiesButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            solDiesButton.leadingAnchor.constraint(equalTo: solButton.leadingAnchor, constant: 27),
            
            lyaDiesButton.widthAnchor.constraint(equalToConstant: 30),
            lyaDiesButton.heightAnchor.constraint(equalToConstant: 135),
            lyaDiesButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            lyaDiesButton.leadingAnchor.constraint(equalTo: lyaButton.leadingAnchor, constant: 27)
            ])
    }
}

extension UIScrollView {
    func enableZoom() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(pinchGesture)
    }
    
    @objc private func startZooming(_ sender: UIPinchGestureRecognizer) {
        let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
        guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
        sender.view?.transform = scale
        sender.scale = 1
    }
}

extension MainViewController {
    
    @objc func pushDoButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Do")
    }
    @objc func releasedDoButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Do")
    }
    @objc func pushReButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Re")
    }
    @objc func releasedReButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Re")
    }
    @objc func pushMiButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Mi")
    }
    @objc func releasedMiButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Mi")
    }
    @objc func pushFaButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Fa")
    }
    @objc func releasedFaButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Fa")
    }
    @objc func pushSolButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Sol")
    }
    @objc func releasedSolButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Sol")
    }
    @objc func pushLyaButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Lya")
    }
    @objc func releasedLyaButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Lya")
    }
    @objc func pushSiButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Si")
    }
    @objc func releasedSiButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Si")
    }
    @objc func pushDoDiesButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Do dies")
    }
    @objc func releasedDoDiesButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Do dies")
    }
    @objc func pushReDiesButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Re dies")
    }
    @objc func releasedReDiesButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Re dies")
    }
    @objc func pushFaDiesButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Fa dies")
    }
    @objc func releasedFaDiesButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Fa dies")
    }
    @objc func pushSolDiesButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Sol dies")
    }
    @objc func releasedSolDiesButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Sol dies")
    }
    @objc func pushLyaDiesButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Lya dies")
    }
    @objc func releasedLyaDiesButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Lya dies")
    }
}
