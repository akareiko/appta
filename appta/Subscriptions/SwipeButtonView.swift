import SwiftUI

extension Comparable {
    func clamp<T: Comparable>(lower: T, _ upper: T) -> T {
        return min(max(self as! T, lower), upper)
    }
}

extension CGSize {
    static var inactiveThumbSize: CGSize {
        return CGSize(width: 90, height: 165)
    }
    static var activeThumbSize: CGSize {
        return CGSize(width: 105, height: 165)
    }
    static var trackSize: CGSize {
        return CGSize(width: 380, height: 180)
    }
}

extension SwipeButtonView {
    func onSwipeSuccess(_ action: @escaping () -> Void) -> Self {
        var this = self
        this.actionSuccess = action
        return this
    }
    
    func onSwipeFailure(_ action: @escaping () -> Void) -> Self {
        var this = self
        this.actionFailure = action
        return this
    }
}

struct SwipeButtonView: View {
    @State var thumbSize: CGSize = CGSize.inactiveThumbSize
    @State var dragOffset: CGSize = .zero
    @State var isEnough = false
    var actionSuccess: (() -> Void)?
    var actionFailure: (() -> Void)?
    
    var imageName: String
    var title: String
    var description: String
    var price: String
    var features: [String]
    var features_image: [String]
    
    @State var trackSize = CGSize.trackSize
    @State private var elemOpacity = 1.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: trackSize.width, height: trackSize.height)
                .foregroundColor(Color.black)
            HStack {
                if elemOpacity == 1.0 {
                    Spacer()
                        .frame(width: 110)
                }
                else {
                    Spacer()
                        .frame(width: 20)
                }
                
                VStack {
                    HStack {
                        Text(title)
                            .fontWeight(.bold)
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white)
                            .frame(width: 90, height: 25)
                            .overlay(
                                Text(price)
                                    .foregroundColor(.black)
                            )
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        ForEach(features.indices, id: \.self) { index in
                            VStack {
                                Text(Image(systemName: features_image[index]))
                                    .foregroundColor(.white)
                                    .font(.title3)
                                Text(features[index])
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                        }
                    }
                }
                .frame(width: 220)
                
                if elemOpacity == 1.0 {
                    Spacer()
                        .frame(width: 20)
                }
                else {
                    Spacer()
                        .frame(width: 110)
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: thumbSize.width, height: thumbSize.height)
                    .foregroundColor(.white)
                if elemOpacity == 1.0 {
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color.black)
                }
                else {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.black)
                }
            }
            .offset(x: getDragOffset(), y: 0)
            .animation(Animation.spring(response: 0.3, dampingFraction: 0.8))
            .gesture(
                DragGesture()
                    .onChanged({value in self.handleDragChanged(value)})
                    .onEnded({ _ in self.handleDragEnded()})
            )
            .padding(.leading, 20)
        }
    }
    
    private func getDragOffset() -> CGFloat {
        let clampedDragOffsetX = dragOffset.width.clamp(lower: 0, trackSize.width - thumbSize.width - 20)
        
        return -(trackSize.width/2 - thumbSize.width/2 - (clampedDragOffsetX))
    }
    
    private func handleDragChanged(_ value: DragGesture.Value) -> Void {
        self.dragOffset = value.translation

        let dragWidth = value.translation.width
        let targetDragWidth = self.trackSize.width - (self.thumbSize.width * 2)
        let didReachTarget = dragWidth > targetDragWidth
        
        if didReachTarget {
            self.isEnough = true
            self.thumbSize = CGSize.activeThumbSize
        } else {
            self.isEnough = false
            self.thumbSize = CGSize.inactiveThumbSize
        }
    }
    
    private func handleDragEnded() -> Void {
        
        if self.isEnough {
            self.dragOffset = CGSize(width: self.trackSize.width - self.thumbSize.width, height: 0)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                withAnimation() {
                    elemOpacity = 0.0
                }
            }
            
            if let actionSuccess = self.actionSuccess {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                    actionSuccess()
                }
            }
        }
        
        else {
            self.dragOffset = .zero
            self.thumbSize = CGSize.inactiveThumbSize
            withAnimation() {
                elemOpacity = 1.0
            }
            
            if let actionFailure = self.actionFailure {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    actionFailure()
                }
            }
        }
    }
}

#Preview {
    SwipeButtonView(imageName: "bird", title: "basic", description: "haha", price: "4000", features: ["kek", "kek", "kek"], features_image: ["mug", "gift", "tengesign.circle"])
}
