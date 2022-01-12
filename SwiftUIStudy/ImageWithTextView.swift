//
//  ImageWithTextView.swift
//  SwiftUIStudy
//
//  Created by Yeseul Kim on 1/12/22.
//

import SwiftUI
import CoreData

struct ImageWithTextView: View {
    var body: some View {
        VStack(){
            Image("sample")
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 300, alignment: .top)
            Text(verbatim: sampleTitle)
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .bold, design: .serif))
                .background(Color.blue)
                .padding(20)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 50, maxHeight: 50, alignment: .top)
            Text(verbatim: sampleText)
                .font(.system(size: 15, weight: .regular, design: .serif))
                .padding(10)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 300, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
        }
    }
}

struct ImageWithTextView2: View {
    var body: some View {
        VStack(){
            Image("sample2")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
                .frame(width: 700)
                .clipped()
                .opacity(0.8)
                .overlay(
                    Color.black
                        .opacity(0.6)
                        .overlay(
                            VStack(){
                                Text(verbatim: sampleTitle)
                                    .lineSpacing(10.0)
                                    .font(.system(size: 26, weight: .bold, design: .serif))
                                    .foregroundColor(.white)
                                Text(verbatim: sampleText)
                                    .font(.system(size: 17, weight: .regular, design: .serif))
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 400, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 300, maxHeight: 600, alignment: .top)
                            }
                        )
                )
        }
    }
}

struct ImageWithTextView_Previews: PreviewProvider {
    static var previews: some View {
        ImageWithTextView2()
    }
}
