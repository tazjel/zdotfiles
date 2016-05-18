
alias 'Bani'='good' 

AA() {
    grep -Iishyr "\(Ramsbotham\|McDonald\|Miall\|Hugh\|Oliver\|Woodhouse\|Lederach\|Druckman\|eds\|Pruitt\|Kim\|Sung\|Cloke\|Kenneth\|Diamond\|Tidwell\|Alan\|Burton\|Cheldelin\)" .
}

export LC_ALL=en_US.UTF-8
# Unicode Locale environment variables (See: Unicode HowTo):
#export LANGUAGE=ar:ar_SA.UTF-8:en:C:en_US.UTF-8:en_GB
#export LC_ALL=en_US.UTF-8:ar_SA.UTF-8
#export LANG=en_US.UTF-8:ar_SA.UTF-8
#export LC_ALL=ar_SA.UTF-8
#export LANG=ar_SA.UTF-8


# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C
export LESSCHARSET=UTF-8
export CHARSET=ISO_8859-6

export tazjel=$HOME/zdotfiles
#export LANGUAGELIST=ar_SA:en_GB:en:C
export FALLBACKLOCALE=C
export COUNTRY=SA
export G_BROKEN_FILENAMES=1
