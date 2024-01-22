Vim Mono E Ink Color Scheme
===========================

This is a light color scheme created for use on a monochrome E Ink monitor.

Many highlight groups are not colored especially. Numbers, preprocessor directives, etc. can immediately be identified anyway without being colored especially. In any case when using a monochrome display there are limited options to uniquely "color" text.

Diffs are handled well by this color scheme.

Some might enjoy using this color scheme on a color display. There is sparing use of color.

<!-- xxx Include screen shot/s. -->


## Set up

Bold text and shades of grey are used by some highlight groups set by this color scheme; it may be necessary to configure your terminal/display so that these are displayed correctly.

### Enabling the display of bold text in Windows Terminal

By default Windows Terminal will use the regular (not bold) font for text that should appear bold in Vim; fix by setting `"Intense Text Style"` to `"Bold font with bright colors"`, or to `"Bold"`. <!-- Note: `"Bright colors"` is used by default for `"Intense Text Style"` (Windows Terminal v1.17.11461.0). --> (`Intense Text Style` can be set from `Settings` &#9659; `Profiles/Defaults` &#9659; `Additional Settings/Appearance` &#9659; `Text Formatting/Intense Text Style`.)

### [Onyx Boox Mira](https://onyxboox.com/boox_mira) settings for displaying shades of grey

| Option                 | Value |
|------------------------|-------|
| Display Mode           | Normal (&#9635;<!-- Unicode character 9635 is "white square containing a small black square". xxx The symbol isn't quite right; the icon for the Normal display mode has rounded corners but Unicode character 9635 does not have rounded corners. Use an image (an SVG?) instead. -->)<br>Do not use *Text* mode; light greys appear white and dark greys are displayed as black. |
| Dark Color Enhancement | 3   <!-- xxx Include an image (an SVG?) of the Dark Color Enhancement icon? --> |
| Light Color Filter     | 1 |

<!-- XXX Provide a command to set these settings. Use https://github.com/elithper/miractl? -->

## Tips

* **Use Vim to view diffs.**<br>
  - Vim's `runtime/macros/less.sh` script can be used as a pager; this color scheme can be applied to the output of programs that generate diffs by using that script. (Often command line utilities displaying changes to a file under revision control color lines red or green depending on whether a line is only in the "old" version of a file or only in the "new" version; that coloring doesn't help when viewing on a monochrome display where both red and green might appear the same shade of grey.)<br>
  - [Here is a bash function](https://github.com/shaneharper/dotfiles/blob/f6c25a9914db9c184dc50cbea52762dd98876ade/bashrc#L34) that can be used to view the output of `git diff`. (Note: the function definition uses `vimless` - [this](https://github.com/shaneharper/dotfiles/blob/60650d66d664c2faa01e41fbb284c52c003c3b79/install#L42) creates a symlink for `vimless`<!-- that points to `macros/less.sh` in Vim's runtime directory-->.)

* **Run `:syntax off` when using Vim's diff mode.**
  <br>In diff mode running `:syntax off` can aid with understanding changes made to a file. `:syntax off` does not disable Vim's diff mode highlighting of modified text; text highlighted by diff mode can clearly stand out when filetype-specific syntax highlighting (highlighting of comments, strings, etc.) is not present at the same time.

* **See https://github.com/shaneharper/mono_eink_monitor_setup#readme**.
