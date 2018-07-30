//  This file was automatically generated and should not be edited.

import Apollo

public final class RandomJokeQuery: GraphQLQuery {
  public let operationDefinition =
    "query RandomJoke {\n  joke {\n    __typename\n    id\n    joke\n    permalink\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("joke", type: .object(Joke.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(joke: Joke? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "joke": joke.flatMap { (value: Joke) -> ResultMap in value.resultMap }])
    }

    public var joke: Joke? {
      get {
        return (resultMap["joke"] as? ResultMap).flatMap { Joke(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "joke")
      }
    }

    public struct Joke: GraphQLSelectionSet {
      public static let possibleTypes = ["Joke"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("joke", type: .scalar(String.self)),
        GraphQLField("permalink", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, joke: String? = nil, permalink: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Joke", "id": id, "joke": joke, "permalink": permalink])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var joke: String? {
        get {
          return resultMap["joke"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "joke")
        }
      }

      public var permalink: String? {
        get {
          return resultMap["permalink"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "permalink")
        }
      }
    }
  }
}