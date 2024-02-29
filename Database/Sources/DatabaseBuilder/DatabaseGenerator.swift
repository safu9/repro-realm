import Database
import Foundation

@main
struct DatabaseBuilder {
    static func main() async throws {
        let args = CommandLine.arguments
        let arch = args.count > 1 ? args[1] : "none"

        guard let dir = URL(string: FileManager.default.currentDirectoryPath) else { return }

        let counts = [1, 500, 1000, 1500]
        for count in counts {
            let url = dir.appending(component: "sample-\(arch)-\(count).realm")

            let database = Database()
            try await database.save("Hello, World!", count: count, to: url)
        }
    }
}
