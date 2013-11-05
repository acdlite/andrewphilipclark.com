url = require 'url'
path = require 'path'
typogr = require 'typogr'
marked = require 'marked'
$ = require 'cheerio'

module.exports = (env, callback) ->

  setExt = (p, newExt) ->
    oldExt = path.extname p
    newExt = if newExt[0] is '.' then newExt else '.' + newExt # Add dot to extension if it doesn't already start with one
    p.replace(new RegExp(oldExt + '$'), newExt)

  helpers =

    # Resolve url relative to site root 
    url: (p) ->
      url.resolve env.locals.url, p

    # Resolve url relative to image directory
    image_url: (p) ->
      thePath = path.join env.locals.image_dir, p
      helpers.url thePath
    
    # Resolve url relative to script directory
    javascript_url: (p) ->
      thePath = path.join env.locals.javascript_dir, setExt(p, 'js')
      helpers.url thePath   

    # Resolve url relative to stylesheet directory
    stylesheet_url: (p) ->
      thePath = path.join env.locals.stylesheet_dir, setExt(p, 'css')
      helpers.url thePath

    # Shortcut for typogrify
    typogrify: (s) ->
      typogr.typogrify s

    # Inline markdownify, with options for typogrify and sanitize
    # TODO: make this less hacked together
    inlineMd: (s, options = typogrify: true, sanitize: false) ->
      s = marked(s, smartypants: true)
      s = typogr.typogrify s if options.typogrify
      s = $('p', s)[ if options.sanitize then 'text' else 'html' ]()
      return s

    sanitize: (s) ->
      sanitize s

  for key, value of helpers
    env.helpers[key] = value

  callback()
