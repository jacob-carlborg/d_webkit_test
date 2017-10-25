module web_kit.web_view;

import appkit.view;

import foundation.geometry;
import foundation.ns_object;
import foundation.url_request;
import foundation.util;

import web_kit.web_view_configuration;

extern (Objective-C):

interface WKWebView : NSView
{
    mixin ClassTrait;

    WKWebView init() @selector("init");

    WKWebView initWithFrame(
        NSRect frame,
        WKWebViewConfiguration configuration
    ) @selector("initWithFrame:configuration:");

    NSObject load(NSURLRequest request) @selector("loadRequest:");
}
