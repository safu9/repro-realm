import RealmSwift
import Foundation

public actor Database {
    private let url = Bundle.module.url(forResource: "sample", withExtension: "realm")
    private let key = "8wU=AJ2n[{,]CGZ8+z3<I0d0}DwD~`z(o#?m$WO;^ZLY,h*HAl12k+V-^<I679gg".data(using: .ascii)

    public init() {}

    public func load() async throws -> String? {
        let realm = try await Realm(configuration: .init(fileURL: url, encryptionKey: key), actor: self)
        return realm.objects(Item.self).first?.text
    }

    public func save(_ text: String, to url: URL) async throws {
        let realm = try await Realm(configuration: .init(inMemoryIdentifier: "db"), actor: self)
        try await realm.asyncWrite {
            let item = Item()
            item.text = text

            realm.add(item)
        }
        try realm.writeCopy(toFile: url, encryptionKey: key)
    }
}
