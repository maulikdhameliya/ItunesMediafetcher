//
//  ViewController.swift
//  ItunesMediafetcher
//
//  Created by PC on 26/09/18.
//  Copyright © 2018 PC. All rights reserved.
//

import UIKit
import SwiftyJSON

class ListVC: UITableViewController {
    
    //CONSTANTS
    let baseURL = "https://rss.itunes.apple.com/api/v1/"
    
    //VARIABLES
    var arrData = [ResultViewModel]();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callService(params: ["us","apple-music","coming-soon","all","100","explicit"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func callService(params:[String]){
        let url = baseURL + params.joined(separator: "/") + ".json" //CONVERT PARAMS INTO REST FORMAT
        let task = URLSession.shared.dataTask(with: URL.init(string: url)!) { (data, response, error) in
            if let data = data {
                do{
                    self.arrData = [ResultViewModel]()
                    let json = try JSON(data: data)
                    let feed = json["feed"].dictionary!
                    let arrResult = feed["results"]!.array
                    for result in arrResult!{
                        let viewModel = ResultViewModel.init(json: result)
                        self.arrData.append(viewModel)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "GoToDetails"){
            let indexPath = tableView.indexPath(for: sender as! ListCell)!
            let detailsVC = segue.destination as! DetailsVC
            detailsVC.item = arrData[indexPath.row]
        }
    }

}

extension ListVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        let viewModel = arrData[indexPath.row]
        cell.lblName.text = viewModel.name
        cell.lblArtistName.text = viewModel.artistName
        cell.imgView.imageFromURL(urlString: viewModel.artworkUrl100!)
        return cell
    }
    
}
