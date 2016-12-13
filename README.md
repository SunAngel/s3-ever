# S3-Ever - The Simplest static site generator. Ever.

Simple shell script for generating static pages from header, footer and content.

## Main features
This script get header file, footer file, content file (you can use some 'filter' apps to modify content file while building) and makes ready-for-use static HTML page for you. That simple!
But it also has some features:
* Config file support: You can configure lots of things!
* Filters support: you can write your content in almost any markup language (Markdown or LaTeX, for example) and configure script to call some programm to convert it to HTML format!
* Lighttpd configuration file example: I use Lighttpd on my server, so I've wrote good lighttpd config for you! If you use another server (like nginx or Apache), you, unfortunatelly, have to write your own config.
* No support of subdirectorues: this script do not support of subdirectories for pages, it will take only file name and throw away all directories, so urls: `/test`, `/path/test`, `/a/b/c/test` and `/a/../../a/../../test` are the same for script.

## Scripts
This repo has folowing scripts:
* `bin/build.sh` - Script which build and output static page. Designed to be called by webserver via CGI interface.
* `bin/clear-cache.sh` - Helper script to delete all generated static pages.

## Configuration
Script search for configuration file in 2 locations: `conf/config.def` and `conf/config`. First file contains default values and you shouldn't change it. 
At this moment following configuration options are supported:
* `DATA_DIR` - Directory, where script will search for content files. Default: "./data".
* `DATA_EXT` - Extension for content files. Default: ".htm".
* `CACHE_DIR` - Directory, where script will place generated pages. Default: "./cache".
* `CACHE_EXT` - Extensions for generated files. Default: ".htm".
* `CONTENT_FILTER` - Program, which will be used as filter for content, so you can, for example `pandoc` do write content files in Markdown format and script will convert in to HTML.  Default: empty.
* `PAGE_HEADER` - Header file path. Default: "./data/default/header.htm".
* `PAGE_FOOTER` - Footer file path. Default: "./data/default/footer.htm".
* `PAGE_404` - 404 page file path. Default: "./data/default/404".
* `PAGE_INDEX` - Index page file path. Default: "./data/default/index".
