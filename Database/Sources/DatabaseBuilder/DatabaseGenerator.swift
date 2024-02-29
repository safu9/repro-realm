import Database
import Foundation

@main
struct DatabaseBuilder {
    static func main() async throws {
        guard let dir = URL(string: FileManager.default.currentDirectoryPath) else { return }
        let url = dir.appending(component: "sample.realm")

        let database = Database()
        try await database.save("Hello, World!", to: url)
    }
}
