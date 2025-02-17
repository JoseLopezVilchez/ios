//
//  AjustesViewController.swift
//  SideMenu
//
//  Created by mac-profesor on 21/1/25.
//

/*
 - PANTALLA WEBVIEW
3. Añadir una pantalla con un WebView, donde aparezca la página web de la escuela. A esta pantalla se accede desde el menú lateral izquierdo.
4. Implementar el botón retroceder para ir a la página anterior del historial. Implementar el botón avanzar para ir a la página siguiente del historial. Implementar el botón de refrescar en el navegador.
5. Permitir al usuario introducir una URL para navegar hasta ella. Si no incluye el protocolo (https://) se deberá añadir a la dirección automáticamente.
6. (Avanzado) Crear un menú lateral a la derecha que sólo aparecerá en la vista del WebView. En él habrá 3 botones con 3 URLs para navegar a estas direcciones.
7 y 8. (Avanzado) Implentar una nueva funcionalidad para agregar marcadores o favoritos al menú derecho.
*/

import UIKit;
import WebKit;

class AjustesViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var btnIzq: UIBarButtonItem!;
    @IBOutlet weak var btnDer: UIBarButtonItem!;
    @IBOutlet weak var webView: WKWebView!;
    @IBOutlet weak var textInput: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad();

        self.configureSideMenus(btnIzq: btnIzq, btnDer: btnDer);
        
        webView.navigationDelegate = self;
        
        let url = URL(string : "https://escuelaestech.es")!;
        webView.load(URLRequest(url: url));
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title;
    }
    
    @IBAction func reload(_ sender: Any) {
        webView.reload();
    }
    
    
    @IBAction func back(_ sender: Any) {
        webView.goBack();
    }
    
    
    @IBAction func forward(_ sender: Any) {
        webView.goForward();
    }
    
    @IBAction func go(_ sender: Any) {
        guard let texto = textInput.text else { return };
        var url : URL;
        
        if (texto.hasPrefix("https://")) {
            guard let urlTemp = URL(string: texto) else { return };
            url = urlTemp;
        } else {
            if texto.contains("."), let urlTemp = URL(string: "https://" + texto), let urlComponents = URLComponents(url: urlTemp, resolvingAgainstBaseURL: false), urlComponents.scheme == "https", urlComponents.host != nil {
                print(urlTemp);
                url = urlTemp;
            } else {
                guard let urlTemp = URL(string: "https://www.google.es/search?q=" + texto) else { return };
                print(urlTemp);
                url = urlTemp;
            }
        }
        
        webView.load(URLRequest(url: url));
    }
    
}
