# installs dependencies, runs R CMD check, runs covr::codecov()
do_package_checks()

get_stage("install") %>% 
  add_code_step(reticulate::install_miniconda()) %>% 
  add_code_step(reticulate::conda_create('r-reticulate', packages = c('python==3.6.9'))) %>% 
  add_code_step(keras::install_keras())

if (ci_on_ghactions()) {
  # creates pkgdown site and pushes to gh-pages branch
  do_pkgdown()
}
