
# set locale to Arabic
zlocale_UTF_ar_SA()
{
    export LANGUAGE=ar:ar_SA.UTF-8:en:C:en_US.UTF-8
}

# Reset locale to en_US.UTF-8
zlocale_UTF_en_US_UTF()
{
    export LANGUAGE=en_US.UTF-8
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    locale-gen en_US.UTF-8
    dpkg-reconfigure locales
    echo "You might need to reset your machine before changes take effect:"
    echo "sudo shutdown -r now"
}


# Make sure that on your system an UTF-8 locale is generated
zlocale_reconfigure()
{
    dpkg-reconfigure locales
}
