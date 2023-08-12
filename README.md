# Template for RAVE on Binder / JupyterLab

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/dipterix/rave-binder/HEAD)

Generate a Git repository that can run RAVE (with R & Python) on
the browser via [mybinder.org](https://mybinder.org) or any JupyterHub
from this template repository!

Based on the [dipterix/rave2](https://hub.docker.com/r/dipterix/rave2)
image.

## How to use this repo

### 1. Create a new repo using this as a template

Use the [Use this template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template)
button on GitHub. Use a descriptive name representing the
GUI app you are running / demoing. You can then follow the rest of
the instructions in this README from your newly created repository.

### 2. Install any packages you want

You can create an `install.R` file that will be executed on build.
Use `install.packages` or `ravemanager:::install_packages`.

```R
# installs if package is missing, or skip
ravemanager:::install_packages("ggplot2")
```

Packages are installed from [packagemanager.rstudio.com](https://packagemanager.rstudio.com/client/#/),
and binary packages are preferred wherever possible. For some R packages,
you might need to install system packages via apt - you can do so by writing
out a list of apt package names in `apt.txt`.

### 3. Modify the Binder Badge in the README.md

The 'Launch on Binder' badge in this README points to the template repository.
You should modify it to point to your own repository. 

### 4. Add your R code and update README

Finally, add the R code you want to demo to the repository! Cleanup the README
too so it talks about your code, not these instructions on setting up this repo

## Troubleshooting

**It didn't work! What do I do now?**. File an issue in this repository!

