import SwiftUI
import Database

@MainActor
final class SampleViewModel: ObservableObject {
    @Published var text: String?

    private let database = Database()

    init() {
        Task {
            do {
                text = try await database.load()
            } catch {
                text = "Error"
                print(error)
            }
        }
    }
}
