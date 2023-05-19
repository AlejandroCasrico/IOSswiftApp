
import UIKit

class SeriesTVViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var refreshControl : UIRefreshControl!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addSubview: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
                
                tableView.dequeueReusableCell(withIdentifier: "CharactersTableViewCell") as? CharactersTableViewCell
        else{
            return UITableViewCell()
        }
        cell.data = charactersArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name:"TercerParcial",
                                 bundle:
                                    Bundle.main)
            .instantiateViewController(withIdentifier: "SeriesTVViewController")as?
        DetailssViewController
        vc?.detailData = charactersArray[indexPath.row]
        self.navigationController?.pushViewController(vc!,
                                                      animated: true)
        print(charactersArray[indexPath.row].name ?? "Chocobanana")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
 

    
    var charactersArray = [
        demonSlayerCharacters(image:"aguapilar", name:"Tomioka",range:     "pilar",ability: "water breathing",status: true),
        demonSlayerCharacters(image:"viento", name:"sanemi",range:     "pilar",ability: "wind breathing",status: true),
        demonSlayerCharacters(image:"yorichi", name:"yorichi",range:     "Leyend",ability: "solar breathing",status: false),
        demonSlayerCharacters(image:"serpiente", name:"obanai",range:     "pilar",ability: "snake breathing",status: true),
        demonSlayerCharacters(image:"rocap", name:"Gyomei",range:     "pilar",ability: "rock breathing",status: true),
        demonSlayerCharacters(image:"pilaramor", name:"mitsury",range:     "pilar",ability: "love breathing",status: true),
        demonSlayerCharacters(image:"pilar sonido", name:"tengen",range:"pilar",ability: "sound breathing",status: true),
        demonSlayerCharacters(image:"niebla", name:"tokito",range:     "pilar",ability: "niebla breathing",status: true),
        demonSlayerCharacters(image:"insecto", name:"",range:     "kanao",ability: "insect breathing",status: true),
        demonSlayerCharacters(image:"kyoyuro", name:"rengoku",range:     "pilar",ability: "fire breathing",status: false),
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Demon Slayer"
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle =
            NSAttributedString(string:"Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for:.valueChanged)
        tableView.addSubview(refreshControl)
        refreshControl.tintColor = UIColor.green
        // Do any additional setup after loading the view.
    }
 
    @objc func refresh (_sender:Any){
        refreshControl.endRefreshing()
    }

}
struct demonSlayerCharacters {
    let image : String?
    let name : String?
    let range : String?
    let ability : String?
    let status : Bool?
}
