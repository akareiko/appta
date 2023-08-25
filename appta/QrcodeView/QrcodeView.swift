import CodeScanner
import SwiftUI

struct QrcodeView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started."
    
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
            Button("Scan QR Code") {
                self.isPresentingScanner = true
            }
            .buttonStyle(GrowingButton())
            
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
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
