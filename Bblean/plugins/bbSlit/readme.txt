
    -------------------------------------------------------------------

    bbSlit is a plugin for Blackbox for Windows.

    Copyright 2006-2009 grischka
    http://bb4win.sourceforge.net/bblean

    conceptionally based on BBSlit v0.01.07
    by Brian "Tres`ni" Hartvigsen

    bbSlit is free software, released under the GNU General
    Public License (GPL version 2). For details see:

        http://www.fsf.org/licenses/gpl.html


    THIS PROGRAM IS DISTRIBUTED IN THE HOPE THAT IT WILL BE USEFUL,
    BUT WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED WARRANTY OF
    MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.

    -------------------------------------------------------------------

    bbSlit is a container for other plugins. It's purpose is
    to keep these together in a common place.


    HowTo load a plugin into bbSlit: 
    --------------------------------
    - Load bbSlit.
    - Load the plugin.
    - Check the plugin in bbLean's "Configuration -> Plugins -> In Slit"
      menu.
    - Tell the plugin to "use" or "be docked to" the slit from its own
      configuration menu.

    Note that bbSlit is invisible as long as it is empty.


    Mouse Clicks:
    -------------
    Ctrl-Right-Click:       Configuration Menu
    Left-Double-Click:      Toggle AutoHide

    Ctrl-Left-Drag:         Drag Slit elsewhere


    Order modes:
    ------------
    bbSlit has 'Standard' and 'As Fit' order modes.

    With 'As Fit' mode there is an additional option 'Base Width',
    that lets go plugins side by side, provided that its choosen
    large enough.

    -------------------------------------------------------------------

    History:

    [20-May-2009] v1.17
    - released with bbLean 1.17

    [24-Oct-2006] v1.16.1
    - Recognizes the slit style items for both old and new style syntax.
    - Two order modes: Standard and 'As Fit'.
