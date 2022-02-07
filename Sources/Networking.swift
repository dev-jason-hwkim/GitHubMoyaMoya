//
//  Networking.swift
//  Alamofire
//
//  Created by Jason on 2022/02/06.
//

import Moya
import MoyaSugar
import RxSwift

open class Networking<Target: SugarTargetType>: MoyaSugarProvider<Target> {
  
  public init(plugins: [PluginType] = []) {
    let session = MoyaProvider<Target>.defaultAlamofireSession()
    session.sessionConfiguration.timeoutIntervalForRequest = 10
    super.init(session: session, plugins: plugins)
  }
  
  open func request(
    _ target: Target,
    file: StaticString = #file,
    function: StaticString = #function,
    line: UInt = #line
  ) -> Single<Response> {
    let requestString = "\(target.method.rawValue) : \(target.baseURL.absoluteString)\(target.path)"
    
    return self.rx.request(target)
      .filterSuccessfulStatusCodes()
      .do(
        onSuccess: { value in
          let message = "SUCCESS: \(requestString) (\(value.statusCode))"
          logger.debug(message, file: file, function: function, line: line)
        },
        onError: { error in
          if let response = (error as? MoyaError)?.response {
            if let jsonObject = try? response.mapJSON(failsOnEmptyData: false) {
              let message = "Failure: \(requestString) (\(response.statusCode))\n\(jsonObject)"
              logger.warning(message, file: file, function: function, line: line)
            } else if let rawString = String(data: response.data, encoding: .utf8) {
              let message = "Failure: \(requestString) (\(response.statusCode))\n\(rawString)"
              logger.warning(message, file: file, function: function, line: line)
            } else {
              let message = "Failure: \(requestString) (\(response.statusCode))"
              logger.warning(message, file: file, function: function, line: line)
            }
          } else {
            let message = "Failure: \(requestString)\n\(error)"
            logger.warning(message, file: file, function: function, line: line)
          }
        },
        onSubscribed: {
          let message = "Request: \(requestString)"
          logger.debug(message, file: file, function: function, line: line)
        }
      )
        
        }
  
}

