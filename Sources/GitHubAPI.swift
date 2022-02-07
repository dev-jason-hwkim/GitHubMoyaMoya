//
//  GitHubAPI.swift
//  GitHubMoyaMoya
//
//  Created by Jason on 2022/02/06.
//

import Moya
import MoyaSugar

public enum GitHubAPI {
  case search(String, String, Int)
  case user(String, String)
}


extension GitHubAPI: SugarTargetType {
  
  public var baseURL: URL {
    return URL(string: "https://api.github.com")!
  }
  
  public  var url: URL {
    return self.defaultURL
  }
  
  public var route: Route {
    switch self {
    case .search(_, _, _):
      return .get("/search/users")
    case .user(_, let username):
      return .get("/users/\(username)")
      
    }
  }
  
  public var parameters: Parameters? {
    switch self {
    case .search(_, let username, let page):
      return [
        "q" : username,
        "per_page": 20,
        "page": page
      ]
    default:
      return nil
    }
  }
  
  public var headers: [String: String]? {
    var headers  = ["Content-Type": "application/json"]
    
    switch self {
    case .search(let token, _, _):
      headers["Authorization"] = token
    case .user(let token, _):
      headers["Authorization"] = token
    }
    return headers
  }
  
  public var sampleData: Data {
    return Data()
  }
  
}

