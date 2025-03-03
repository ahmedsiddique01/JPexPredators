//
//  PredatorMap.swift
//  JPexPredators
//
//  Created by Ahmed Siddique on 04/03/2025.
//

import SwiftUI
import MapKit
struct PredatorMap: View {
    let predators = Predators()
    @State var position: MapCameraPosition
    @State var isSatellite = false
    
    var body: some View {
        Map(position: $position){
            ForEach(predators.apexPredators){
                predator in
                Annotation(
                    predator.name,
                    coordinate: predator.location){
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .shadow(color:.white, radius:5)
                            .scaleEffect(x: -1)
                }
            }
        }.mapStyle(isSatellite ? .imagery(elevation: .realistic) :
                .standard (elevation: .realistic)          )
            .overlay(alignment: .bottomTrailing) {
                Button{
                    isSatellite.toggle()
                }label: {
                    Image(systemName: isSatellite ? "globe.americas.fill" : "globe.americas")
                        .font(.largeTitle)
                        .imageScale(.large)
                        .padding(3)
                        .background(.ultraThinMaterial)
                        .clipShape(.rect(cornerRadius: 7))
                        .shadow(radius:3)
                        .padding()
                }
            }
    }
}

#Preview {
    let position = Predators().apexPredators[2].location
    PredatorMap(position:
        .camera(
            MapCamera(centerCoordinate: position,
                      distance: 1000,
                      heading: 250, pitch: 80
                     )
        )
    ).preferredColorScheme(.dark)
}
