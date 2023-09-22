import SwiftUI

struct ToggleButton: View {
    @State private var isToggled = false

    var body: some View {
        Button(action: {
            self.isToggled.toggle()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 80, height: 40)
                    .background(isToggled ? Color.green : Color.white)
                if isToggled {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                        .padding(.trailing, 10)
                }
            }
        }
    }
}

struct ToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        ToggleButton()
    }
}
