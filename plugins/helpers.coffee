url = require 'url'
path = require 'path'

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
      thePath = url.resolve env.locals.image_dir
      helpers.url thePath
    
    # Resolve url relative to script directory
    javascript_url: (p) ->
      thePath = url.resolve env.locals.image_dir, setExt(p, 'js')
      helpers.url thePath   

    # Resolve url relative to stylesheet directory
    stylesheet_url: (p) ->
      thePath = url.resolve env.locals.image_dir, setExt(p, 'css')
      helpers.url thePath

  for key, value of helpers
    env.helpers[key] = value

  callback()
