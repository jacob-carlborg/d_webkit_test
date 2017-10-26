module setup;

import core.stdc.math : log2;

import appkit.window;

import web_kit.web_view;

import objc.objc;

import app_delegate;
import view_controller;
import util;

void setupSubclasses()
{
    objc_method[2] methodsAppDelegate = [
        method!(AppDelegate.applicationDidFinishLaunching, "applicationDidFinishLaunching:"),
        method!(AppDelegate.applicationShouldTerminateAfterLastWindowClosed, "applicationShouldTerminateAfterLastWindowClosed:")
    ];

    objc_ivar[2] ivarsAppDelegate = [
        objc_ivar("window", "^v", cast(int) log2(NSWindow.sizeof), NSWindow.sizeof),
        objc_ivar("controller", "^v", cast(int) log2(ViewController.sizeof), ViewController.sizeof)
    ];

    registerClass("AppDelegate", "NSObject", methodsAppDelegate, ivarsAppDelegate);

    objc_method[2] methodsViewController = [
        method!(ViewController.loadView, "loadView"),
        method!(ViewController.viewDidLoad, "viewDidLoad")
    ];

    objc_ivar[1] ivarsViewController = [
        objc_ivar("webView", "^v", cast(int) log2(WKWebView.sizeof), WKWebView.sizeof)
    ];

    registerClass("ViewController", "NSViewController", methodsViewController, ivarsViewController);
}

void registerClass(const char* name, const char* superClassName, objc_method[] methods, objc_ivar[] ivars = [])
{
    auto superClass = objc_lookUpClass(superClassName);
    assert(superClass, "Failed to lookup superclass");

    auto cls = objc_allocateClassPair(superClass, name, 0);
    assert(cls, "Failed to allocate class pair");

    foreach (method ; methods)
    {
        auto result = cls.class_addMethod(
            method.method_name,
            method.method_imp,
            method.method_types
        );

        assert(result, "Failed to add method");
    }

    foreach (objc_ivar ivar ; ivars)
    {
        auto result = cls.class_addIvar(
            ivar.ivar_name,
            size_t(ivar.space),
            cast(byte) ivar.ivar_offset,
            ivar.ivar_type
        );

        assert(result, "Failed to add instance variable");
    }

    objc_registerClassPair(cls);
}

objc_method method(alias imp, const char* selector, const char* type = null)()
{
    return objc_method(sel_registerName(selector), type, cast(IMP) &imp);
}
