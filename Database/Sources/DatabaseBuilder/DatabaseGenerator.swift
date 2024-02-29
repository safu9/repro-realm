import Database
import Foundation

@main
struct DatabaseBuilder {
    static func main() async throws {
        guard let dir = URL(string: FileManager.default.currentDirectoryPath) else { return }

        let counts = [1, 1000, 1000000]
        for count in counts {
            let url = dir.appending(component: "sample-\(count).realm")

            let database = Database()
            try await database.save("Hello, World!", count: count, to: url)
        }
    }
}
