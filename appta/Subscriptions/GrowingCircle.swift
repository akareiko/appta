import SwiftUI

struct GrowingCircle: View {
    let totalValue: CGFloat = 12.0
    @State private var currentValue: CGFloat = 3.0
    
    var body: some View {
        let percentage = currentValue / totalValue
        
        VStack {
            ZStack {
                Circle()
                    .stroke(Color("starbucks-rewardgold").opacity(0.2), style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .frame(width: 60, height: 60)
                
                Image("starbucks-cup")
                    .resizable()
                    .frame(width: 30, height: 35)
                    .scaledToFit()
                    .padding(.leading, 3)
                
                Circle()
                    .trim(from: 0.0, to: percentage)
                    .stroke(Color("starbucks-rewardgold"), lineWidth: 3)
                    .frame(width: 60, height: 60)
                    .rotationEffect(.degrees(-90))
                
                Text("\(Int(currentValue))/\(Int(totalValue))")
                    .font(.footnote.bold())
                    .offset(CGSize(width: 0.0, height: 40))
            }
            .padding()
        }
    }
}

#Preview{
    GrowingCircle()
}


