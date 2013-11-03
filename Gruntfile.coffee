module.exports = (grunt) ->
  @initConfig
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
      staging: ['./config-staging.json']
      production: ['./config-production.json']
      preview: ['./config-preview.json']

  @loadNpmTasks "grunt-extend"
  @loadNpmTasks "grunt-wintersmith"
  @loadNpmTasks "grunt-contrib-clean"

  @registerTask 'build', ['extend:production','wintersmith:production', 'clean']
  @registerTask 'stage', ['extend:staging','wintersmith:staging', 'clean']
  @registerTask 'preview', ['extend:preview','wintersmith:preview']
  
  @registerTask 'default', ['stage']