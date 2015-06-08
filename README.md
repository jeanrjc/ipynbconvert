# ipynbconvert

Convert all your notebooks under a given directory in html. 

It uses a home-made template which injects javascript to hide output and input: 

- Input is hidden by default (all the cell but first line, if longer than 2-3 lines). It can be developped by clicking on the `In [...]` label
- Input can be totally hidden by clicking on the output when existing. 
- Output is not hidden by default and can be hidden by clicking on the corresponding input cell 


To make it work, modify the 2 variables in the script:

- `OUT_NOTEBOOK_DIR` is the directory where you'll get all your notebook in HTML
- `IN_NOTEBOOK_DIR` is the directory wwhich contains all the notebooks you want to convert. 

You can then make an alias in  your `~/.bash_profile`:

    alias ipynbconvert='path/to/ipynbconvert/ipynbconvert.sh'

and call ipynbconvert wherever and whenever you want

Note that script has been built for personal use and might not work elsewhere.
