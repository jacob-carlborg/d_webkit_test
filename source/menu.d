module menu;

import appkit.menu;
import appkit.menu_item;

import foundation.string;

struct MenuTree
{
    string title;
    NSMenuItem[1] items;
}

NSMenu mainMenu()
{
    MenuTree[1] tree = [
        MenuTree("Apple", [NSMenuItem.alloc.init("Quit", "stop:", "q")])
    ];

    auto mainMenu = NSMenu.alloc.init("MainMenu".toNSString);

    foreach (e ; tree)
    {
        auto items = e.items;
        auto title = e.title;
        auto menu = NSMenu.alloc.init(title.toNSString);

        auto item = mainMenu.addItem(title.toNSString, null, "".toNSString);
        mainMenu.setSubmenu(menu, item);

        foreach (i ; items)
            menu.addItem(i);
    }

    return mainMenu;
}
