
var gulp = require('gulp')
, uglify = require("gulp-uglify")
, jshint = require("gulp-jshint")
, rename = require('gulp-rename')
, graceful = require('graceful-fs')
, concat = require('gulp-concat')
, rsync = require('rsyncwrapper').rsync
, spritesmith = require('gulp.spritesmith')
, imagemin = require('gulp-imagemin')
, texturepacker = require('spritesmith-texturepacker');








/**
Linting
*/
gulp.task('lint', function () {
    //gulp.src(['./js/Home.js', './js/MobileScroll.js'])
    gulp.src(['src/js/Home.js', 'src/js/MobileScroll.js'])
    .pipe(jshint({ sub: true, loopfunc: true }))
    .pipe(jshint.reporter());
});




/**
Compilers
*/
gulp.task('compile', ['compile-home'], function() {
});

gulp.task('compile-home', function () {
    gulp.src( ['src/js/jquery-1.11.2.min.js', 'src/js/pixi.js', 'src/js/MobileScroll.js', 'src/js/Home.js', '!src/js/isotopic-home.js'] )
    .pipe(concat('concat.js'))
    .pipe(uglify())
    .pipe(rename('isotopic-home.js'))
    .pipe(gulp.dest('js/'));
});




/**
Sprite sheet da home
*/
var spritesmith = require('gulp.spritesmith');

gulp.task('sprite', function () {
    gulp.src('src/sprites/*.png')
        .pipe(spritesmith({
            imgName: "spritesheet.png",
            cssName: "sprites.json",
            algorithm: 'binary-tree',
            padding: 1,
            cssTemplate: require('spritesmith-texturepacker') 
        }))
        .pipe(gulp.dest('img/'));
});

















/**
Watch
 */
gulp.task('watch-js', function () {
    gulp.watch(['./source/js/Home.js'], ['compile']);
});




/**
Deploy - SÓ EM UNIX
*/
gulp.task( 'deploy', function() {
  rsync({
    src: './',
    exclude: [ '.DS_Store', '/**/.DS_Store', 'gulpfile.js',  '.editorconfig',  'node_modules/', 'package.json' , 'README.md', '.gitignore', '.git/' , 'assets/'],
    dest: 'isotopic@isotopic.com.br:/home/storage/1/6c/04/isotopic/public_html/wordpress/wp-content/themes/isotopic',
    recursive: true,
    args: [ '--verbose' ],
    delete: true,
    compareMode: 'checksum',
    onStdout: function( data ) {
      console.log( data.toString() );
    }
  }, function( error, stdout, stderr, cmd ) {
    console.log( 'Finished deploy command.' );
  });
});
