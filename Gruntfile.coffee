module.exports = (grunt) ->
  @initConfig
    
    compass:
      options:
        basePath: './public'
        sassDir: 'sass'
        cssDir: 'css'
        require: ['susy', 'breakpoint']
      preview:
        outputStyle: 'expanded'
      production:
        outputStyle: 'compressed'

    extend:
      options:
        deep: true
        defaults: grunt.file.readJSON 'config.json'
      staging:
        files:
          './config-staging.json': ['./config-staging-base.json']
      production:
        files:
          './config-production.json': ['./config-production-base.json']
      preview:
        files:
          './config-preview.json': ['./config-preview-base.json']

    wintersmith:
      staging:
        options:
          config: './config-staging.json'
      production:
        options:
          config: './config-production.json'
      preview:
        options:
          action: 'preview'
          config: './config-preview.json'

    clean:
      config: ['./config-staging.json', './config-production.json', './config-preview.json']
      staging: ['./public']

  @loadNpmTasks "grunt-contrib-compass"
  @loadNpmTasks "grunt-extend"
  @loadNpmTasks "grunt-wintersmith"
  @loadNpmTasks "grunt-contrib-clean"

  @registerTask 'build', ['clean:staging', 'extend:production','wintersmith:production', 'clean:config']
  @registerTask 'stage', ['clean:staging', 'extend:staging','wintersmith:staging', 'clean:config']
  @registerTask 'preview', ['extend:preview','wintersmith:preview']
  
  @registerTask 'default', ['stage']