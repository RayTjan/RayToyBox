//
//  ContentView.swift
//  RayToyBox
//
//  Created by Ray on 30/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

struct HomeView: View {
    @EnvironmentObject var viewModel : ViewModel
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.items, id:\.id){
                    item in
                    Text("Hello World for the \(item.count) click").padding().onTapGesture {
                        viewModel.updatePost(parameters: ["id": item.id, "title" : item.name, "count": (item.count + 1)])
                    }
                }
            }.navigationTitle("Posts")
                .navigationBarItems(trailing: plusButton)
            
        }
    }
    var plusButton:some View{
        Button(action:{
            print("Press")
            viewModel.createPost(parameters: ["name" : "something", "count" : 0])
        }, label:{
            Image(systemName: "plus")
        }).foregroundColor(.red)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }.preferredColorScheme(.dark)

    }
}


