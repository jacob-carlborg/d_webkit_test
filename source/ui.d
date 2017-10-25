module ui;

import appkit.application;

import app_delegate;
import setup;
import view_controller;

extern (C) void openUi()
{
    setupSubclasses();

    auto delegate_ = AppDelegate.alloc.init;
    assert(delegate_, "AppDelegate null");

    NSApp.delegate_ = delegate_;

    NSApp.setActivationPolicy(NSApplicationActivationPolicy.regular);
    NSApp.run();
}
