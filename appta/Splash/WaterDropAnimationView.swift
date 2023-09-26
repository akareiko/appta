import SwiftUI

struct WaterDropAnimationView: View {
    @State private var dropYPosition: CGFloat = -250
    @State private var reflectionYPosition: CGFloat = 0
    @State private var isAnimating = false
    
    let dropHeight: CGFloat = 100
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            
            // Water drop
            Circle()
                .fill(Color.white)
                .frame(width: 50, height: dropHeight)
                .offset(y: dropYPosition)
                .opacity(isAnimating ? 0 : 1)
                .animation(
                    Animation.easeInOut(duration: 2)
                )
            
            // Reflection
            Circle()
                .fill(Color.white.opacity(0.5))
                .frame(width: 50, height: dropHeight)
                .offset(y: reflectionYPosition)
                .opacity(isAnimating ? 0 : 1)
                .animation(
                    Animation.easeInOut(duration: 2)
                )
            
            // Ripples
            Circle()
                .stroke(Color.white, lineWidth: 4)
                .frame(width: 50, height: dropHeight)
                .opacity(isAnimating ? 0 : 1)
                .scaleEffect(isAnimating ? 1.5 : 0)
        }
        .onAppear {
            withAnimation {
                self.dropYPosition = UIScreen.main.bounds.height / 2 - dropHeight / 2
                self.reflectionYPosition = UIScreen.main.bounds.height / 2 + dropHeight / 2
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isAnimating = true
                }
            }
        }
    }
}

struct WaterDropAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        WaterDropAnimationView()
    }
}
