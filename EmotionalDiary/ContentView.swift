//
//  ContentView.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 11/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//
import SwiftUI

struct ContentView : View {
    
    var body: some View {
        TabbedView {
            EmotionsList()
                .tabItem {
                    VStack {
                    Image(systemName: "heart.fill")
                    Text(" a tab item ")
                }
            }
            .tag(0)
            

            NavigationView {
                List {
                    EmotionRecordRow(emotion: EmotionRecord(id: 1, situation: "Something", feeling: .happiness, thoughts: "Some...", result: "Result", creationDate: Date()))
                }
                .navigationBarTitle(Text("Your emotions"))
            }
            .tabItem {
                Text("Resume")
            }
            .tag(1)
        }
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
