//
//  ContentView.swift
//  RayToyBox
//
//  Created by Ray on 30/08/22.
//

import SwiftUI

struct ContentView: View {
    @State var searchString = ""
    @State var array = loadCSV(from: "rims_list3")
    @State var searchBol = false
    var suggestionArray = ["Super RS","Assetto","Alleggerita"]
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                
                HStack{
                    Image(systemName: "magnifyingglass").foregroundColor(.gray)
                    TextField("Search by name or symbol.", text:$searchString).simultaneousGesture(TapGesture().onEnded {
                        print("Textfield pressed")
                        searchBol = true
                    }).onSubmit {
                        searchBol = false
                    }
                }
                ScrollView{
                    LazyVGrid(columns: adaptiveColumns,spacing: 20){
                        ForEach(results, id: \.self){ item in
                            NavigationLink(destination: Text(item.namePart)){
                                ZStack{
                                    Rectangle().frame(width: 170, height: 170).cornerRadius(30).foregroundColor(.gray)
                                    AsyncImage(url: URL(string: item.imageURL)) { image in
                                        image.resizable().frame(width: 170, height: 170).aspectRatio(contentMode: .fit).opacity(0.5)
                                    } placeholder: {
                                        ProgressView().frame(width: 170, height: 170)
                                    }
                                    
                                    Text(item.namePart)
                                }
                            }
                            
                        }
                    }
                    //                .searchable(text: $searchString, placement: .navigationBarDrawer(displayMode: .always))
                    //                .searchable(text: $searchString,placement: .navigationBarDrawer(displayMode: .always), suggestions: {
                    //                    ForEach(suggestionArray, id:\.self){
                    //                        suggestion in
                    //                        Button {
                    //                            searchString = suggestion
                    //                        } label: {
                    //                            Text(suggestion)
                    //                        }
                    //                    }
                    //
                    //
                    //                })
                    .navigationTitle("SearchThingamajig")
                    
                    
                }
                //            VStack{
                //                List{
                //                    ForEach(results, id: \.self){
                //                        item in
                //                        NavigationLink(destination: Text(item.namePart)){
                //                            Text(item.namePart)
                //                        }
                //                    }
                //                }
//                .searchable(text: $searchString, placement: .navigationBarDrawer(displayMode: .always))
//                .navigationTitle("SearchThingamajig")
                //
                //            }
                
            }
        }
        
        
    }
    var results:[Part] {
        
        //        if (searchString == " "){
        //            return[]
        //        }
        //        else
        if searchBol == true{
            return []
        }
        else if searchString.isEmpty{
            return array
        }
        else{
            print("There is content")
            return array.filter{$0.namePart.localizedCaseInsensitiveContains(searchString) || $0.partCategory.localizedCaseInsensitiveContains(searchString)
                ||
                $0.nameBrand.localizedCaseInsensitiveContains(searchString)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


