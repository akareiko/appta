//import SwiftUI
//
//struct ContentView: View {
//    @State private var entryText: String = ""
//
//    var body: some View {
//        VStack {
//            Form {
//                Section(header: Text("Entry")) {
//                    TextField("Enter text", text: $entryText)
//                }
//
//                Button("Add Entry") {
//                    addEntryToFirebase()
//                }
//            }
//        }
//        .padding()
//    }
//
//    private func addEntryToFirebase() {
//        guard !entryText.isEmpty else { return }
//
//        // Assuming you have already configured Firebase
//        let database = Database.database().reference()
//
//        let entryData = ["text": entryText]
//
//        // Generate a unique key for the entry
//        let entryKey = database.child("entries").childByAutoId().key!
//
//        // Save the entry to the "entries" node with the unique key
//        let entryReference = database.child("entries").child(entryKey)
//        entryReference.setValue(entryData) { error, _ in
//            if let error = error {
//                print("Error adding entry to Firebase: \(error.localizedDescription)")
//            } else {
//                print("Entry added successfully!")
//            }
//        }
//
//        // Clear the text field after adding the entry
//        entryText = ""
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
