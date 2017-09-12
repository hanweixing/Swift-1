# WangSwift
基于Swift4、XCode9

### Swift项目规划：
* 纯代码 VS 故事板 -.- Code VS StoryBoard
    * 优势：高度自定义，二期开发容易
    * 劣势：开发速度慢，二期开发复杂
* 更多功能逐渐添加
    * swift4基础语法示例代码
    * 自定义视图
    * swift动画

### Swift文件介绍:
|文件名|作用|
|---|---|
|[AppDelegate](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/AppDelegate.swift)|纯代码创建window视图|
|[ViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/ViewController.swift)|纯代码tableview、根视图列表|
|[WangUIViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangUIViewController.swift)|基本UI控件集合|
|[WangNetViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangNetViewController.swift)|网络请求代码|
|[WangAlamofireAndSwiftyJSONViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangAlamofireAndSwiftyJSONViewController.swift)|Alamofire + SwiftyJSON库使用|

### Swift开源模板：
* 第三方库使用
    * 网络解析：[Alamofire](https://github.com/Alamofire/Alamofire)
    ```Swift
    ```
    * JSON解析：[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
    ```Swift
    ```
    * 约束布局：[SnapKit](https://github.com/SnapKit/SnapKit)(暂未支持swift4)
    * 图片加载：[KingFisher](https://github.com/onevcat/Kingfisher)(暂未支持swift4)
    * 桥接引入：OC库稍后加入

### Swift代码模板：
* UI组件
    * UIWindow
    ```Swift
    self.window = UIWindow.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    let wangViewController = ViewController()
    wangViewController.title = "swift项目纯代码示例"
    let wangNavigationViewController = UINavigationController.init(rootViewController: wangViewController)
    wangNavigationViewController.tabBarItem.title = "王家伟"
    wangNavigationViewController.tabBarItem.image = UIImage(named: "test")
    let wangTabBarViewController = UITabBarController.init()
    wangTabBarViewController.setViewControllers([wangNavigationViewController], animated: true)
    self.window?.rootViewController = wangTabBarViewController
    self.window?.makeKeyAndVisible()
    ```
    * UITabBarController
    ```Swift
    let wangTabBarViewController = UITabBarController.init()
    wangTabBarViewController.setViewControllers([wangNavigationViewController], animated: true)
    ```
    * UINavigationController
    ```Swift
    let wangNavigationViewController = UINavigationController.init(rootViewController: wangViewController)
    wangNavigationViewController.tabBarItem.title = "王家伟"
    wangNavigationViewController.tabBarItem.image = UIImage(named: "test")
    ```
    * UIViewController
    ```Swift
    let wangViewController = ViewController()
    wangViewController.title = "swift项目纯代码示例"
    ```
    * UIView
    ```Swift
    let view = UIView()
    ```
    * UIImageView
    ```Swift
    func make_imageview() {
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 50, width: 100, height: 100))
        imageView.image = UIImage(named: "test")
        self.myScroll.addSubview(imageView)
    }
    ```
    * UIButton
    ```Swift
    // MARK: - 按钮
    func make_button() {
        let btn = UIButton(frame: CGRect(x: 0, y: 150, width: 100, height: 50))
        btn.backgroundColor = .yellow
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("按钮", for: .normal)
        btn.setTitle("点击", for: .highlighted)
        btn.addTarget(self, action: #selector(btnTap(_:)), for: .touchUpInside)
        self.myScroll.addSubview(btn)
    }
    
    //@objc
    @objc func btnTap(_ mybtn: UIButton) {
        print(mybtn.titleLabel?.text ?? "无值")
        print("点击了按钮")
        make_alert()
    }
    ```
    * UILabel
    ```Swift
    func make_label() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        label.text = "这年头傻逼真多"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        self.myScroll.addSubview(label)
    }
    ```
    * UITextField
    ```Swift
    // MARK: - 输入框
    func make_textfield() {
        let textField = UITextField(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: 50))
        textField.placeholder = "请输入一些内容"
        self.myScroll.addSubview(textField)
    }
    ```
    * UITextView
    ```Swift
    func make_textView() {
        let textView = UITextView(frame: CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 50))
        textView.text = "sakhfjkhadsjfhjasdhfjhadsjklfhuhc vkjhuahdsfuhakdshfluasdhfjklhasdjklfhjalskdfhsakdljfhalskdjhfusadhfkhasdjkfhjkalsdhflkajsdhfjklasdhfljaksdhflkjasdhfajksdhffuiwhqeiucbqwuiebvquywegrwbcuqwe"
        self.myScroll.addSubview(textView)
    }
    ```
    * UIScrollView
    ```Swift
    func make_scrollview() {
        myScroll = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        myScroll.contentSize = CGSize(width: self.view.frame.size.width, height: 1000.0)
        myScroll.backgroundColor = .groupTableViewBackground
        self.view.addSubview(myScroll)
    }
    ```
    * UITableView
    ```Swift
    self.baseTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 40), style: .plain)
    self.baseTableView.delegate = self
    self.baseTableView.dataSource = self
    self.baseTableView.register(UITableViewCell.self, forCellReuseIdentifier: myTableViewReuseIdentifer)
    self.baseTableView.separatorStyle = .singleLine
    self.baseTableView.tableFooterView = UIView()
    self.view.addSubview(self.baseTableView)
    ```
    * UITableViewCell
    ```Swift
    var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: myTableViewReuseIdentifer, for: indexPath)
    if cell == nil {
        cell = UITableViewCell(style: .default, reuseIdentifier: myTableViewReuseIdentifer)
    }
    cell?.textLabel?.text = itemList[indexPath.row]
    ```
    * UIAlertController
    ```Swift
    // MARK: - 弹出框
    func make_alert() {
        let alert = UIAlertController(title: "提示", message: "提示框界面", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "确定", style: .default, handler: { (_: UIAlertAction) in
            print("点击确定按钮")
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (_: UIAlertAction) in
            print("点击取消按钮")
        }))
        self.present(alert, animated: true) {
            
        }
    }
    
    // MARK: - 弹出选择框
    func make_actionSheet() {
        let actionSheet = UIAlertController(title: "标题", message: "显示的信息", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "底部默认", style: .default, handler: { (_: UIAlertAction) in
            print("sheet底部弹窗")
        }))
        actionSheet.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (_: UIAlertAction) in
            print("取消")
        }))
        self.present(actionSheet, animated: true) {
            
        }
    }
    ```
* 网络请求
    * GET
    ```Swift
    // MARK: - 基础网络请求:GET,post
    func get_network() {
        let urlString = "https://way.jd.com/jisuapi/get?channel=头条&num=1&start=0&appkey=\(newsKey)"
        let toUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let Url = URL.init(string: toUrl!)
        let request = NSMutableURLRequest.init(url: Url!)
        let mysession = URLSession.shared
        let dataTask = mysession.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if error != nil {
                return
            } else {
                let json: Any = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                print(json)
                self.storeResponse?.append("\n")
                self.storeResponse?.append("\(json)")
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.textView.text = self.storeResponse
                    }
                }
            }
        }
        dataTask.resume()
    }
    ```
    * POST
    ```Swift
    //基于上面代码增加：
    request.httpMethod = "POST"//GET
    // 数据体
    var jsonData:NSData? =nil
    do {
        jsonData  = tryNSJSONSerialization.dataWithJSONObject(params, options:NSJSONWritingOptions.PrettyPrinted)
    } catch {
    }
    // 将字符串转换成数据
    request.HTTPBody = jsonData
    ```
    * 其它...
