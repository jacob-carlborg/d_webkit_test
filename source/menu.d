module menu;

import std.algorithm;

import appkit.menu;
import appkit.menu_item;

import foundation.string;

NSMenu mainMenu()
{
    auto tree = [
        "Apple" : [
            NSMenuItem.alloc.init("Quit", "terminate:", "q")
        ]
    ];

    auto mainMenu = NSMenu.alloc.init("MainMenu".toNSString);

    foreach (title, items ; tree)
    {
        auto menu = NSMenu.alloc.init(title.toNSString);

        auto item = mainMenu.addItem(title.toNSString, null, "".toNSString);
        mainMenu.setSubmenu(menu, item);

        items.each!(item => menu.addItem(item));
    }

    return mainMenu;
}
