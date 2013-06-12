select CHOICE in bob amy quit
do
        case "$CHOICE" in
                "bob")
                        echo "Bob was here"
                        ;;
                "amy")
                        echo "Amy was here"
                        ;;
                "quit")
                        exit
                        ;;
        esac
done
