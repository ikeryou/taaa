

# 開発ディレクトリ
SRC_DIR = './src'

# 公開ディレクトリ
PUBLISH_DIR = "./build";


gulp = require('gulp');

# gulp-系
$ = require('gulp-load-plugins')();

# browserify
browserify = require('browserify');
source = require('vinyl-source-stream');






# -------------------------------------------------------------------
# coffee
# -------------------------------------------------------------------
gulp.task 'coffee', ->
  browserify({
    entries: [SRC_DIR + '/TAAA.coffee']
    extensions: ['.coffee', '.js']})
      .bundle()
      .pipe(source('taaa.min.js'))
      .pipe($.streamify($.uglify()))
      .pipe(gulp.dest(PUBLISH_DIR + '/'))



# -------------------------------------------------------------------
# connect
# -------------------------------------------------------------------
gulp.task 'connect', ->
  $.connect.server({
    root: "./"
    port:50000})



# -------------------------------------------------------------------
# watch
# -------------------------------------------------------------------
gulp.task 'watch', ->
  gulp.watch([SRC_DIR + '/**/*.coffee'], ['coffee'])



gulp.task 'default', ['coffee', 'watch', 'connect']






























