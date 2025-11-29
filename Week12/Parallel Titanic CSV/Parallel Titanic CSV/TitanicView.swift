//
//  ContentView.swift
//  Parallel Titanic CSV
//
//  Created by 이승준 on 11/29/25.
//

import SwiftUI



struct TitanicView: View {
    @State private var vm = TitanicViewModel()
    var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading {
                    ProgressView("Loading Titanic data...")
                } else {
                    List(vm.passengers){
                        passenger in
                        VStack(alignment: .leading){
                            Text(passenger.name).font(.headline)
                            
                            let pclassString = passenger.pclass != 0 ? "Class \(passenger.pclass) | " : ""
                            Text(pclassString + passenger.sex.capitalized)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            
                            if passenger.age != 0 {
                                Text("Age: \(passenger.age)")
                            }
                            Text(passenger.survived ? "Survived" : "Did not survive")
                                .bold()
                                .foregroundStyle(passenger.survived ? .green : .red)
                        }
                    }
                }
            }
            .navigationTitle("Titanic Passengers")
            .task{
                await vm.fetchTitanicData()
            }
        }
    }
}

@Observable
class TitanicViewModel {
    var passengers: [Passenger] = []
    var isLoading = false
    
    @MainActor
    func fetchTitanicData() async {
        guard let url = URL(string: "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv") else {
            print("Invalid URL")
            return
        }
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            var firstLine = true
            var parsedPassengers: [Passenger] = []
            
            for try await line in url.lines {
                if firstLine {
                    firstLine = false
                    continue
                }
                
                let columns = parseCSVLine(line: line)
                guard columns.count >= 6 else {
                    continue
                }
                let id: Int = Int(columns[0]) ?? 0
                let survived: Bool = columns[1] == "1"
                let pclass: Int = Int(columns[2]) ?? 0
                let name = columns[3]
                let sex = columns[4]
                let age = Int(columns[5]) ?? 0
                
                let passenger = Passenger(id: id, survived: survived, pclass: pclass, name: name, sex: sex, age: age)
                parsedPassengers.append(passenger)
            }
            passengers = parsedPassengers
        } catch {
            print("Error fetching Titanic data")
        }
    }
    
    private func parseCSVLine(line: String) -> [String]{
        var result: [String] = []
        
        var current = ""
        var insideQuotes = false
        
        for char in line {
            if char == "\""{
                insideQuotes.toggle()
            }else if char == "," && !insideQuotes {
                result.append(current.trimmingCharacters(in: .whitespaces))
            } else {
                current.append(char)
            }
        }
        return result
    }
}

#Preview {
    TitanicView()
}
