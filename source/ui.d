module ui;

import dummy_symbols;

import appkit.application;

import app_delegate;
import setup;
import view_controller;

extern (C) void openUi()
{
    NSApp = NSApplication.shared_;
    setupSubclasses();

    auto delegate_ = AppDelegate.alloc.init;
    assert(delegate_, "AppDelegate null");

    NSApp.delegate_ = delegate_;

    NSApp.setActivationPolicy(NSApplicationActivationPolicy.regular);
    import core.stdc.stdio : printf; printf("openUi\n");
    NSApp.run();
}
