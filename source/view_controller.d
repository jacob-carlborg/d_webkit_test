module view_controller;

import std.stdio : println = writeln;

import appkit.application;
import appkit.color;
import appkit.graphics;
import appkit.view;
import appkit.view_controller;
import appkit.window;

import foundation.geometry;
import foundation.notification;
import foundation.string;
import foundation.util;
import foundation.url;
import foundation.url_request;

import web_kit.web_view;
import web_kit.web_view_configuration;

import objc.objc : SEL;

import util;

extern (Objective-C) interface ViewController : NSViewController
{
    mixin ClassTrait;

    ViewController init() @selector("init");

    extern (D) final
    {
        WKWebView webView()
        {
            return this.ivar!("webView", WKWebView);
        }

        void webView (WKWebView view)
        {
            this.ivar!("webView", WKWebView) = view;
        }
    }

    extern (C):

    static void loadView(ViewController self, SEL sel)
    {
        println("loadView");

        auto frame = NSMakeRect(0, 0, 0, 0);

        auto configuration = WKWebViewConfiguration.alloc.init;
        assert(configuration, "WKWebViewConfiguration null");

        auto webView = WKWebView.alloc.initWithFrame(frame, configuration);
        assert(webView, "WKWebView null");

        webView.uiDelegate = self;
        webView.wantsLayer = true;

        self.view = webView;
        self.webView = webView;
    }

    static void viewDidLoad(ViewController self, SEL sel)
    {
        println("viewDidLoad");

        assert(self.view, "ViewController.view null");
        assert(self.webView, "ViewController.webView null");

        auto url = NSURL.urlWithString("https://www.google.se");
        auto request = NSURLRequest.alloc.url(url);
        self.webView.load(request);
    }
}
