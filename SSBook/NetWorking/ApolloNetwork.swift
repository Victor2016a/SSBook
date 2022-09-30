//
//  ApolloNetwork.swift
//  SSBook
//
//  Created by Victor Vieira on 24/09/22.
//

import Foundation
import Apollo

class ApolloNetwork {
  static let shared = ApolloNetwork()
  lazy var apollo = ApolloClient(url: URL(string: "https://us-central1-ss-devops.cloudfunctions.net/GraphQL")!)
}
