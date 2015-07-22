gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
uglify      = require 'gulp-uglify'
compass        = require 'gulp-compass'
minifyCss   = require 'gulp-minify-css'
concat      = require 'gulp-concat'

# compile coffeescript files
gulp.task 'compile-coffee', () ->
    gulp.src 'js/**/*.coffee'
        .pipe coffee()
        .pipe gulp.dest('js')

# ugilify js file and concat javascript file to application.js
gulp.task 'compile-js', () ->
    compileFileName = 'application.js'
    gulp.src ['js/**/*.js', '!js/' + compileFileName]
        .pipe concat(compileFileName)
        .pipe uglify(preserveComments:'some')
        .pipe gulp.dest('js')

# compile sass file
gulp.task 'compile-sass', () ->
    gulp.src ['sass/**/*.sass']
        .pipe compass()

gulp.task 'compile-css', () ->
    compileFileName = 'application.css'
    gulp.src [ 'css/**/*.css',
                '!css/' + compileFileName ]
        .pipe concat(compileFileName)
        .pipe minifyCss()
        .pipe gulp.dest('css')

gulp.task 'default', ['compile-coffee', 'compile-sass', 'compile-js', 'compile-css']
