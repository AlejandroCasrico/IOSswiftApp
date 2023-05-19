//
//  RestaurantListViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 02/05/23.
//

import UIKit

class RestaurantListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantArray?.count ?? 0
    }
    var refreshControl : UIRefreshControl!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell =
                
                tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell") as? RestaurantTableViewCell
        else{
            return UITableViewCell()
        }
        cell.data = restaurantArray?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name:"TercerParcial",
                                 bundle:
                                    Bundle.main)
            .instantiateViewController(withIdentifier: "RestaurantDetailViewController")as?
        RestaurantDetailViewController
        vc?.detailsRestaurant = restaurantArray?[indexPath.row]
        self.navigationController?.pushViewController(vc!,
                                                      animated: true)
        print(restaurantArray?[indexPath.row].name ?? "Chocomanzana")
    }
    
    var restaurantArray :[restaurantModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle =
            NSAttributedString(string:"Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for:.valueChanged)
        tableView.addSubview(refreshControl)
        refreshControl.tintColor = UIColor.red

        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        request()
    }
    func request(){
        let url = URL(string: "https://gist.githubusercontent.com/jorgegit/f1c89ab2e409c98ec618fdb9e75077bd/raw/15e41a39c9c251cad31639feabf0ce4ba131bb19/restaurants.json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    print("dataaaaaaa")
                    print(data)
                    if let data = data {
                        if let restaurants = try? JSONDecoder().decode([restaurantModel].self, from: data) {
                            print("lista de webservice")
                            print(restaurants)
                            self.restaurantArray = restaurants
                            DispatchQueue.main.sync {
                               self.tableView.reloadData()
                            }
                            
                        } else {
                            print("Invalid Response")
                        }
                    } else if let error = error {
                        print("HTTP Request Failed \\(error)")
                    }
                }
                task.resume()
            }
    @objc func refresh (_sender:Any){
        refreshControl.endRefreshing()
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


struct restaurantModel: Decodable {
    let name: String?
    let longitude: String?
    let latitude: String?
    let phone: String?
    let rating: Double?
    let delivery: String?
    let isFavorite: Bool?
    let fee: String?
    let imgName: String?
    let webSite: String?
}
