var gulp = require('gulp');
var babel = require('gulp-babel');
var rename = require('gulp-rename');
var plumber = require('gulp-plumber');
var webpack = require('gulp-webpack');
var copy = require('gulp-copy');

var paths = {
	jsx: ['**.jsx']
};

gulp.task('webpack', function(){
	gulp.src('app/router.js')
		.pipe(webpack({
			output:{
				filename: 'bundle.js'
			}
		}))
		.pipe(gulp.dest('dist/'));
	
	gulp.src('./dist/bundle.js')
		.pipe(gulp.dest('../scala/src/main/webapp/js'));

});

gulp.task('jsx', function() {
	return gulp.src(paths.jsx)
		.pipe(plumber())
		.pipe(babel())
		.pipe(rename({ extname: '.js' }))
		.pipe(gulp.dest('app/'));
});

gulp.task('watch', function() {
	gulp.watch(paths.jsx, ['jsx', 'webpack']);
});

gulp.task('default', ['jsx']);