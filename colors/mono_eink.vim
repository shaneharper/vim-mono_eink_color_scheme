" Vim Mono E Ink Color Scheme
" by: shane@shaneharper.net
"
" This requires at least vim v8.1-1543 (support for "const").

set background=light | hi clear  " Reset all highlighting to the defaults (for a light background).
if exists("syntax_on") | syntax reset | endif
let colors_name = "mono_eink"


function s:set_colors_and_attributes(highlight_group, fg, bg, attributes="none")
    exec "highlight" a:highlight_group
            \ "cterm=".a:attributes
            \ "ctermfg=".s:cterm_color(a:fg)
            \ "ctermbg=".s:cterm_color(a:bg)
            \ "gui=".a:attributes
            \ "guifg=".s:gui_color(a:fg)
            \ "guibg=".s:gui_color(a:bg)
endfunction

function s:cterm_color(c)  " 'b' for black, 1-24 for shades of grey (1 is the darkest), 'w'for white. Other color names passed to this function are returned as is.
    const black = 16  " Color 16 should always be pure black (#000000). 0 (or "Black") may not be pure black; It could be displayed as "bright black" (i.e. "DarkGray") for text using the "intense text style" - some terminal's display "bold" or "intense" text using different colors and/or using a bold font. Also, colors <16 may depend on a user configurable terminal color scheme.
    return a:c == 'b' ? black : a:c == 'w' ? 231 : a:c =~# '^[12]\?\d$' ? a:c+231 : a:c
endfunction

function s:gui_color(c)  " c is the same as for s:cterm_color(). Note: this function does not handle 256 color terminal colors specified by a number.
    if a:c == "b" | return "#000000" | endif
    if a:c == "w" | return "#FFFFFF" | endif
    if a:c =~# '^\d'
        return "#".repeat(printf("%02x", float2nr(a:c * 10.2)), 3)  " grey
    endif
    return a:c
endfunction


