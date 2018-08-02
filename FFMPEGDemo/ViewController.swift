//
//  ViewController.swift
//  FFMPEGDemo
//
//  Created by kila on 2018/8/1.
//  Copyright © 2018年 Kila. All rights reserved.
//

import UIKit
import VideoToolbox
import FFmpeg

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        av_register_all();
        avcodec_register_all();
        avformat_network_init();
        var avFormatContext = avformat_alloc_context();
        
        let url = "rtmp://live.hkstv.hk.lxdns.com/live/hks";
        if (avformat_open_input(&avFormatContext, (url as NSString).utf8String, nil, nil) != 0) {
            av_vlog(nil, AV_LOG_ERROR, "Couldn't open file", withVaList([], { return $0}));
        }
        
        if (avformat_find_stream_info(avFormatContext, nil) < 0) {
            av_vlog(nil, AV_LOG_ERROR, "Couldn't find stream information", withVaList([], { return $0}));
        } else {
            av_dump_format(avFormatContext, 0, (url as NSString).utf8String, 0);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

