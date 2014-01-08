# Enable (Arabic) Support and Windows encoding:
modprobe msdos
modprobe vfat
modprobe ntfs
modprobe nls_cp864
modprobe nls_iso8859-6
modprobe nls_utf8

# Unicode Locale environment variables (See: Unicode HowTo):
export LANG=ar_SA.UTF-8
export LANGUAGE=ar:ar_SA.UTF-8:en:C:en_US.UTF-8:en_GB
export LANGUAGELIST=ar_SA:en_GB:en:C
export LC_ALL=ar_SA.UTF-8
export FALLBACKLOCALE=C
export COUNTRY=SA
export G_BROKEN_FILENAMES=1
export CHARSET=ISO_8859-6
export LESSCHARSET=UTF-8
export OUTPUT_CHARSET=UTF-8
clear



PATH=/sbin:/usr/sbin:/bin:/usr/bin

do_start() {
    if [ -x /etc/rc.local ]; then
        [ "$VERBOSE" != no ] && log_begin_msg "Running local boot scripts (/etc/rc.local)"
        /etc/rc.local
    ES=$?
    [ "$VERBOSE" != no ] && log_end_msg $ES
        return $ES
    fi
}




case "$1" in
    start)
        do_start
        ;;
    restart|reload|force-reload)
        echo "Error: argument '$1' not supported" >&2
        exit 3
        ;;
    stop)
        ;;
    *)
        echo "Usage: $0 start|stop" >&2
        exit 3
        ;;
esac


