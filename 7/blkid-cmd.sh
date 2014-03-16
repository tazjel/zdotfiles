# commandlinefu.com by David Winterbottom

# fsarchiver - probe disks and partitions
fsarchvier probe simple

# Get the /dev/disk/by-id fragment for a physical drive
ls -l /dev/disk/by-id | egrep ata-.*`hdparm -i /dev/sda | grep SerialNo | sed 's/.*SerialNo=//' | tr -d "\n"`.*sda$ | sed -e 's/.*ata-/ata-/' -e 's|[ ].*||' | tr -d "\n"

# detect partitions
blkid -c /dev/null

# Put uuid of disk into variable
TEST_UUID=$(blkid /dev/sda6 | sed -rn "s/^.*UUID=\"([a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12})\".*/\1/p")

# Show the UUID of a filesystem or partition
blkid /dev/sda7

