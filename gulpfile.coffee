'use strict'

gulp = require('gulp')
del = require('del')
path = require('path')
child_process = require('child_process')
homePath = require('home-path')()
$ = require('gulp-load-plugins')()

repoPath = 'razor-x/zshrc'
branchInitial = 'master'

branch = "#{child_process.execSync('git rev-parse --abbrev-ref HEAD')}".trim()
pluginPath = "#{homePath}/.zgen/local/zshrc-#{branch}"

zgenReset = () -> del("#{homePath}/.zgen/init.zsh", {force: true})

gulp.task 'default', ['watch']

gulp.task 'clean', ->
  del(pluginPath, {force: true})
  zgenReset()

gulp.task 'dev', ['clean'], ->
  gulp.src("#{homePath}/.zshrc")
  .pipe $.replace("branch='#{branchInitial}'", "branch='#{branch}'")
  .pipe gulp.dest(homePath)

gulp.task 'nodev', ['clean'], ->
  gulp.src("#{homePath}/.zshrc")
  .pipe $.replace("branch='#{branch}'", "branch='#{branchInitial}'")
  .pipe gulp.dest(homePath)

gulp.task 'install', ->
  gulp.src('*.zsh')
  .pipe gulp.dest(pluginPath)

  gulp.src('plugin/**/*.zsh')
  .pipe gulp.dest("#{pluginPath}/plugin")

  gulp.src('plugins.zsh')
  .pipe $.replace(
    "zgen load #{repoPath} plugin"
    "zgen load #{process.cwd()} plugin #{branch}")
  .pipe gulp.dest(pluginPath)

gulp.task 'watch', ['install'], ->
  $.watch ['./*.zsh', './plugin/**/*.zsh'], (file) ->
    if file.event is 'unlink' then del(file.path, {force: true})
    if file.relative is 'plugins.zsh' then zgenReset()
  .pipe $.replace(
    "zgen load #{repoPath} plugin"
    "zgen load #{process.cwd()} plugin #{branch}")
  .pipe gulp.dest(pluginPath)
