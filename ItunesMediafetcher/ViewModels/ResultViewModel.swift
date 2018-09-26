//
//  ResultViewModel.swift
//
//  Created by PC on 26/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ResultViewModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let copyright = "copyright"
    static let kind = "kind"
    static let name = "name"
    static let artworkUrl100 = "artworkUrl100"
    static let id = "id"
    static let genres = "genres"
    static let artistId = "artistId"
    static let releaseDate = "releaseDate"
    static let artistUrl = "artistUrl"
    static let url = "url"
    static let artistName = "artistName"
  }

  // MARK: Properties
  public var copyright: String?
  public var kind: String?
  public var name: String?
  public var artworkUrl100: String?
  public var id: String?
  public var genres: [Genres]?
  public var artistId: String?
  public var releaseDate: String?
  public var artistUrl: String?
  public var url: String?
  public var artistName: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    copyright = json[SerializationKeys.copyright].string
    kind = json[SerializationKeys.kind].string
    name = json[SerializationKeys.name].string
    artworkUrl100 = json[SerializationKeys.artworkUrl100].string
    id = json[SerializationKeys.id].string
    if let items = json[SerializationKeys.genres].array { genres = items.map { Genres(json: $0) } }
    artistId = json[SerializationKeys.artistId].string
    releaseDate = json[SerializationKeys.releaseDate].string
    artistUrl = json[SerializationKeys.artistUrl].string
    url = json[SerializationKeys.url].string
    artistName = json[SerializationKeys.artistName].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = copyright { dictionary[SerializationKeys.copyright] = value }
    if let value = kind { dictionary[SerializationKeys.kind] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = artworkUrl100 { dictionary[SerializationKeys.artworkUrl100] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = genres { dictionary[SerializationKeys.genres] = value.map { $0.dictionaryRepresentation() } }
    if let value = artistId { dictionary[SerializationKeys.artistId] = value }
    if let value = releaseDate { dictionary[SerializationKeys.releaseDate] = value }
    if let value = artistUrl { dictionary[SerializationKeys.artistUrl] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    if let value = artistName { dictionary[SerializationKeys.artistName] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.copyright = aDecoder.decodeObject(forKey: SerializationKeys.copyright) as? String
    self.kind = aDecoder.decodeObject(forKey: SerializationKeys.kind) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.artworkUrl100 = aDecoder.decodeObject(forKey: SerializationKeys.artworkUrl100) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.genres = aDecoder.decodeObject(forKey: SerializationKeys.genres) as? [Genres]
    self.artistId = aDecoder.decodeObject(forKey: SerializationKeys.artistId) as? String
    self.releaseDate = aDecoder.decodeObject(forKey: SerializationKeys.releaseDate) as? String
    self.artistUrl = aDecoder.decodeObject(forKey: SerializationKeys.artistUrl) as? String
    self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
    self.artistName = aDecoder.decodeObject(forKey: SerializationKeys.artistName) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(copyright, forKey: SerializationKeys.copyright)
    aCoder.encode(kind, forKey: SerializationKeys.kind)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(artworkUrl100, forKey: SerializationKeys.artworkUrl100)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(genres, forKey: SerializationKeys.genres)
    aCoder.encode(artistId, forKey: SerializationKeys.artistId)
    aCoder.encode(releaseDate, forKey: SerializationKeys.releaseDate)
    aCoder.encode(artistUrl, forKey: SerializationKeys.artistUrl)
    aCoder.encode(url, forKey: SerializationKeys.url)
    aCoder.encode(artistName, forKey: SerializationKeys.artistName)
  }

}
