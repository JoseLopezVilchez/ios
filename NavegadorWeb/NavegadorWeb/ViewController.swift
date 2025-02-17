//
//  ViewController.swift
//  NavegadorWeb
//
//  Created by dam2 on 23/1/25.
//

import UIKit;
import WebKit;

class ViewController: UIViewController {

    var webView : WKWebView!;
    
    override func loadView() { //loadView es del ciclo de vida la primera en ejecutarse. Usamos esta porque si no el webView no estará instanciado cuando lo vayamos a usar
        webView = WKWebView(); //Instanciamos webview
        webView.navigationDelegate = self; //asignamos el viewcontroller como delegado
        view = webView; //sustituímos el view del viewcontroller (el que viene por defecto) por el webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let url = URL(string : "https://escuelaestech.es")!;
        webView.load(URLRequest(url: url));
        
        //habilitar gestos de navegacion por el historial
        webView.allowsBackForwardNavigationGestures = true;
        
    }
}

extension ViewController : WKNavigationDelegate {
    
    //se ejecuta cada vez que termina de cargar una pagina
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title;
    }
}
