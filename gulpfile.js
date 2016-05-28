  
var gulp = require('gulp');
var babel = require('gulp-babel');
var del = require('del');
var concat = require('gulp-concat');
 
var src_paths = {
     jsx:'src/assets/js/components/*.jsx'
};
 
var dist_path = 'src/assets/build/';

gulp.task('clean',function(){
     for(var k in dist_paths){
         del(dist_paths[k]);
     }
});

gulp.task('build',function(){
    gulp.src(src_paths.jsx)
        .pipe(babel({
            presets: ['react']
        }))
        .pipe(concat("all.components.js"))
        .pipe(gulp.dest(dist_path))
});

gulp.task('default',['build']);