//
//  NewsViewModel.swift
//  HaberUygulamasi
//
//  Created by Dilan Öztürk on 8.01.2023.
//

import Foundation

struct NewsTableViewModel {
    
    let newList : [News]
    
    func numberOfRowsInSection() -> Int {
        return self.newList.count
    }
    
    func newsAtIndexPath(_ index: Int) -> NewsViewModel { // tekil olarak bir haber objesine ulaşılıyor
        let news = self.newList[index]
        return NewsViewModel(news: news)
    }
    
}

struct NewsViewModel { // tek bir news modeli için bir viewmodel oluşturuyoruz
    
    let news : News
    var title : String {// haber objesinde sadece title ve story i alabileceğimiz bir değişken oluşturuyoruz
        return self.news.title
    }
    
    var story : String {
        return self.news.story
    }
}
 // view içerisinde gösterilecek şeyleri hazırlamak için bütün bunları yaptık. viewmodel viewla model arasındaki bağlantıyı kuracak yerdir
