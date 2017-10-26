module app_delegate;

import core.stdc.stdio : printf;

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

import objc.objc;

import web_kit.web_view;
import web_kit.web_view_configuration;

import util;
import view_controller;
import menu;

extern (Objective-C) interface AppDelegate : NSApplicationDelegate
{
    mixin ClassTrait;

    AppDelegate init() @selector("init");

    extern (D) final
    {
        NSWindow window()
        {
            return this.ivar!("window", NSWindow);
        }

        void window (NSWindow window)
        {
            this.ivar!("window", NSWindow) = window;
        }

        ViewController controller()
        {
            return this.ivar!("controller", ViewController);
        }

        void controller (ViewController controller)
        {
            this.ivar!("controller", ViewController) = controller;
        }
    }

    extern (C):

    static bool applicationShouldTerminateAfterLastWindowClosed(AppDelegate self, SEL sel, NSNotification notification)
    {
        return false;
    }

    static void applicationDidFinishLaunching(AppDelegate self, SEL sel, NSNotification notification)
    {
        printf("applicationDidFinishLaunching\n");

        NSApp.menu = mainMenu();

        immutable style = NSWindowStyleMask.resizable |
            NSWindowStyleMask.closable |
            NSWindowStyleMask.titled;

        auto window = NSWindow.alloc.initWithContentRect(
            NSMakeRect(10, 10, 300, 300),
            style,
            NSBackingStoreType.buffered,
            false
        );

        window.title = "App";

        auto controller = ViewController.alloc.init;
        window.contentView = controller.view;

        window.center();

        self.window = window;
        self.controller = controller;

        window.makeKeyAndOrderFront(null);
        NSApp.activateIgnoringOtherApps(true);
    }
}
