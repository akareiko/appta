import SwiftUI

struct SampleMag: View {
    
    var body: some View {
        VStack{
            ZStack{
                Image("vecone")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 300)
                    .offset(x: -285, y: 65)
                    .rotationEffect(.degrees(90))
                
                Image("vectwo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 300)
                    .offset(x: -50, y: 150)
                    .rotationEffect(.degrees(180))
                
                Image("vecone")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 300)
                    .offset(x: -285, y: 65)
                    .rotationEffect(.degrees(270))
                
                Image("vectwo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 300)
                    .offset(x: -50, y: 150)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.ultraThinMaterial)
//                    .stroke(Color("starbucks-lightgold"), lineWidth: 2)
                    .shadow(radius: 10)
                    .frame(width: 300, height: 350)
                    .offset(y: -30)
                
                VStack{
                    Circle()
                        .fill(Color("starbucks-lightgold").gradient)
//                        .stroke(Color("starbucks-lightgold"), lineWidth: 2)
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(Color.white)
                                .frame(width: 50, height: 50)
                                .font(.title2)
                        )
                    Text("Make an order")
                        .font(Font.custom("Vetrino", size: 45))
                        .padding(.top, 25)
                }
                .offset(y: -30)
            }
        }
    }
}

#Preview {
    SampleMag()
}
