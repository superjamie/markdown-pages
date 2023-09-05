# Markdown Pages

Publish a directory of Markdown pages to a webserver.

Rendered locally with [Pandoc's Markdown](https://pandoc.org/MANUAL.html#pandocs-markdown).

Style based on [Solarized CSS](http://thomasf.github.io/solarized-css/).

## Requirements

* make
* pandoc
* rsync
* Apache httpd with `mod_rewrite` and Overrides allowed:

```
<Directory "/var/www/html">
    AllowOverride All
    Require all granted
</Directory>
```

## Usage

* Your Markdown source goes in the document root
* Rendered documents go in the directory `md`
* Set the `SERVER` property in `Makefile` to your rsync target
* Create a Markdown document, save it with `.md` extension
* The first `# Heading` will be the HTML page title
* Run `make` to render to HTML and rsync changes

The file structure looks like this:

Use of paths in your Markdown source is relative to the `/md/` directory, so an image in `/assets/` is used like:

```
![](../assets/image.png)
```

## License

GNU Affero GPL v3

## Authors

Jamie Bainbridge (jamie.bainbridge@gmail.com)

