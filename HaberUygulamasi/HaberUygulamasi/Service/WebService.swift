//
//  WebService.swift
//  HaberUygulamasi
//
//  Created by Dilan Öztürk on 8.01.2023.
//

import Foundation

// internete gidip veri çekmeyi sağlayan fonksiyonun yazımı

class WebService {
    
    func haberleriIndir(url: URL, completion: @escaping ([News]?) -> ()) { // url yi yazma sebebi hangi adresten verinin indirileceğini göstermektir. Optional (?) koyma sebebi de verinin gelmeme ihtimalidir. Hata mesajlarını ele alabilmemiz gerekiyor
        
        URLSession.shared.dataTask(with: url) { data, response, error in // internetten bir istek yapacağımızda urlsession ı kullanıyoruz. datatask içindeki completionHandler, bu istek bittikten sonra ne yapılacağını belirten bir tamamlama bloğu yaratır
            
            if let error = error { // hata mesajı var mı
                print(error.localizedDescription)
                completion(nil) // bu completion opsiyonel(?) bir haberler dizisi bekliyor. hata mesajı varsa haber dizisi döndüremeyecek
            }else if let data = data { // hata mesajı yoksa haberler dizisi döndürecek
                let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data) // bu bize bi news dizisi döndürecek
                if let haberlerDizisi = haberlerDizisi {
                    completion(haberlerDizisi)
                }
            }
            
        } .resume() // bütün bu işlemleri başlatmak için resume u kullanıyoruz
        
    }
    
}

// buradan sonra viewcontroller a gidip url yi girmemiz gerekiyor
