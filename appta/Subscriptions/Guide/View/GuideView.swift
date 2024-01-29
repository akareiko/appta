import SwiftUI

struct GuideView: View{
    @State private var activeIntro: PageIntro = pageIntros[0]
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var keyboardHeight: CGFloat = 0
    var body: some View {
        GeometryReader{
            let size = $0.size
            IntroView(intro: $activeIntro, size: size){
            }
            .padding(15)
        }
    }
}
struct IntroView<ActionView: View>: View {
    @Binding var intro: PageIntro
    var size: CGSize
    var actionView: ActionView
    
    init(intro: Binding<PageIntro>, size: CGSize, @ViewBuilder actionView: @escaping () -> ActionView) {
        self._intro = intro
        self.size = size
        self.actionView = actionView()
    }
    
    @State private var showView: Bool = false
    @State private var hideWholeView: Bool = false
    var body: some View {
        VStack{
            VStack {
                intro.introBlock
            }
            .frame(width: UIScreen.main.bounds.width - 10, height: 580)
            .offset(x: -10, y: showView ? 0 : -size.height / 2)
            .opacity(showView ? 1 : 0)
            .scaleEffect(0.85)
            
            VStack(alignment: .leading, spacing: 10){
                Spacer(minLength: 0)
                
                if !intro.displaysAction1{
                    Group {
                        Spacer(minLength: 25)
                        CustomIndicatorView(totalPages: filteredPages.count, currentPage: filteredPages.firstIndex(of: intro) ?? 0)
                            .frame(maxWidth: .infinity)
                        
                        Spacer(minLength: 10)
                        
                        Button {
                            changeIntro()
                        } label: {
                            Text("Next")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: size.width * 0.4)
                                .padding(.vertical, 15)
                                .background {
                                    Capsule()
                                        .fill(.black)
                                }
                        }
                        .frame(maxWidth: .infinity)
                    }
                } else {
                    actionView
                        .offset(y: showView ? 0 : size.height / 2)
                        .opacity(showView ? 1 : 0)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .offset(y: showView ? 0 : size.height / 2)
            .opacity(showView ? 1 : 0)
        }
        .offset(y: hideWholeView ? size.height / 2 : 0)
        .opacity(hideWholeView ? 0 : 1)
        .ignoresSafeArea()
        .overlay(alignment: .topLeading) {
            if intro != pageIntros.first {
                Button {
                    changeIntro(true)
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .contentShape(Rectangle())
                }
                .padding(10)
                .offset(y: showView ? 0 : -200)
                .offset(y: hideWholeView ? -200 : 0)
            }
        }
        .onAppear{
            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0).delay(0.1)){
                showView = true
            }
        }
    }
    
    
    func changeIntro(_ isPrevious: Bool = false) {
        withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0)){
            hideWholeView = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let index = pageIntros.firstIndex(of: intro), (isPrevious ? index != 0 : index != pageIntros.count - 1) {
                intro = isPrevious ? pageIntros[index - 1] : pageIntros[index + 1]
            } else {
                intro = isPrevious ? pageIntros[0] : pageIntros[pageIntros.count - 1]
            }
            
            hideWholeView = false
            showView = false
            
            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0)){
                showView = true
            }
        }
    }
    
    var filteredPages: [PageIntro] {
        return pageIntros.filter { !$0.displaysAction1 }
    }
}
