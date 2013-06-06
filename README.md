# Cameron Craddock's CV
This is the CV for Cameron Craddock. I put it on github for basic versioning,
but also to make it readily available when I am on the road. 

## To clone this repository:
* for read only: ```git clone git://github.com/ccraddock/ccraddock_cv.git ccraddock_cv```

* for full access (requires access): ```git clone https://github.com/ccraddock/ccraddock_cv.git ccraddock_cv```

## To build the LuaLaTex files:
This procedure requires that you have lualatex installed for font support, this should work autmagickally if you have
MacTeX (on a Mac, duh).

### If you have make installed: 
* ```make```

To clean up:
* ```make clean```

### Without make:
```
lualatex ccraddock_cv
bibtex ccraddock_cv.1
bibtex ccraddock_cv.2
bibtex ccraddock_cv.3
lualatex ccraddock_cv
lualatex ccraddock_cv
lualatex ccraddock_cv
mv ccraddock_cv.pdf "ccraddock_cv_$( date "+%m%d%Y" ).pdf"
rm -v *.aux *.bbl *.blg *.log
```


