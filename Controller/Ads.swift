//
//  Ads.swift
//  Norris 25
//
//  Created by Joshua Van Niekerk on 10/05/2020.
//  Copyright © 2020 Josh-Dog101. All rights reserved.
//

import Foundation
import GoogleMobileAds

extension MainViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("Received Ad")
    }

    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
    }
    
    func loadBanner() {
        adBanner.adUnitID           = "ca-app-pub-4641419831043271/1940190341" //  ~ my app UnitID
        
        // "ca-app-pub-3940256099942544/2934735716" // test unitID
        adBanner.rootViewController = self
        adBanner.load(GADRequest())
        adBanner.delegate           = self
    }
}

extension ResultsViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("Received Ad")
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
    }
    
    func loadBanner() {
        adBanner.adUnitID           = "ca-app-pub-4641419831043271/1940190341" //  ~ my app UnitID
        
        // "ca-app-pub-3940256099942544/2934735716" // test unitID
        adBanner.rootViewController = self
        adBanner.load(GADRequest())
        adBanner.delegate           = self
    }
}
