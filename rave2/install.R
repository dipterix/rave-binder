s <- NULL
if(file.exists("~/.bashrc")) {
  s <- readLines("~/.bashrc")
}

s <- c(s, 'echo "source /etc/profile.d/bash_completion.sh"')


install.packages('ravemanager', repos = 'https://rave-ieeg.r-universe.dev')
ravemanager::install()
tryCatch({
  remotes::install_github("dipterix/rpymat", upgrade = FALSE, force = TRUE, quiet = FALSE)
})
ravemanager::configure_python("3.9")
# we don't use this so remove it
try({
  rpymat::run_command("conda remove -n r-reticulate --all --yes")
})

rpymat::add_packages(c("jupyter-rsession-proxy", "git+https://github.com/dipterix/jupyter-rave-proxy"), pip = TRUE)

threeBrain::download_template_subject('cvs_avg35_inMNI152')
raveio::raveio_setopt("threeBrain_template_subject", value = "cvs_avg35_inMNI152")


rpymat::run_command("conda clean --all --yes")

# remove demo data
unlink("~/rave_data/data_dir/demo/", recursive = TRUE)

# clear tempdir
try({
  system("strip /usr/local/lib/R/site-library/*/libs/*.so")
})
try({
  system("rm -r /tmp/downloaded_packages")
})

try({
  system("rm -r /tmp/Rtmp*")
})
unlink("/tmp/downloaded_packages", recursive = TRUE)
unlink(tempdir(), recursive = TRUE)
