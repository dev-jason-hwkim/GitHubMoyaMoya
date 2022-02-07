//
//  ViewController.swift
//  GitHubMoyaMoya
//
//  Created by Jason on 02/06/2022.
//  Copyright (c) 2022 Jason. All rights reserved.
//

import UIKit
import GitHubMoyaMoya
import RxSwift


typealias GitHubNetworking = Networking<GitHubAPI>
class ViewController: UIViewController {
  
  
  private let disposeBag = DisposeBag()
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let networking = GitHubNetworking()
    
    let githubToken = ""
    
    
    networking.request(.user(githubToken, "test"))
      .mapJSON()
      .subscribe(onSuccess: { json in
        print(json)
      })
      .disposed(by: self.disposeBag)
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

