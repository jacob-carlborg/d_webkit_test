module main;

import std.stdio : println = writeln;

import appkit.application;

import app_delegate;
import setup;
import view_controller;

void main()
{
    setupSubclasses();

    auto delegate_ = AppDelegate.alloc.init;
    assert(delegate_, "AppDelegate null");

    NSApp.delegate_ = delegate_;

    NSApp.setActivationPolicy(NSApplicationActivationPolicy.regular);
    NSApplicationMain();
	println("Edit source/app.d to start your project.");
}
