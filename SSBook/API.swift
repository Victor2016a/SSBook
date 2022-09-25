// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AllBooksQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AllBooks {
      allBooks {
        __typename
        cover
        name
        author {
          __typename
          name
        }
      }
    }
    """

  public let operationName: String = "AllBooks"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allBooks", type: .nonNull(.list(.nonNull(.object(AllBook.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allBooks: [AllBook]) {
      self.init(unsafeResultMap: ["__typename": "Query", "allBooks": allBooks.map { (value: AllBook) -> ResultMap in value.resultMap }])
    }

    public var allBooks: [AllBook] {
      get {
        return (resultMap["allBooks"] as! [ResultMap]).map { (value: ResultMap) -> AllBook in AllBook(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: AllBook) -> ResultMap in value.resultMap }, forKey: "allBooks")
      }
    }

    public struct AllBook: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Book"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("cover", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("author", type: .nonNull(.object(Author.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(cover: String, name: String, author: Author) {
        self.init(unsafeResultMap: ["__typename": "Book", "cover": cover, "name": name, "author": author.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cover: String {
        get {
          return resultMap["cover"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cover")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var author: Author {
        get {
          return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "author")
        }
      }

      public struct Author: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Author"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "Author", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class FavoriteAuthorsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FavoriteAuthors {
      favoriteAuthors {
        __typename
        picture
        name
        booksCount
      }
    }
    """

  public let operationName: String = "FavoriteAuthors"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("favoriteAuthors", type: .nonNull(.list(.nonNull(.object(FavoriteAuthor.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(favoriteAuthors: [FavoriteAuthor]) {
      self.init(unsafeResultMap: ["__typename": "Query", "favoriteAuthors": favoriteAuthors.map { (value: FavoriteAuthor) -> ResultMap in value.resultMap }])
    }

    public var favoriteAuthors: [FavoriteAuthor] {
      get {
        return (resultMap["favoriteAuthors"] as! [ResultMap]).map { (value: ResultMap) -> FavoriteAuthor in FavoriteAuthor(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: FavoriteAuthor) -> ResultMap in value.resultMap }, forKey: "favoriteAuthors")
      }
    }

    public struct FavoriteAuthor: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Author"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("picture", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("booksCount", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(picture: String, name: String, booksCount: Int) {
        self.init(unsafeResultMap: ["__typename": "Author", "picture": picture, "name": name, "booksCount": booksCount])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var picture: String {
        get {
          return resultMap["picture"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "picture")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var booksCount: Int {
        get {
          return resultMap["booksCount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "booksCount")
        }
      }
    }
  }
}

public final class FavoriteBookQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FavoriteBook($id: ID!) {
      book(id: $id) {
        __typename
        cover
        name
        author {
          __typename
          name
        }
        description
      }
    }
    """

  public let operationName: String = "FavoriteBook"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("book", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(Book.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(book: Book) {
      self.init(unsafeResultMap: ["__typename": "Query", "book": book.resultMap])
    }

    public var book: Book {
      get {
        return Book(unsafeResultMap: resultMap["book"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "book")
      }
    }

    public struct Book: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Book"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("cover", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("author", type: .nonNull(.object(Author.selections))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(cover: String, name: String, author: Author, description: String) {
        self.init(unsafeResultMap: ["__typename": "Book", "cover": cover, "name": name, "author": author.resultMap, "description": description])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cover: String {
        get {
          return resultMap["cover"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cover")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var author: Author {
        get {
          return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "author")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public struct Author: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Author"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "Author", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class FavoriteBooksQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FavoriteBooks {
      favoriteBooks {
        __typename
        id
        cover
        name
        author {
          __typename
          name
        }
      }
    }
    """

  public let operationName: String = "FavoriteBooks"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("favoriteBooks", type: .nonNull(.list(.nonNull(.object(FavoriteBook.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(favoriteBooks: [FavoriteBook]) {
      self.init(unsafeResultMap: ["__typename": "Query", "favoriteBooks": favoriteBooks.map { (value: FavoriteBook) -> ResultMap in value.resultMap }])
    }

    public var favoriteBooks: [FavoriteBook] {
      get {
        return (resultMap["favoriteBooks"] as! [ResultMap]).map { (value: ResultMap) -> FavoriteBook in FavoriteBook(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: FavoriteBook) -> ResultMap in value.resultMap }, forKey: "favoriteBooks")
      }
    }

    public struct FavoriteBook: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Book"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("cover", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("author", type: .nonNull(.object(Author.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, cover: String, name: String, author: Author) {
        self.init(unsafeResultMap: ["__typename": "Book", "id": id, "cover": cover, "name": name, "author": author.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var cover: String {
        get {
          return resultMap["cover"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cover")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var author: Author {
        get {
          return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "author")
        }
      }

      public struct Author: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Author"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "Author", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class UserPictureQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query UserPicture {
      userPicture
    }
    """

  public let operationName: String = "UserPicture"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("userPicture", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(userPicture: String) {
      self.init(unsafeResultMap: ["__typename": "Query", "userPicture": userPicture])
    }

    public var userPicture: String {
      get {
        return resultMap["userPicture"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "userPicture")
      }
    }
  }
}
