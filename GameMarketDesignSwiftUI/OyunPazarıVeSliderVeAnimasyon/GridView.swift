//
//  GridView.swift
//  OyunPazarıVeSliderVeAnimasyon
//
//  Created by Yaşar Duman on 19.09.2023.
//

import SwiftUI

struct GridView: View {
    var oyun : OyunModel
    @Binding var stunlar : [GridItem]
    @Namespace var namespace
    
    var body: some View {
        VStack{
            
            if self.stunlar.count == 2 {//2 sütunlu gorunum
                VStack(spacing: 15){  
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                        Image(oyun.goruntu).resizable().frame(width: (UIScreen.main.bounds.width -  45) / 2, height: 250).cornerRadius(15)
                        
                        Button(action: {}, label: {
                            Image(systemName: "heart.fill").foregroundStyle(.red)
                                .padding(.all, 10)
                                .background(Color.white)
                                .clipShape(Circle())
                        }).padding(.all, 10)
                    }.matchedGeometryEffect(id: "goruntu", in: self.namespace)
                    
                    Text(oyun.adi).fontWeight(.bold)
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "baslik", in: self.namespace)
                    
                    Button(action: {}, label: {
                        Text("Satın Al").foregroundStyle(.white)
                            .padding(.vertical, 10).padding(.horizontal, 25)
                            .background(Color.red).cornerRadius(10)
                    }).matchedGeometryEffect(id: "satinal", in: self.namespace)
                }
            } else { //tek sutunlu gorunum
                HStack(spacing: 15){
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                        Image(oyun.goruntu)
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width -  45) / 2, height: 250)
                            .cornerRadius(15)
                        
                        Button(action: {}, label: {
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                                .padding(.all, 10)
                                .background(Color.white)
                                .clipShape(Circle())
                        }).padding(.all, 10)
                    }.matchedGeometryEffect(id: "goruntu", in: self.namespace)
                 
                    VStack(alignment: .leading, spacing: 10){
                        Text(oyun.adi)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "baslik", in: self.namespace)
                        HStack(spacing: 10){
                            ForEach(1...5, id: \.self){ oy in
                                Image(systemName: "star.fill")
                                    .foregroundStyle(self.oyun.oy >= oy ? .yellow : .gray)
                                
                                
                            }
                            Spacer(minLength: 0)
                        }//HStack Bitişi
                     
                        
                        Button(action: {}, label: {
                            Text("Satın Al")
                                .foregroundStyle(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 25)
                                .background(Color.red)
                                .cornerRadius(10)
                            
                        }).padding(.top, 10).matchedGeometryEffect(id: "satinal", in: namespace)
                    }//VStak Birişi
                }//HStack Bitişi
                .padding(.trailing).background(Color.white).cornerRadius(15)
            }//Else Bitişi

        }
        
    }
}

