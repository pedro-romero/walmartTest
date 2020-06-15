//
//  StoresViewController.swift
//  walmartTest
//
//  Created by Pedro Iván Romero Ojeda on 6/15/20.
//  Copyright © 2020 piro. All rights reserved.
//

import UIKit

class StoresViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var stores: [Store] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        requestStores()
        // Do any additional setup after loading the view.
    }
    
    private func requestStores() {
        Store.stores { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let stores):
                self.stores = stores
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StoresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath) as! StoreTableViewCell
        let store = stores[indexPath.row]
        cell.configure(store)
        return cell
    }
    
    
}

extension StoresViewController: UITableViewDelegate {
    
}
