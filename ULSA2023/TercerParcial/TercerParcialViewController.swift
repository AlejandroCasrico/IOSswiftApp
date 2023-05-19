//
//  TercerParcialViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 15/05/23.
//

import UIKit

class TercerParcialViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl : UIRefreshControl!
    var statesArray :[statesModel]?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(statesArray?.count ?? 0)
        return statesArray?.count ?? 0
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell =
                
                tableView.dequeueReusableCell(withIdentifier: "TercerParcialTableViewCell") as? TercerParcialTableViewCell
        else{
            return UITableViewCell()
        }
        cell.data = statesArray?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name:"TercerParcial",
                                 bundle:
                                    Bundle.main)
            .instantiateViewController(withIdentifier: "TercerPDetailViewController")as?
        TercerPDetailViewController
        vc?.detailsStates = statesArray?[indexPath.row]
        self.navigationController?.pushViewController(vc!,
                                                      animated: true)
        print(statesArray?[indexPath.row].name ?? "Chocoperra")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Estados de Mexico"
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle =
            NSAttributedString(string:"Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for:.valueChanged)
        tableView.addSubview(refreshControl)
        refreshControl.tintColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        request()
    }
    func request(){
        let url = URL(string: "https://gist.githubusercontent.com/AlejandroCasrico/00bcf990e9eb2b3dfa78b82416afc3bc/raw/c1b04911d6f53a9790615f340edb69f26604e6b8/gistfile1.txt")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    print("dataaaaaaa")
                    print(data)
                    if let data = data {
                        if let states = try? JSONDecoder().decode([statesModel].self, from: data) {
                            print("lista de webservice")
                            print(states)
                            self.statesArray = states
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }


}

struct statesModel: Decodable {
    let name: String?
    let latitude: String?
    let longitude: String?
    let poblacion: String?
    let capital: String?
    let platillo: String?
    let imgName: String?
    let sitio_web: String?
}

