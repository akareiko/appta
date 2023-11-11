import SwiftUI

struct VoucherView: View {
    var body: some View {
        VStack(){
            VStack(spacing: 15){
                Text("STARBUCKS")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .offset(CGSize(width: 0.0, height: -135.0))
                
                // Dotted lines...
                Line()
                    .stroke(Color.black, style: StrokeStyle(lineWidth: 1, lineCap: .butt, lineJoin: .miter, dash: [10]))
                    .frame(height: 1)
                    .padding(.horizontal)
                    .offset(CGSize(width: 3.0, height: -45.0))
                
                HStack(){
                    VStack(alignment: .leading, spacing: 8, content:{
                        Text("Your Beveage")
                            .font(.caption)
                        Text("Latte Machiatto")
                            .font(.title2)
                            .fontWeight(.heavy)
                    })
                    .foregroundColor(Color(.black))
                    .frame(maxWidth: .infinity)
                    
                    VStack(alignment: .leading, spacing: 8, content:{
                        Text("Total Bill")
                            .font(.caption)
                        Text("$750")
                            .font(.title2)
                            .fontWeight(.heavy)
                        })
                    .foregroundColor(Color(.black))
                    .frame(maxWidth: .infinity)
                }
                .offset(CGSize(width: 0.0, height: -150.0))
            }
            .frame(maxWidth: 400, maxHeight: 450)
            .padding()
            .background(Color.white).clipShape(BillShape())
            .cornerRadius(25)
            .padding(.horizontal)
            .offset(CGSize(width: 0.0, height: 150.0))
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color("starbucks-rewardgold"))
                .offset(CGSize(width: 0.0, height: -130))
            
            Text("Voucher code:")
                .font(.title)
                .fontWeight (.bold)
                .offset(CGSize(width: 0.0, height: -130))
            
            Text("23480")
                .font(.largeTitle)
                .fontWeight (.bold)
                .offset(CGSize(width: 0.0, height: -130))
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 320, height: 110)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(Color.black, lineWidth: 2)
                        .frame(height: 130)
                )
                .offset(CGSize(width: 0.0, height: -130.0))
                .overlay(content: {
                    Image("barcode")
                        .resizable()
                        .frame(width: 300, height: 200)
                        .offset(CGSize(width: 0.0, height: -125.0))
                })

            
            
            
                
            
            Spacer()
        }
        .background(Color.gray.ignoresSafeArea(.all, edges: .all).opacity(0.5))
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
                
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct BillShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            path.move(to: CGPoint(x: 0, y: 80))
            path.addArc(center: CGPoint(x: 0, y: 200), radius: 25, startAngle: .init(degrees: -90), endAngle: .init(degrees: 90), clockwise: false)
            
            path.move(to: CGPoint(x: rect.width, y: 80))
            path.addArc(center: CGPoint(x: rect.width, y: 200), radius: 25, startAngle: .init(degrees: 90), endAngle: .init(degrees: -90), clockwise: false)
        }
    }
}

#Preview {
    VoucherView()
}
