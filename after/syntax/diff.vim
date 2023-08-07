" xxx Put this in a separate plugin? (Then it can be used with other plugins. It could also specify a default color for context lines.)

" Note: doing
"   autocmd FileType diff syn match diffContext "^ .*"
" from colors/mono_eink.vim rather than defining diffContext in this file (to keep everything in one file) meant that diffContext wouldn't always be defined where "diff syntax highlighting" was applied, e.g. within a buffer where filetype=git. (vim90/syntax/git.vim contains "syn include @gitDiff syntax/diff.vim". Note: we don't want all of the output of "git show" to be highlighted as a diff file... otherwise diffContext will match the indented lines of the commit message. @gitDiff is only applied to the diff portation of git show output.)

syn match diffContext "^ .*"
