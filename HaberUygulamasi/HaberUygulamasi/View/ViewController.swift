//
//  ViewController.swift
//  HaberUygulamasi
//
//  Created by Dilan Öztürk on 8.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    private var newsTableViewModel : NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self // bu ikisi her zaman yazılmalı
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension // hücrelerin dinamik bir boyuta sahip olacağını söylüyoruz
        tableView.estimatedRowHeight = UITableView.automaticDimension // buradan sonra aşağıda bir heightForRowAt fonksiyonu açıyoruz
        
        veriAl() // veriAl fonksiyonunu çağırıyoruz
        
    }
    
    func veriAl(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json") // bu stringten bir url oluşturduk
        
        WebService().haberleriIndir(url: url!) { haberler in
            if let haberler = haberler {
                self.newsTableViewModel = NewsTableViewModel(newList: haberler)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }     // veriyi çektik. şimdi veriyi hazırlayıp viewcontroller içerisinde kullanılacak hale getirmek lazım. bunun için, viewmodel dosyasının altında newsviewmodel dosyası oluşturup içerisine iki tane struct oluşturuyoruz

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowsInSection() // böylece içerisinde kaç tane veri varsa buraya alıp gösterilir. hata oluşma ihtimaline karşı nil gelirse 0 gösterecek, gelmezse verileri alacak
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(indexPath.row) // tekil bir model döndürecek
        cell.titleLabel.text = newsViewModel.title
        cell.storyLabel.text = newsViewModel.story
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension // bu hücre boyutunu otomatik olarak ayarlamak için yeterli değil. buradan sonra main e gidip storyLabel ın özelliklerinden lines ı 0 yapmak gerekiyor. daha sonra da add new constraints e gelip height in solundaki kutucuğu işaretleyip add 1 constraint diyoruz. son olarak da sağdaki vertical bölümünün height equals kısmında edit e tıklayıp eşittir yerine büyük eşit diyoruz. Bunun dışında hücrelere tıklayabilme özelliğini kaldırmak için view ın altındaki table view a tıklıyoruz. ayarlardan selection seçeneğini no selection yapıyoruz
    }


}

