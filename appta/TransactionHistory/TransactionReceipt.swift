//
//  TransactionReceipt.swift
//  appta
//
//  Created by Assylzhan Tati on 3/22/24.
//

import SwiftUI

struct TransactionReceipt: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 10){
                HStack(){
                    Spacer()
                    
                    Image("starbucks-logo")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding(.vertical, 30)
                    
                    Spacer()
                }
                VStack(spacing: 10){
                    HStack(){
                        Text("Store")
                            .font(.callout)
                        
                        Spacer()
                        
                        Text("Dostyk 5 \n TRC Keruen")
                            .font(.callout)
                            .multilineTextAlignment(.leading)
                    }
                    
                    HStack(){
                        Text("Date & Time")
                            .font(.callout)
                        
                        Spacer()
                        
                        Text("17/02/2022 15:55")
                            .font(.callout)
                    }
                    
                    HStack(){
                        Text("Transaction ID")
                            .font(.callout)
                        
                        Spacer()
                        
                        Text("0800396046")
                            .font(.callout)
                    }
                    
                    HStack(){
                        Text("Tell No.")
                            .font(.callout)
                        
                        Spacer()
                        
                        Text("+7 777 700 10 33")
                            .font(.callout)
                    }
                    
                    HStack(){
                        Text("GST No.")
                            .font(.callout)
                        
                        Spacer()
                        
                        Text("19-8800670-D")
                            .font(.callout)
                        
                    }
                }
                .padding(.horizontal, 20)
                .foregroundColor(.secondary)
                
                Divider()
                    .frame(width: UIScreen.main.bounds.width)
                    .foregroundColor(.primary)
                    .padding(.vertical, 10)
                
                
                ForEach(0..<2, id: \.self){thing in
                    HStack(){
                        HStack{
                            Text("1 x ")
                                .font(.callout)
                            
                            Text("Freshly Brewed Coffee-Grande")
                                .font(.callout)
                        }
                        .frame(height: 50)
                        
                        Spacer()
                        
                        Text("KZT")
                        
                        Spacer()
                        
                        Text("1300")
                            .padding(.horizontal, 20)
                    }
                }
                .padding(.horizontal, 20)
                .foregroundColor(.secondary)
                
                Divider()
                    .frame(width: UIScreen.main.bounds.width)
                    .foregroundColor(.primary)
                    .padding(.vertical, 10)
                
                VStack(){
                    HStack(){
                        Text("Total Amount")
                            .font(.callout)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text("KZT")
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text("2600")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack(){
                        Spacer()
                        
                        Text("( Inclusive GST  KZT 156.72 )")
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal, 20)
                
                Divider()
                    .frame(width: UIScreen.main.bounds.width)
                    .foregroundColor(.primary)
                    .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Payment \n")
                        .font(.headline.bold())
                        .foregroundColor(.primary)
                    
                    Text("Price available includes GST. GST is not payable for purchase or loading of the Stabucks Card")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 10)
                
                Divider()
                    .frame(width: UIScreen.main.bounds.width)
                    .foregroundColor(.primary)
                    .padding(.vertical, 10)
                
                VStack(){
                    HStack(){
                        Text("Starbucks Card No:")
                        
                        Spacer()
                        
                        Text("XXXX-XXXX-XXXX-2900")
                    }
                    
                    HStack(){
                        Text("Stars Earned: ")
                        
                        Spacer()
                        
                        Text("2")
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                }
                .padding(.horizontal, 20)
                .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding(.horizontal, 50)
            
        }
    }
}

#Preview {
    TransactionReceipt()
}
