import RealmSwift
import Foundation

public actor Database {

    // The URL of the Realm file.
    // - sample-x86_64.realm: Created on Intel Mac, which causes a crash on M1 Mac and iOS.
    // - sample-arm64.realm: Created on M1 Mac, which seems to have no problem.
    private let url = Bundle.module.url(forResource: "sample-x86_64", withExtension: "realm")

    private let key = "8wU=AJ2n[{,]CGZ8+z3<I0d0}DwD~`z(o#?m$WO;^ZLY,h*HAl12k+V-^<I679gL".data(using: .ascii)

    public init() {}

    public func load() async throws -> String? {
        let realm = try await Realm(configuration: .init(fileURL: url, encryptionKey: key), actor: self)
        return realm.objects(Item.self).first?.text
    }

    public func save(_ text: String, count: Int, to url: URL) async throws {
        let realm = try await Realm(configuration: .init(inMemoryIdentifier: "db"), actor: self)
        try await realm.asyncWrite {
            let items = (0..<count).map { _ in 
                let item = Item()
                item.text = text
                return item
            }
            realm.add(items)
        }
        try realm.writeCopy(toFile: url, encryptionKey: key)
    }
}
