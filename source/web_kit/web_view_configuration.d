module web_kit.web_view_configuration;

import appkit.view;

import foundation.ns_object;
import foundation.util;

import web_kit.web_view_configuration;

extern (Objective-C):

interface WKWebViewConfiguration : NSObject
{
    mixin ClassTrait;

    WKWebViewConfiguration init() @selector("init");
}
