jupyter-local() {
    jupyter lab --notebook-dir=. --ip='*' --allow-root --NotebookApp.token='' --NotebookApp.password=''
}
