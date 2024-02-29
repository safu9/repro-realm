import SwiftUI
import Database

final class SampleViewModel: ObservableObject {
    @Published var text: String?

    private let database = Database()

    init() {
        Task {
            text = try? await database.load()
        }
    }
}
