//
//  SearchBarView.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String?
    
    func makeUIView(context: UIViewRepresentableContext<SearchBarView>) -> UISearchBar {
        let searchbar = UISearchBar(frame: .zero)
        searchbar.delegate = context.coordinator
        searchbar.placeholder = placeholder
        return searchbar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBarView>) {
        uiView.text = text
    }
    
    func makeCoordinator() -> SearchBarView.Coordinator {
        return Coordinator(text: $text, placeholder: placeholder)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        var placeholder: String?
        
        init(text: Binding<String>, placeholder: String?) {
            _text = text
            self.placeholder = placeholder
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}
