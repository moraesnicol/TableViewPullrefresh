//
//  APIResponse.swift
//  TableViewPullrefresh
//
//  Created by Gabriel on 19/06/21.
//

import UIKit

struct APIResponse: Codable {
    let results: APIResponseResults
    let status: String
}

struct APIResponseResults: Codable {
    <#fields#>
}

/*
 
 {"notifications":[{"id":"01","isRead":false,"content":"O seu pedido foi enviado!"},{"id":"02","isRead":true,"content":"Seu pedido saiu para entrega!"},{"id":"03","isRead":false,"content":"O seu pedido foi enviado!"},{"id":"04","isRead":false,"content":"Você já viu as novas promoções?"},{"id":"05","isRead":true,"content":"Promoção Pague 1 leve 2!"},{"id":"05","isRead":false,"content":"Atualize o seu cadastro."},{"id":"06","isRead":true,"content":"Pedido em separação"},{"id":"07","isRead":true,"content":"Nota fiscal emitida!"},{"id":"08","isRead":false,"content":"Recebemos o pagamento do seu boleto!"},{"id":"09","isRead":true,"content":"O seu pedido foi enviado!"},{"id":"10","isRead":false,"content":"Nota fiscal emitida!"},{"id":"11","isRead":false,"content":"Pedido em separação"},{"id":"12","isRead":true,"content":"Pagamento aprovado!!"}]}
 
 
 
 
 
 
 
 */
