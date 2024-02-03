import CodeScanner
import SwiftUI

struct Window: Shape {
    let size: CGSize
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)

        let origin = CGPoint(x: rect.midX - size.width / 2, y: rect.midY - size.height / 2)
        path.addRect(CGRect(origin: origin, size: size))
        return path
    }
}

struct QrcodeView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "фывфыв"
    
    struct GrowingButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(.black)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: {
                result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
            }
        )
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Text(scannedCode)
                .padding(.bottom, 50)
            Button("Отсканировать") {
                self.isPresentingScanner = true
            }
            .buttonStyle(GrowingButton())
            
            .sheet(isPresented: $isPresentingScanner) {
                
                
                ZStack {
                    self.scannerSheet

                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(Window(size: CGSize(width: 200, height: 200)).fill(style: FillStyle(eoFill: true)))

                    RoundedRectangle(cornerRadius: 3).stroke(Color("starbucks-lightgold"), lineWidth: 3)
                        .frame(width: 200, height: 200)
                }
            }
            Spacer()
        }
        Spacer()
    }
}

struct QrcodeView_Previews: PreviewProvider {
    static var previews: some View {
        QrcodeView()
    }
}