let defs =<< trim END
    Normal b w  # Set just in case the terminal doesn't by default use black text on a white background.

    # UI Elements (things other than buffer text)------------------------------ {{{
        LineNr 22 w italic
        NonText 22 w
        # Popup Menus --------------------------------------------------------- {{{
            Pmenu b 22
            PmenuSel w b bold
            PmenuSbar NONE 17
            PmenuThumb NONE b
        # }}}
        # Status Lines -------------------------------------------------------- {{{
            StatusLine w b bold  # (Black background stands out.)
            StatusLineNC w 11 bold  # (NC = not-current)  xxx It might be nice to use a black background for StatusLineNC; "blank areas" of a non-current window's status line could be filled with '-'s to distinguish those windows from the current window. See :help status-line? '^', '='? Really need to look at :help statusline (no '-' in 'statusline'). (Using "StatusLineNC -> StatusLine" will cause Vim to automatically add a line of '^'s to the status line of the current window - Not ideal as the string of '^'s make the current window's status line appear overall lighter than the status line/s of non-current window/s.)
            StatusLineTerm -> StatusLine
            StatusLineTermNC -> StatusLineNC
            VertSplit -> StatusLine
        # }}}
    # }}}

    # No distracting, unhelpful syntax highlighting.
    #  xxx Remove "unwanted" syntax rules. Completing this has a low priority as what's currently implemented (linking the highlight groups associated with the "unwanted" syntax rules to the Normal group) usually works quite well. (See https://github.com/shaneharper/dotfiles/blob/c05e59b5fe77aa2571ef78e785b36d21c9ef94f6/vim/colors/sgh.vim#L33.)
    Identifier -> Normal
    Number -> Normal
    PreProc -> Normal
    Statement -> Normal
    Type -> Normal

    Comment 14 w
    Constant -> Normal
    Directory b 24
    Error lightred 11
    Folded w 14 italic,bold
    helpHyperTextJump b w underline
    helpHyperTextEntry b w italic
    # xxx MatchParen
    netrwSymlink b w
    Search w 15 bold
    Special DarkMagenta w
    String 14 w bold  # Strings seem to be defined to include the character/s that mark the start and end of a string; xxx I'd prefer if those characters could be highlighted different to the rest of the string (and I'd prefer that no styling be applied to them).
    Title b w bold
    vimCommentString -> vimComment  # (By default vimCommentString was linked to vimString.)
    Visual NONE 20
    # xxx WarningMsg b w bold

    # diff mode --------------------------------------------------------------- {{{
        # Executing ":syntax off" can make it easier to view diffs in Vim's diff mode. After ":syntax off" highlighting will be "mostly" limited to showing what has changed; DiffAdd, DiffChange, etc. will be applied but many highlighting groups (all those that are filetype specific -?) won't be. (It seems that the highlight groups listed in the "highlight-default" section of Vim's help will still be used after :syntax off - those groups include Visual, IncSearch, LineNr, etc.)  xxx It'd be nice if ":syntax off" was automatically executed when diff mode is in use; Restoring all syntax highlighting with ":syntax on" would also be nice when diff mode is no longer in use, or if the user stops using this color scheme. (The DiffUpdated and BufWinLeave autocommands could be used.)
        # ":hi Normal ctermfg=250" (":syntax off | hi Normal ctermfg=250") will make changes easier to see as unchanged text will be lighter. (Unfortunately command line text will also appear lighter.)
        DiffAdd b 24  # an added line. xxx Make this identical to DiffText?
        DiffText b 21
        DiffChange b 24  # common (unmodified) text on a line that has a change. (DiffText marks the text on that line that was changed.) This shouldn't be the same as Normal - we want to be aware of all lines that were modified (and when the wrap option isn't set the modified part of a line might not be immediately visible).
        DiffDelete b 23  # Used where a line in the other buffer doesn't exist in the current buffer. (Such lines are filled with '-'s.)
    # }}}

    # filetype=diff ----------------------------------------------------------- {{{
        # Note that Vim's diff mode uses different highlight groups to those set here for filetype=diff. (Vim's diff mode uses DiffAdd DiffChange, etc.).
        diffFile b 18 italic
        diffNewFile b w
        diffOldFile b w
        diffAdded b w
        diffRemoved b 24 strikethrough
        diffLine b w italic
        diffSubName 14 w italic
        diffContext 19 w
        diffLine b w
        diffIndexLine b w
        diffNoEOL b w
        diffChanged b w  # Line beginning with a '!' as output by 'diff -c'; note the line could be either a line in "file A" or "file B". (xxx minor: highlight changed lines differently according to whether they are from "file A" or "file B" - and highlight the diffNewFile and diffOldFile lines at the top of the file accordingly.)
    # }}}

    # Spelling ---------------------------------------------------------------- {{{
        # We don't use undercurl; it's not always available. Windows Terminal doesn't support undercurl - see https://github.com/microsoft/terminal/issues/7228. The GUI version of Vim will always support undercurl (?); undercurl isn't used just for the GUI version so as to keep the appearance of the GUI and terminal versions consistent.
        SpellBad w 17
        SpellCap w 17   # It'd be nice if SpellCap was displayed with a bold first letter (SpellCap is a word that should start with a capital letter). Use a "contained" highlight group for the first letter (similar to how "TODO" is handled in comments) - see https://vi.stackexchange.com/a/19043 and :help syn-contained.
        SpellLocal w 17
        SpellRare w 17 italic
    # }}}

    # Version control plugins ------------------------------------------------- {{{
        hgcommitOverflow b w underline
        gitIdentity b w
        gitDate b w
        gitEmail b w
        gitEmailDelimiter b w
    # }}}
END
let defs = map(defs, 'substitute(v:val, " *#.*", "", "")')  | " strip comments
for l in filter(defs, 'v:val != ""')
    let e = split(l)
    if e[1] == '->'  | " link definition.
        exec "highlight clear" e[0]  | " It's not really required to first clear any attributes? (The link will take priority anyway?)
        exec "highlight! link" e[0] e[2]
    else
        if len(e) == 3
            call s:set_colors_and_attributes(e[0], e[1], e[2])
        elseif len(e) == 4
            call s:set_colors_and_attributes(e[0], e[1], e[2], e[3])
        else
            echomsg "*** mono_eink: Invalid highlight attributes. ***"
        endif
    endif
endfor

" xxx Use a different font for strings (GUI only) See :help highlight-font. (I couldn't get this to work. Others have also failed to get it to work; See https://vi.stackexchange.com/questions/18660/gvim-use-different-fonts-using-highlight, and https://github.com/vim/vim/issues/10684.)


" Text styles for 1-bit color terminals --------------------------------------- {{{
" (Identifier, Number, PreProc, Statement and Type are already linked to Normal.)
hi Comment term=italic
hi LineNr term=italic
hi StatusLine term=reverse
hi String term=bold
" }}}


" vim:set foldmethod=marker:
