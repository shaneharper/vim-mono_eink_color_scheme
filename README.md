Vim Mono E Ink Color Scheme
===========================

This is a light color scheme created for use on a monochrome E Ink monitor.

Many highlight groups are not colored especially. Numbers, preprocessor directives, etc. can immediately be identified anyway without being colored especially. In any case when using a monochrome display there are limited options to uniquely "color" text.

Diffs are handled well by this color scheme.

Some might enjoy using this color scheme on a color display. There is sparing use of color.

<!-- xxx Include screen shot/s. -->


## Recommended [Onyx Boox Mira](https://onyxboox.com/boox_mira) monitor settings

| Option                 | Value |
|------------------------|-------|
| Display Mode           | Normal (&#9635;<!-- Unicode character 9635 is "white square containing a small black square". xxx The symbol isn't quite right; the icon for the Normal display mode has rounded corners but Unicode character 9635 does not have rounded corners. Use an image (an SVG?) instead. -->) |
| Dark Color Enhancement | 3   <!-- xxx Include an image (an SVG?) of the Dark Color Enhancement icon? --> |
| Light Color Filter     | 1 |
| Resolution             | 2184 x 1626<br>(Windows 11 display scaling: 175%) |

<!-- XXX Provide a command to set these settings. Use https://github.com/elithper/miractl? -->


## Windows Terminal set up

* **Enable display of bold text**
  <br>By default Windows Terminal will use the regular font for text that should appear bold in Vim; fix by setting `"Intense Text Style"` to `"Bold font with bright colors"`, or to `"Bold"`. <!-- Note: `"Bright colors"` is used by default for `"Intense Text Style"` (Windows Terminal v1.17.11461.0). --> (`Intense Text Style` can be set from `Settings` &#9659; `Profiles/Defaults` &#9659; `Additional Settings/Appearance` &#9659; `Text Formatting/Intense Text Style`.)
