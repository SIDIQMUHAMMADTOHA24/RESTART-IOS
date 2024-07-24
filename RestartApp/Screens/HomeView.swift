//
//  HomeView.swift
//  RestartApp
//
//  Created by sidiqtoha on 20/07/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnBoardingActive: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            
            //MARK: HEADER
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1 )
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeOut(duration: 4)
                            .repeatForever()
                        , value: isAnimating
                    )
                
            }
            
            //MARK: CENTER
            
             Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding()
        
            
            //MARK: FOOTER
            Spacer()
            
            Button(action: {
                withAnimation{
                    playSound(sound: "success", type: "m4a")
                    isOnBoardingActive = true
                }
            }, label: {
                Image(systemName:"arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            })
            .buttonStyle(BorderedProminentButtonStyle())
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        //onAppear ini seperti init di flutter
        .onAppear(perform: {
            //Menambahkan delay ketika pertama kali membuka aplikasi seperti
            //await Future.delayed selama 3 detik
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                isAnimating = true
            })
        })
    }
}

#Preview {
    HomeView()
}
