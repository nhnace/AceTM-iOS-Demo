//
//  ViewController.swift
//  SDKAppTest
//
//  Created by MoonJongRak on 2016. 11. 1..
//  Copyright © 2016년 MoonJongRak. All rights reserved.
//

import UIKit
import AceTM

class ViewController: UIViewController {

    @IBOutlet weak var mButtonPv: UIButton!
    @IBOutlet weak var mButtonPU: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        AceTM.viewDidLoad(responder: self)
    }


    func platform() -> String {
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return NSString(bytes: &sysinfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)! as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickPv(_ sender: UIButton) {
        AceTM.pv(responder: self)
    }

    @IBAction func onClickPu(_ sender: UIButton) {
        AceTM.login(responder: self, userId: "user_id1", userAge: 25, userGender: AceTM.GD_MAN, group1: 1, group2: 2, group3: 0, group4: 0, group5: 0)
    }

    @IBAction func onClickErr(_ sender: UIButton) {
        AceTM.pageErr(page:"errorPage")
    }

    @IBAction func onClickHref(_ sender: UIButton) {
        AceTM.href(href: "test.txt")
    }

    @IBAction func onClickTel(_ sender: UIButton) {
        AceTM.tel(phoneNumber: "010-4024-8383")
    }

    @IBAction func onClickClick(_ sender: UIButton) {
        AceTM.customerClick(clickName: "무언가 클릭")
    }

    @IBAction func onClickSns(_ sender: UIButton) {
        AceTM.sns(productNumber: "214234",sns: "소셜네트워크 이름")
    }

    @IBAction func onClickBC(_ sender: UIButton) {
        AceTM.bannerClick(promotionCode: 1, bannerCode: 2)
    }

    @IBAction func onClickBV(_ sender: UIButton) {
        AceTM.bannerView(promotionCode: 1, bannerCode: 3)
    }

    @IBAction func onClickJsErr(_ sender: UIButton) {
        AceTM.codeErr(errCode: 10, reason: "알 수 없는 에러")
    }

    @IBAction func onClickNow(_ sender: UIButton) {
        let product: AceProduct = AceProduct(name: "샤프란 130ml", code: "100000", price: 2000, quantity: 4)

        AceTM.buyNow(product: product)

    }

    @IBAction func onClickWish(_ sender: UIButton) {
        let product: AceProduct = AceProduct(name: "피죤 230ml", code: "100001", price: 3000, quantity: 2)
        product.addOption(option: AceOption(code: "20000", name: "하얀색", quantity: 2))
        product.addOption(option: AceOption(code: "20001", name: "검은색", quantity: 4))

        AceTM.wishList(product: product)
    }

    @IBAction func onClickCart(_ sender: UIButton) {
        let product1: AceProduct = AceProduct(name: "제품명", code: "제품코드", price: 3000, quantity: 2)
        product1.addOption(option: AceOption(code: "옵션코드", name: "옵션명", quantity: 2))
        product1.addOption(option: AceOption(code: "옵션코드", name: "옵션명", quantity: 4))

        AceTM.addCart(product: product1)
    }

    @IBAction func onClickBuy(_ sender: UIButton) {
        let product1: AceProduct = AceProduct(name: "피죤 230ml", code: "100001", price: 3000, quantity: 2)
        product1.addOption(option: AceOption(code: "20000", name: "하얀색", quantity: 2))
        product1.addOption(option: AceOption(code: "20001", name: "검은색", quantity: 4))

        AceTM.buyList(paymentMethod: "무통장",orderNumber: "1003020", totalPrice: 50000.0, product: product1)
    }


    @IBAction func onClickBuyDirect(_ sender: UIButton) {
        let product1: AceProduct = AceProduct(name: "피죤 230ml", code: "100001", price: 3000, quantity: 2)
        product1.addOption(option: AceOption(code: "20000", name: "하얀색", quantity: 2))
        product1.addOption(option: AceOption(code: "20001", name: "검은색", quantity: 4))

        AceTM.buyList(paymentMethod: "무통장",orderNumber: "1003020", totalPrice: 50000.0, product: product1)
    }

    @IBAction func onClickBuyCredit(_ sender: UIButton) {
        let product1: AceProduct = AceProduct(name: "피죤 230ml", code: "100001", price: 3000, quantity: 2)
        product1.addOption(option: AceOption(code: "20000", name: "하얀색", quantity: 2))
        product1.addOption(option: AceOption(code: "20001", name: "검은색", quantity: 4))

        AceTM.buyList(paymentMethod: "신용카드",orderNumber: "1003020", totalPrice: 50000.0, product: product1)
    }

    @IBAction func onClickBuyEtc(_ sender: UIButton) {
        let product1: AceProduct = AceProduct(name: "피죤 230ml", code: "100001", price: 3000, quantity: 2)
        product1.addOption(option: AceOption(code: "20000", name: "하얀색", quantity: 2))
        product1.addOption(option: AceOption(code: "20001", name: "검은색", quantity: 4))

        AceTM.buyList(paymentMethod: "기타",orderNumber: "1003020", totalPrice: 50000.0, product: product1)
    }

    @IBAction func onClickReview(_ sender: UIButton) {
        AceTM.review(productNumber: "상품번호", reviewContents: "상품평", score: 5)
    }

    @IBAction func onClickPay(_ sender: UIButton) {
        let product1: AceProduct = AceProduct(name: "피죤 230ml", code: "100001", price: 3000, quantity: 2)
        product1.addOption(option: AceOption(code: "20000", name: "하얀색", quantity: 2))
        product1.addOption(option: AceOption(code: "20001", name: "검은색", quantity: 4))
        AceTM.pay(payName: "카카오톡 페이", product: product1)
    }

    @IBAction func onClickLogin(_ sender: UIButton) {
        AceTM.login(responder: self, userId: "userId2", userAge: 25, userGender: AceTM.GD_MAN, group1:2)
    }

    @IBAction func onClickJoin(_ sender: UIButton) {
        AceTM.join(responder: self, userId: "유저 아이디", userValue: 1000)
    }

    @IBAction func onClickDeactivate(_ sender: UIButton) {
        AceTM.deactivate(responder: self, userId: "유저 아이디")
    }

    @IBAction func onClickDetailView(_ sender: UIButton) {
        AceTM.detailView(responder: self, productNumber: "상품번호", productName: "상품이름", productPrice: 10000, productCategory: "상품카테고리", productImageUrl: "상품 이미지 URL")
    }

    @IBAction func onClickInnerSearch(_ sender: UIButton) {
        AceTM.innerSearch(responder: self, keyword: "사프란")
    }

}

