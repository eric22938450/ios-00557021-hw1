//
//  ContentView.swift
//  ios-00557021-hw1
//
//  Created by User02 on 2021/3/10.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 0
    @State private var showAlert = false
    var body: some View {

        ZStack {
            Image("1")
                .resizable()
                .opacity(0.43)
                
            VStack {
                Text("元宵猜燈謎")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.red)
                    .offset(x:0 ,y:-200)
                Button(action:{
                    if number > 9{
                        number = 0
                    }
                    else if number == 0{
                        question.shuffle()
                        number = number + 1
                    }
                    else{
                        number = number+1
                    }
                    }
                ) {
                    if number < 1{
                    Text("開始遊戲")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                    }
                    else{
                        Text("下一題")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        Button(action: {
                            showAlert = true
                        }) {
                            Text("看答案")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                        }.alert(isPresented: $showAlert){ () -> Alert in
                            return Alert(title: Text(question[number].ans))
                        }
                    }
                }
                if number == 0{
                    Text("準備好了嗎")
                }
                else {
                    Text("第\(number)題")
                    Text(question[number].ques)
                }
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
