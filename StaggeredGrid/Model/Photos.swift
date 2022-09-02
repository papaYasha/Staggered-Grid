import SwiftUI

struct Photos: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
}
