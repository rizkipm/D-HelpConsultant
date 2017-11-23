//
//  HomeVC.swift
//  D-HelpConsultant
//
//  Created by Rizki Syaputra on 11/23/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class HomeVC: UITableViewController {
     var arrayKatalogBerita = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadData() {
        Alamofire.request("http://localhost/DehelpServer/index.php/api/getFeedAllKonsulatasi").responseJSON { (response) in
            
            //check response
            if response.result.isSuccess {
                //kalau response success kita ambil json
                let json = JSON(response.result.value as Any)
                //get jsonarray dari json diatas
                self.arrayKatalogBerita = json["data"].arrayObject as! [[String : String]]
                //check di log
                // print(self.arrayberita)
                
                //check jumlah array
                if(self.arrayKatalogBerita.count > 0){
                    
                    //refresh tableview
                    self.tableView.reloadData()
                }
            }
            else{
                
                print("error server")
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayKatalogBerita.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellHome

        // Configure the cell...
        
        var idServerBuku = arrayKatalogBerita[indexPath.row]
        
        
        var id_post =  idServerBuku["id_post"]
        let judul_post = idServerBuku["judul_post"]
        let tgl_post = idServerBuku["tgl_post"]
        let nama_user = idServerBuku["nama_user"]
        
        
        //pindahkan ke label
        cell.feedJudul.text = judul_post
        cell.feedby.text = "By : " + nama_user!
        cell.feedtgl.text = "Tanggal : " + tgl_post!

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
