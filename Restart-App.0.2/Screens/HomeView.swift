//
//  HomeView.swift
//  Restart-App-01 (iOS)
//
//  Created by Samuel Noye on 06/12/2021.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY

    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    //MARK: - BODY
    
    
    var body: some View {
        VStack(spacing:20){
            
            //MARK: - HEADER
            Spacer()
            ZStack{
                CircleGroupView(ShapeColor: Color("ColorBlue"), ShapeOpacity: 0.5)
             Image("character-2")
                .resizable()
                .scaledToFit()
                .padding()
                .offset( y: isAnimating ? 35 : -35)
                .animation(Animation
                            .easeInOut(duration: 4)
                            .repeatForever(),
                           value: isAnimating
                )
            }
            //MARK: - CENTER
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(8)
            
            
            //MARK: - FOOTER
            
             Spacer()
            
            
            Button(action:{
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                } 
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }//: VStack
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
}
    //MARK:-
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
