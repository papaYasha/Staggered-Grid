//
//  Home.swift
//  StaggeredGrid
//
//  Created by Admin on 2.09.22.
//

import SwiftUI

struct Home: View {

    @State var photos: [Photos] = []
    @State var columns: Int = 2

    @Namespace var animation

    var body: some View {

        NavigationView {

            StaggeredGrid(columns: columns, list: photos, content: { photo in
                PhotoCardView(photo: photo)
                    .matchedGeometryEffect(id: photo.id, in: animation)
            })
            .navigationTitle("Staggered Grid")
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        columns += 1
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        columns -= max(columns - 1, 1)
                    } label: {
                        Image(systemName: "minus")
                    }
                }
            }
            .animation(.easeInOut, value: columns)
        }
        .onAppear {
            for index in 1...10 {
                photos.append(Photos(imageURL: "photo\(index)"))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct PhotoCardView: View {
    var photo: Photos

    var body: some View {
        Image(photo.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}
