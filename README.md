CoffeeLint - Newline At End Of File [![Build Status](https://api.travis-ci.org/Dreamscapes/coffeelint-newline-at-eof.png)](https://travis-ci.org/Dreamscapes/coffeelint-newline-at-eof)
===================================

## Description
This [CoffeeLint](http://www.coffeelint.org) plugin verifies whether or not your files end with a newline. You can customise its behaviour to either enforce newlines at the end of each file or to prohibit them.

## Installation
```sh
npm install coffeelint-newline-at-eof [--save-dev]
```
***Note:*** *You might have to install the plugin as a global plugin ( `-g` ) if you use coffeelint.json in your `$HOME` directory.*

## Usage

1. Generate or edit your *coffeelint.json* configuration file: this is usually done via `coffeelint --makeconfig > ~/coffeelint.json` for user-level Coffeelint configurations
1. Insert the below configuration into *coffeelint.json*

```js
"newline_at_eof": {
    "module": "coffeelint-newline-at-eof",
    "level": "error",
    "behaviour": "require"
}
```

## Configuration

The only configuration option specific to this plugin is the **behaviour** property.

Available values are:

 - **require** - Newlines are **required** to be present at the end of file
 - **forbid** - Newlines are **forbidden** to be present at the end of file

By default, Coffeelint will report errors if this rule is not satisfied. You may want to relax this by setting the **level** to **warn** in your configuration.

## Credits

Thanks to [Matt Perpick](https://github.com/clutchski), the creator of [Coffeelint](https://github.com/clutchski/coffeelint) and to all contributors to the project for their excellent work.

## License

This software is licensed under the **BSD (3-Clause) License**. See the [LICENSE](LICENSE) file for more information.
