//
//  ViewController.swift
//  List3
//
//  Created by yuri on 2019/09/22.
//  Copyright © 2019 yuri. All rights reserved.
//
// func <関数>(<引数名>:<型>){
//  <文>
//  }

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
                    , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    @IBOutlet weak var myTable: UITableView!
    var img: UIImage!
    /*表示するセルの数を指定する*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
 
    /*表示するセルの内容を指定する*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContents = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as! CustomCell
        cellContents.cellControllView(number: indexPath)
        cellContents.imageData = img
        return cellContents
    }

//        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cellContents = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as! CustomCell
//    //        cellContents.cellControllView(number: indexPath)
//            let data = array[array.count - indexPath.row - 1]
//            cellContents.imageView?.text = "\(data)
//            return cellContents
//        }
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*カスタムセルを読み込んで再利用セルという名前で使う*/
        myTable.register (UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "reuseCell")
        
    }


    
}

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var picker: UIImagePickerController!
    var button: UIButton!
    
    var img:UIImage!
    
    @IBAction func enterButton(_ sender: Any) {
        let CcellimageData = self.storyboard?.instantiateViewController(withIdentifier: "timeline") as! ViewController
        
        CcellimageData.img = img
        self.present(CcellimageData, animated: true, completion: nil)
        }
    
        override func viewDidLoad() {
//            view.backgroundColor = .white
            
            
            picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerController.SourceType.photoLibrary
            picker.allowsEditing = true //画像を選択後サイズの調整をする
            
//            picker.view.backgroundColor = .white
//            picker.navigationBar.isTranslucent = false
//            picker.navigationBar.barTintColor = .blue
//            picker.navigationBar.tintColor = .white
//            picker.navigationBar.titleTextAttributes = [
//                NSAttributedString.Key.foregroundColor: UIColor.white
//            ] // タイトルの色
            

            
            button = UIButton()
            button.addTarget(self, action: #selector(touchUpInside(_:)), for: UIControl.Event.touchUpInside)
//
//            let wsize = 375/2
//            let hsize = 350/2
            
            let centerX = view.center.x //画面の中心座標xを取得
            let width: CGFloat = 375/2
            let height: CGFloat = 350/2
            button.backgroundColor = .gray
                        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            button.frame = CGRect(x: centerX-width/2, y: 100, width: width, height: height)
            view.addSubview(button)
            
            button.setTitle("画像を選ぶ", for: UIControl.State.normal)


//            button.center.x = view.center.x
//            button.center.y = view.center.y
            
            button.backgroundColor = .gray
            view.addSubview(button)
    }

    /*ボタン内で画面から指を離した時に...*/
    @objc func touchUpInside(_ sender: UIButton) {
        // picker を動かす
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            //ユーザが編集した写真を取得する
            button.setBackgroundImage(editedImage, for: .normal) //背景に画像をセット
            self.img = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            //選択した写真を取得する
            button.setBackgroundImage(originalImage, for: .normal) //背景に画像をセット
        }

        dismiss(animated: true, completion: nil)
    }

    // 写真選択をキャンセルしたら...
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // picker を閉じる
        dismiss(animated: true, completion: nil)
    }

    
}
