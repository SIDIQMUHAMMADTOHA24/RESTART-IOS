//
//  ContentView.swift
//  RestartApp
//
//  Created by sidiqtoha on 15/07/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnBoardingActive: Bool = true
    var body: some View {
        ZStack {
            if(isOnBoardingActive){
                OnBoardingView()
            }else{
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}



//CATATAN

//SHIFT + COMMEND + A UNTUK MENGGANTI MODE DARKMODE 
