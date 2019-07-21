//
//  EmotionsList.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 18/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

import SwiftUI

struct EmotionsList : View {
    
    private var emotions: [EmotionRecord] = EmotionDao.shared.getAll()
    
    @State var showingProfile = false
    
    var emotionFeelingButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("Add New Emotion"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
       List(emotions) { emotion in
                NavigationLink(destination: EmotionRecordDetail(emotion: emotion)) {
                          EmotionRecordRow(emotion: emotion)
                      }
            }
            .navigationBarTitle(Text("My emotions"))
            .navigationBarItems(trailing: emotionFeelingButton)
                .sheet(isPresented: $showingProfile) {
                    EmotionRecordFeeling()
                }
                
          
           
        }
        
    }
}


#if DEBUG
struct EmotionsList_Previews : PreviewProvider {
    static var previews: some View {
        EmotionsList()
    }
}
#endif
