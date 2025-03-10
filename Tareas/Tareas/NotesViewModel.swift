//
//  NotesViewModel.swift
//  Tareas
//
//  Created by dam2 on 4/3/25.
//

import Foundation;
import SwiftUI;

final class NotesViewModel : ObservableObject {
    
    @Published var notes : [NoteModel] = []; //array que contendrá las notas
    
    private let userDefaults : UserDefaults = .standard;
    
    init () {
        notes = getAllNotes();
    }
    
    //Método que se llamará al pulsar un botón de crear nota
    func saveNote (description : String) {
        let newNote = NoteModel(description: description);
        notes.insert(newNote, at: 0);
        
        //Actualizamos UserDefaults
        encodeAndSaveAllNotes();
    }
    
    func removeNote (withId id : String) {
        notes.removeAll(where: { $0.id == id });
        encodeAndSaveAllNotes();
    }
    
    func updateFavoriteNote (note : Binding<NoteModel>) {
        note.wrappedValue.isFavorited = !note.wrappedValue.isFavorited;
        encodeAndSaveAllNotes();
    }
    
    func getNumberOfNotes () -> String {
        return "\(notes.count)";
    }
    
    //actualiza la lista de notas en UserDefaults
    private func encodeAndSaveAllNotes () {
        if let encoded = try? JSONEncoder().encode(notes) {
            userDefaults.set(encoded, forKey: "notes");
        }
    }
    
    //recupera datos de UserDefaults
    private func getAllNotes () -> [NoteModel] {
        if let notesData = userDefaults.object(forKey: "notes") as? Data, let notes = try? JSONDecoder().decode([NoteModel].self, from: notesData) {
            return notes;
        }
        return [];
    }
    
}
