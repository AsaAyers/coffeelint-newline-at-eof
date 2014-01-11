# Grunt tasks configuration

module.exports = (grunt) ->
  grunt.initConfig

    # Values appearing frequently in Grunt tasks should be defined as variables here
    ext:            'coffee'                                # Default file extension for source files
    srcDir:         'src/'                                  # Application's source files
    testsDir:       'test/'                                 # Application's tests
    srcFiles:       '<%= srcDir %>**/*.<%= ext %>'          # All source files
    testFiles:      '<%= testsDir %>**/*.test.<%= ext %>'   # All test files

    # Coffeelint configuration
    coffeelint:
      options: grunt.file.readJSON 'coffeelint.json'

      gruntfile:    'gruntfile.coffee'      # Lint this file
      sources:      '<%= srcFiles %>'       # Lint application's sources
      tests:        '<%= testFiles %>'      # Lint application's tests

    # Watch configuration (runs tasks based on filesystem changes)
    watch:
      options:
        interrupt:  true            # Restarts any running tasks on next event
        atBegin:    true            # Runs all defined watch tasks on startup
        dateFormat: ( time ) ->     # Original log entry is damn too long, let's shorten it
          grunt.log.writeln "Completed in #{time}ms at " + ( new Date() ).toLocaleTimeString()

      gruntfile:    # Watch this file for changes (also reloads watch configuration on the fly)
        files:      'gruntfile.coffee'
        tasks: [
          'coffeelint:gruntfile'
        ]

      sources:      # Watch the source files for changes
        files:      '<%= srcFiles %>'
        tasks: [
          'coffeelint:sources'
        ]

      tests:        # Watch the tests for changes
        files:      '<%= testFiles %>'
        tasks: [
          'coffeelint:tests'
          'test'
        ]

    # Testing configuration
    mochacli:
      options:
        reporter:   'spec'
        require: [
          'should'
        ]
        compilers: [
          'coffee:coffee-script-redux/register'
        ]

      all:          # Execute all test cases
        files:      '<%= testFiles %>'

  # Load Grunt task plugins
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-mocha-cli'

  # Define custom tasks
  grunt.registerTask 'test', ['mochacli']
  grunt.registerTask 'default', ['coffeelint', 'test']
