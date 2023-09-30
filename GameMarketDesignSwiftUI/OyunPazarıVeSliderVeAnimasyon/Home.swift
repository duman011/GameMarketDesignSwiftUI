//
//  ContentView.swift
//  OyunPazarıVeSliderVeAnimasyon
//
//  Created by Yaşar Duman on 19.09.2023.
//

import SwiftUI


struct Home: View {
    @State var ara = ""
    @State var index = 0
    @State var stunlar = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    var oyunVerileri = [
        OyunModel(id: 0, adi: "Resident Evil 3", goruntu: "g2", oy: 3),
        OyunModel(id: 1, adi: "GTA 5", goruntu: "g3", oy: 5),
        OyunModel(id: 2, adi: "Assassin's Creed Odesey", goruntu: "g4", oy: 3),
        OyunModel(id: 3, adi: "Resident Evil 7", goruntu: "g5", oy: 2),
        OyunModel(id: 4, adi: "Watch Dogs 2", goruntu: "g6", oy: 1),
        OyunModel(id: 5, adi: "The Evil Within 2", goruntu: "g7", oy: 2),
        OyunModel(id: 6, adi: "Tomb Raider 2014", goruntu: "g8", oy: 4),
        OyunModel(id: 7, adi: "Shadow Of The Tomb Raide", goruntu: "g1", oy: 4)
    ]
    
    var body: some View {
        ScrollView{
            LazyVStack{
                HStack{
                    Text("Oyun Pazarı").font(.title).fontWeight(.bold)
                    Spacer()
                }.padding(.horizontal)
                
                TextField("Ara", text: self.$ara)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                TabView(selection: self.$index,//0.indexteki sekme seçili olacak
                        content:  {
                    ForEach(0...5, id: \.self) { index in
                        Image("p\(index)").resizable()
                            .frame(height: self.index == index ? 230 : 180)
                            .cornerRadius(15)
                            .padding(.horizontal)
                            .tag(index)
                    }
                }).frame(height: 230)
                    .padding(.top, 25)
                    .tabViewStyle(PageTabViewStyle())
                    .animation(.easeOut)
                
                HStack{
                    Text("Popüler").font(.title).fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        withAnimation {
                            if self.stunlar.count == 2 {//2 sutunlu gorunumdeysek
                                self.stunlar.removeLast()
                            } else { //Tek sütun var . 2 sütuna çıkarmak içinb
                                self.stunlar.append(GridItem(.flexible(),spacing: 15))
                            }
                        }
                    }, label: {
                        Image(systemName: self.stunlar.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                            .font(.system(size: 24))
                            .foregroundStyle(.black)
                    })
                }//HStack Bitişi
                .padding(.horizontal).padding(.top, 25)
                
                LazyVGrid(columns: stunlar, spacing: 25, content: {
                    ForEach(oyunVerileri) { oyun in
                        //GridView Burda Çagırılacak
                        GridView(oyun: oyun, stunlar: self.$stunlar)
                    }
                }).padding([.horizontal,.top])
                
            }.padding(.vertical)
        }.background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    Home()
}
