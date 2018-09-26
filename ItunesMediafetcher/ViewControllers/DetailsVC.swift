//
//  DetailsVC.swift
//  ItunesMediafetcher
//
//  Created by PC on 26/09/18.
//  Copyright © 2018 PC. All rights reserved.
//

import UIKit

class DetailsVC: UITableViewController {
    
    //IBOutlets
    @IBOutlet weak var imgView: UIImageView!
    
    //VARIABLES
    var item : ResultViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
    }
    
    func setData(){
        imgView.imageFromURL(urlString: item.artworkUrl100!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //BUTTON CLICKS
    @IBAction func btnItemURLClicked(_ sender: Any) {
    
    }
    
    @IBAction func btnArtistURLClicked(_ sender: Any) {
    
    }
    
}

extension DetailsVC {
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell", for: indexPath) as! DetailsCell
        switch indexPath.row {
        case 0:
            cell.lblTitle.text = item.name
            cell.lblDetails.text = item.artistName
        case 1:
            cell.lblTitle.text = "Kind"
            cell.lblDetails.text = item.kind
        case 2:
            cell.lblTitle.text = "Released On"
            cell.lblDetails.text = item.releaseDate
        case 3:
            cell.lblTitle.text = "Item URL"
            cell.lblDetails.text = item.url
        case 4:
            cell.lblTitle.text = "Artist URL"
            cell.lblDetails.text = item.artistUrl
        case 5:
            cell.lblTitle.text = "Copyright"
            cell.lblDetails.text = item.copyright
        default:
            break;
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 3:
            let url = item.url!
            UIApplication.shared.open(URL(string: url)!, options: [:]) { (success) in }
        case 4:
            let url = item.artistUrl!
            UIApplication.shared.open(URL(string: url)!, options: [:]) { (success) in }
        default:
            break;
        }
    }
    
}
