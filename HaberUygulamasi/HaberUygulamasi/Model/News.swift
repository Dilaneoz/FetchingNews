//
//  News.swift
//  HaberUygulamasi
//
//  Created by Dilan Öztürk on 8.01.2023.
//

import Foundation

// burada amaç internetten veri çekmek ve onu okunabilir hale getirmek

struct News : Decodable { // decodable dış bir biçimlendirmeden gelen bir datayı okunabilir bir hale çevirir
    var title : String
    var story : String
}
