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
    @State private var thumbSize: CGSize = CGSize.inactiveThumbSize
    @State private var dragOffset: CGSize = .zero
    @State private var isEnough = false
    private var actionSuccess: (() -> Void)?
    private var actionFailure: (() -> Void)?
    
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
                        Text("Basic")
                            .fontWeight(.bold)
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white)
                            .frame(width: 90, height: 25)
                            .overlay(
                                Text("4000KZT")
                                    .foregroundColor(.black)
                            )
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        VStack {
                            Text(Image(systemName: "mug"))
                                .foregroundColor(.white)
                                .font(.title3)
                            +
                            Text(Image(systemName: "xmark"))
                                .foregroundColor(.white)
                                .font(.caption)
                            +
                            Text(Image(systemName: "3.circle.fill"))
                                .foregroundColor(.white)
                                .font(.title3)
                            
                            Text("Три бесплатных напитка")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        
                        VStack {
                            Text(Image(systemName: "gift"))
                                .foregroundColor(.white)
                                .font(.title3)
                            
                            Text("Каждый 12-ый напиток в подарок")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        
                        VStack {
                            Text(Image(systemName: "tengesign.circle"))
                                .foregroundColor(.white)
                                .font(.title3)
                            
                            Text("Накапливайте бонусы")
                                .foregroundColor(.white)
                                .font(.caption)
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
    SwipeButtonView()
}
