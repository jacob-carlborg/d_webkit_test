module appkit.window;

import appkit.graphics;
import appkit.view;

import foundation.geometry;
import foundation.string;
import foundation.util;

import objc.objc : id;

extern (Objective-C):

enum NSWindowStyleMask : size_t
{
    borderless = 0,
    titled = 1 << 0,
    closable = 1 << 1,
    miniaturizable = 1 << 2,
    resizable	= 1 << 3,

    /* Specifies a window with textured background. Textured windows generally don't draw a top border line under the titlebar/toolbar. To get that line, use the NSUnifiedTitleAndToolbarWindowMask mask.
     */
    texturedBackground = 1 << 8,

    /* Specifies a window whose titlebar and toolbar have a unified look - that is, a continuous background. Under the titlebar and toolbar a horizontal separator line will appear.
     */
    unifiedTitleAndToolbar = 1 << 12,

    /* When set, the window will appear full screen. This mask is automatically toggled when toggleFullScreen: is called.
     */
    fullScreen = 1 << 14,

    /* If set, the contentView will consume the full size of the window; it can be combined with other window style masks, but is only respected for windows with a titlebar.
     Utilizing this mask opts-in to layer-backing. Utilize the contentLayoutRect or auto-layout contentLayoutGuide to layout views underneath the titlebar/toolbar area.
     */
    fullSizeContentView = 1 << 15,

    /* The following are only applicable for NSPanel (or a subclass thereof)
     */
    utilityWindow			= 1 << 4,
    docModalWindow         = 1 << 6,
    nonactivatingPanel		= 1 << 7, // Specifies that a panel that does not activate the owning application
    hUDWindow = 1 << 13 // Specifies a heads up display panel
};

interface NSWindow
{
    mixin ClassTrait;

    NSWindow init() @selector("init");

    NSWindow initWithContentRect(
        NSRect contentRect,
        NSWindowStyleMask style,
        NSBackingStoreType bufferingType,
        bool flag
    ) @selector("initWithContentRect:styleMask:backing:defer:");

    void makeKeyAndOrderFront(id sender) @selector("makeKeyAndOrderFront:");
    NSView contentView() @selector("contentView");
    void orderFrontRegardless() @selector("orderFrontRegardless");
    void center() @selector("center");
    void contentView(NSView view) @selector("setContentView:");

    NSString title() @selector("title");
    void title(NSString value) @selector("setTitle:");

    extern (D) final
    {
        void title(string value)
        {
            this.title = value.toNSString;
        }
    }
}
