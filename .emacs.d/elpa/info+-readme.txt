   Extensions to `info.el'.

 More description below.

 If you use Emacs 20, 21, or 22 then use library `info+20.el'
 instead of `info+.el'.

(@> "Index")

 Index
 -----

 If you have library `linkd.el', load `linkd.el' and turn on
 `linkd-mode' now.  It lets you easily navigate around the sections
 of this doc.  Linkd mode will highlight this Index, as well as the
 cross-references and section headings throughout this file.  You
 can get `linkd.el' here:
 http://dto.freeshell.org/notebook/Linkd.html.

 (@> "Things Defined Here")
 (@> "Documentation")
 (@> "Macros")
 (@> "Faces (Customizable)")
 (@> "User Options (Customizable)")
 (@> "Internal Variables")
 (@> "New Commands")
 (@> "Replacements for Existing Functions")
 (@> "Non-Interactive Functions")

(@* "Things Defined Here")

 Things Defined Here
 -------------------

 Commands defined here:

   `Info-breadcrumbs-in-mode-line-mode',
   `Info-follow-nearest-node-new-window', `Info-goto-node-web',
   `Info-history-clear', `info-manual', `Info-merge-subnodes',
   `Info-mouse-follow-nearest-node-new-window',
   `Info-save-current-node', `Info-set-breadcrumbs-depth',
   `Info-toggle-fontify-angle-bracketed',
   `Info-toggle-fontify-emphasis',
   `Info-toggle-fontify-quotations',
   `Info-toggle-fontify-single-quote',
   `Info-toggle-breadcrumbs-in-header', `Info-url-for-node',
   `Info-virtual-book'.

 Faces defined here:

   `info-command-ref-item', `info-constant-ref-item',
   `info-double-quoted-name', `info-emphasis', `info-file',
   `info-function-ref-item',`info-macro-ref-item', `info-menu',
   `info-node', `info-quoted-name', `info-reference-item',
   `info-single-quote', `info-special-form-ref-item',
   `info-string', `info-syntax-class-item',
   `info-user-option-ref-item', `info-variable-ref-item',
   `info-xref'.

 Options (user variables) defined here:

   `Info-breadcrumbs-in-header-flag',
   `Info-display-node-header-fn', `Info-emphasis-regexp',
   `Info-fit-frame-flag', `Info-fontify-angle-bracketed-flag',
   `Info-fontify-emphasis-flag', `Info-fontify-quotations-flag',
   `Info-fontify-reference-items-flag',
   `Info-fontify-single-quote-flag', `Info-saved-nodes',
   `Info-subtree-separator'.

 Macros defined here:

   `info-user-error'.

 Non-interactive functions defined here:

   `Info-display-node-default-header', `info-fontify-quotations',
   `info-fontify-reference-items',
   `Info-insert-breadcrumbs-in-mode-line', `Info-isearch-search-p',
   `Info-search-beg', `Info-search-end'.

 Internal variables defined here:

   `Info-breadcrumbs-depth-internal', `info-fontify-emphasis',
   `Info-merged-map', `Info-mode-syntax-table',
   `info-quotation-regexp', `info-quoted+<>-regexp'.


 ***** NOTE: The following standard faces defined in `info.el'
             have been REDEFINED HERE:

 `info-title-1', `info-title-2', `info-title-3', `info-title-4'.


 ***** NOTE: The following standard functions defined in `info.el'
             have been REDEFINED or ADVISED HERE:

 `info-display-manual' - Use completion to input manual name.
 `Info-find-emacs-command-nodes' - Added arg MSGP and message.
 `Info-find-file' - Handle virtual books.
 `Info-find-node', `Info-find-node-2' -
    Call `fit-frame' if `Info-fit-frame-flag'.
    Added optional arg NOMSG.
 `Info-fontify-node' -
    1. Show breadcrumbs in header line and/or mode line.
    2. File name in face `info-file'.
    3. Node names in face `info-node'.
    4. Menu items in face `info-menu'.
    5. Only 5th and 9th menu items have their `*' colored.
    6. Notes in face `info-xref'.
    7. If `Info-fontify-emphasis-flag', then fontify _..._.
    8. If `Info-fontify-quotations-flag', then fontify ‘...’ or
       `...' in face `info-quoted-name', “...” in face
       `info-double-quoted-name',  and "..." in face `info-string'.
    9. If `Info-fontify-angle-bracketed-flag' and
       `Info-fontify-quotations-flag' then fontify <...> in face
       `info-quoted-name'.
   10. If `Info-fontify-single-quote-flag' and
       `Info-fontify-quotations-flag', then fontify ' in face
       `info-single-quote'.
 `Info-goto-emacs-command-node' -
    1. Uses `completing-read' in interactive spec, with,
       as default, `symbol-nearest-point'.
    2. Added optional arg MSGP.
    3. Message if single node found.
    4. Returns `num-matches' if found; nil if not.
 `Info-goto-emacs-key-command-node' -
    1. Added optional arg MSGP.
    2. If key's command not found, then `Info-search's for key
       sequence in text and displays message about repeating.
 `Info-history' - A prefix arg clears the history.
 `Info-insert-dir' -
    Added optional arg NOMSG to inhibit showing progress msgs.
 `Info-mode' - Doc string shows all bindings.
 `Info-read-node-name'   - Added optional arg DEFAULT.
 `Info-search' - 1. Fits frame.
                 2. Highlights found regexp if `search-highlight'.
 `Info-set-mode-line' - Handles breadcrumbs in the mode line.
 `Info-mouse-follow-nearest-node' - With prefix arg, show node in
                                    a new Info buffer.
 `Info-isearch-search' - Respect restriction to active region.
 `Info-isearch-wrap' - Respect restriction to active region.

