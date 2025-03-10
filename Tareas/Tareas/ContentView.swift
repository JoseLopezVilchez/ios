//
//  ContentView.swift
//  Tareas
//
//  Created by dam2 on 4/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var descriptionNote : String = "";
    @StateObject var notesViewModel = NotesViewModel(); //instancia el viewmodel
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Text("Añade una nota")
                    .underline()
                    .foregroundStyle(Color.blue)
                
                TextEditor(text: $descriptionNote)
                    .frame(height: 100)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 2)
                    }
                    .padding(.horizontal, 12)
                
                Button("Crear") {
                    notesViewModel.saveNote(description: descriptionNote);
                    descriptionNote = ""; //limpia texteditor
                }
                .buttonStyle(.bordered)
                .tint(Color.blue)
                
                Spacer()
                
                List {
                    ForEach($notesViewModel.notes, id: \.id) { $nota in
                        HStack {
                            if nota.isFavorited {
                                Label(nota.description, systemImage: "star.fill")
                            } else {
                                Text(nota.description)
                            }
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                notesViewModel.updateFavoriteNote(note: $nota)
                            } label: {
                                Label("Favorito", systemImage: "star.fill")
                            }
                            .tint(Color.yellow)
                        }
                        .swipeActions(edge: .trailing) {
                            Button {
                                notesViewModel.removeNote(withId: nota.id)
                            } label: {
                                Label("Borrar", systemImage: "trash.fill")
                            }
                            .tint(Color.red)
                        }
                    }
                }
            }
            .navigationTitle("Tareas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Text("Total: \(notesViewModel.getNumberOfNotes())")
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
