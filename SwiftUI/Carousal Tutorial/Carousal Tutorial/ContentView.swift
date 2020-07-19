//
//  ContentView.swift
//  Carousal Tutorial
//
//  Created by DAPL-Asset-290 on 07/07/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView : View {
    @State var pageNumber = 0
    var body : some View {
        VStack{
            HStack {
                Text("Food App")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "cart.fill").foregroundColor(.green)
                }
            }.padding(.horizontal, 20)
                .padding(.top, 10)
            ConfigureFoodType()
            GeometryReader{g in
                Carousel(pageNumber: self.$pageNumber, width: UIScreen.main.bounds.width, height: g.frame(in: .global).height)
                
            }
            PageControl(pageNumber: self.$pageNumber)
            .padding(.top,20)
        }
    }
}

struct ConfigureFoodType : View {
    @State var selectedMenuType = 0
    
    var body : some View {
        HStack(spacing: 10.0) {
            Button(action: {
                self.selectedMenuType = 0
            }) {
                Text("Fast Food")
                    .foregroundColor(self.selectedMenuType == 0 ? .white : .black)
                    .padding(.vertical, 10).padding(.horizontal, 20).overlay(Capsule().stroke(Color.green, lineWidth: 3))
            }.background(self.selectedMenuType == 0 ? Color.green : Color.white)
            .clipShape(Capsule())
            
            Button(action: {
                self.selectedMenuType = 1
            }) {
                Text("Sea Food")
                    .foregroundColor(self.selectedMenuType == 1 ? .white : .black)
                    .padding(.vertical, 10).padding(.horizontal, 20).overlay(Capsule().stroke(Color.green, lineWidth: 3))
            }.background(self.selectedMenuType == 1 ? Color.green : Color.white)
            .clipShape(Capsule())
            
            Button(action: {
                self.selectedMenuType = 2
            }) {
                Text("Dessert")
                    .foregroundColor(self.selectedMenuType == 2 ? .white : .black)
                    .padding(.vertical, 10).padding(.horizontal, 20).overlay(Capsule().stroke(Color.green, lineWidth: 3))
            }.background(self.selectedMenuType == 2 ? Color.green : Color.white)
                .clipShape(Capsule())
            Spacer()
            
        }
        .padding([.top, .leading], 20.0)
        
    }
}

struct FoodList : View{
    @Binding var pageNumber : Int
    var body : some View {
        HStack{
            ForEach(data){i in
                Card(pageNumber: self.$pageNumber, width: UIScreen.main.bounds.width, data: i)
            }
        }
    }
}

struct Carousel : UIViewRepresentable{
    
    @Binding var pageNumber : Int
    var width : CGFloat
    var height : CGFloat
    func makeCoordinator() -> Coordinator {
        return Carousel.Coordinator(carousalC: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let totalSize = width * CGFloat(data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: totalSize, height: 1.0)
        view.delegate = context.coordinator
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        let view1 = UIHostingController(rootView: FoodList(pageNumber: self.$pageNumber))
        view1.view.frame = CGRect(x: 0, y: 0, width: totalSize, height: self.height)
        view.addSubview(view1.view)
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        var carousal : Carousel
        init(carousalC: Carousel){
            carousal = carousalC
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            self.carousal.pageNumber = page
            
        }
    }
}

struct PageControl : UIViewRepresentable {
    @Binding var pageNumber : Int
    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .green
        view.pageIndicatorTintColor = UIColor.systemTeal.withAlphaComponent(0.2)
        view.numberOfPages = data.count
        
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        DispatchQueue.main.async {
            uiView.currentPage = self.pageNumber
        }
    }
}

struct Card : View {
    @Binding var pageNumber : Int
    var width : CGFloat
    var data : FoodData
    var body : some View {
        VStack {
            VStack {
                Spacer()
                HStack{
                    Text(self.data.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack{
                    Text(self.data.category)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer(minLength: 0)
                    
                    Text(self.data.price)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                }
            }.frame(width : UIScreen.main.bounds.width - 80)
                .padding(.horizontal,20)
                .padding(.top, 25)
                .padding(.vertical,self.pageNumber == data.id ? 0 : -25)
                .padding(.horizontal,self.pageNumber == data.id ? 0 : -25)
                .background(Image(self.data.image).resizable().scaledToFill())
            .cornerRadius(20)
        }.frame(width:self.width)
            .animation(.easeIn)
    }
}

struct FoodData : Identifiable {
    var id : Int
    var name: String
    var category : String
    var price : String
    var image : String
}

var data = [FoodData(id: 0, name: "Juicy Burger", category: "Fast   Food", price: "$10", image: "juicy_burger"),
            FoodData(id: 1, name: "Tower Burger", category: "Fast Food", price: "$15", image: "tower_burger"),
            FoodData(id: 2, name: "Home Pizza", category: "Fast Food", price: "$20", image: "home_pizza"),
            FoodData(id: 3, name: "Pan Pizza", category: "Fast Food", price: "$25", image: "pan_pizza")]