(@* "Documentation")

 Documentation
 -------------

 Library `info+.el' extends the standard Emacs library `info.el' in
 several ways.  It provides:

 * Additional, finer-grained highlighting.  This makes a big
   difference in readability.

   - Quoted names, like this: `name-stands-out' or
     `name-stands-out', and strings, like this: "string-stands-out"
     are highlighted if `Info-fontify-quotations-flag' is
     non-`nil'.

   - Angle-bracketed names, like this: <tab>, are highlighted if
     `Info-fontify-angle-bracketed-flag' and
     `Info-fontify-quotations-flag' are non-`nil'.

   - Isolated single quotes, like this: 'foobar, are highlighted if
     `Info-fontify-single-quote-flag' and
     `Info-fontify-quotations-flag' are non-`nil'.

   - Emphasized text, that is, text enclosed in underscore
     characters, like this: _this is emphasized text_ is
     highlighted if `Info-fontify-emphasis-flag' is non-`nil'.
     (But if internal variable `info-fontify-emphasis' is `nil'
     then there is no such highlighting, and that option has no
     effect.)

   - In the Emacs Lisp manual, reference items are highlighted, so
     they stand out.  This means: constants, commands, functions,
     macros, special forms, syntax classes, user options, and other
     variables.

   Be aware that such highlighting is not 100% foolproof.
   Especially for a manual such as Emacs or Elisp, where arbitrary
   keys and characters can be present anywhere, the highlighting
   can be thrown off.

   You can toggle each of the `Info-fontify-*-flag' options from
   the `Info' menu or using an `Info-toggle-fontify-*' command.
   For example, command `Info-toggle-fontify-emphasis' toggles
   option `Info-fontify-emphasis-flag'.

 * You can show breadcrumbs in the mode line or the header line, or
   both. See where you are in the Info hierarchy, and access higher
   nodes directly.

   - In the mode line.  Turned on by default.

     See ‘Toggle Breadcrumbs’ in the `mouse-3' mode-line menu and
     `Toggle Breadcrumbs in Mode Line' in the `Info' menu (in the
     menu-bar or in the minor-mode indicator). You can customize
     option `Info-breadcrumbs-in-mode-line-mode' if you want to
     turn this off by default. (Available for Emacs 23+ only.)

   - In the header (just below the header line).

     (I also added this to vanilla Emacs 23.)  This is OFF by
     default in `Info+'.  See `Toggle Breadcrumbs in Header Line'
     in `Info' menu.  Be aware that unlike breadcrumbs in the mode
     line, this can occasionally throw off the destination accuracy
     of cross references and searches slightly.

 * Some of the commands defined here:

   - `Info-virtual-book' (bound to `v') – Open a virtual Info
     manual of saved nodes from any number of manuals.  The nodes
     are those saved in option `Info-virtual-book'.  With `C-u',
     bookmarked Info nodes are also included.  (If you use Icicles,
     see also `icicle-Info-virtual-book'.)

   - `Info-save-current-node' (bound to `.') – Save the name of the
     current node to list `Info-saved-nodes', for use by `v'
     (`Info-virtual-book').

   - `Info-merge-subnodes' – Integrate the current Info node with
     its subnodes (the nodes in its Menu), perhaps recursively.

     Use `Info-merge-subnodes' to extract a self-contained report
     (possibly the whole manual) from an Info manual.  The report
     is itself an Info buffer, with hyperlinks and normal Info
     behavior.

     There are various prefix-argument possibilities that govern
     just how subnodes are treated (recursively or not, for
     instance).  There are a few user options that let you
     customize the report appearance.


 The following bindings are made here for Info-mode:

   `?'              `describe-mode' (replaces `Info-summary')
   `+'              `Info-merge-subnodes'
   `.'              `Info-save-current-node'
   `a'              `info-apropos'
   `G'              `Info-goto-node-web'
   `v'              `Info-virtual-book'
   `mouse-4'        `Info-history-back'
   `mouse-5'        `Info-history-forward'
   `S-down-mouse-2' `Info-mouse-follow-nearest-node-new-window'
   `S-RET'          `Info-follow-nearest-node-new-window'

 The following bindings are made here for merged Info buffers:

   `.'              `beginning-of-buffer'
   `b'              `beginning-of-buffer'
   `q'              `quit-window'
   `s'              `nonincremental-re-search-forward'
   `M-s'            `nonincremental-re-search-forward'
   `TAB'            `Info-next-reference'
   `ESC TAB'        `Info-prev-reference'

 The global binding `C-h r' is changed from `info-emacs-manual' to
 `info-manual', which behaves the same except if you use a prefix
 arg.  With a prefix arg you can open any manual, choosing either
 from all installed manuals or from those that are already shown in
 Info buffers.

 The following behavior defined in `info.el' has been changed:
  "*info" has been removed from `same-window-buffer-names', so that
  a separate window can be used if you so choose.

 Suggestion: Use a medium-dark background for Info.  Try, for
 example, setting the background to "LightSteelBlue" in your
 `~/.emacs' file.  You can do this as follows:

        (setq special-display-buffer-names
              (cons '("*info*" (background-color . "LightSteelBlue"))
                    special-display-buffer-names))

 Alternatively, you can change the background value of
 `special-display-frame-alist' and set `special-display-regexps' to
 something matching "*info*":

        (setq special-display-frame-alist
              (cons '(background-color . "LightSteelBlue")
                    special-display-frame-alist))
        (setq special-display-regexps '("[ ]?[*][^*]+[*]"))

 If you do use a medium-dark background for Info, consider
 customizing face to a lighter foreground color - I use "Yellow".

 Also, consider customizing face `link' to remove its underline
 attribute.

 This file should be loaded after loading the standard GNU file
 `info.el'.  So, in your `~/.emacs' file, do this:
 (eval-after-load "info" '(require 'info+))
