import RealmSwift
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = SampleViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.text ?? "Loading...")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
