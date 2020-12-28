var=$(date +"%FORMAT_STRING")
now=$(date +"%m_%d_%Y")
operationdatenow=$(date +"%d.%m.%Y_%H.%M")

_filename="/srv/dev-disk-by-label-RED1/RED1/naslogs/latest_log.txt"
_backupfile="/srv/dev-disk-by-label-RED1/RED1/naslogs/archive/${operationdatenow}.txt"

disk1data1=$(df -h | grep '\(Sist\|sda\)')
disk1data2=$(smartctl --all /dev/sda | grep '\(SMART overall-health\|SATA Version is\)')
disk2data1=$(df -h | grep '\(Sist\|sdb\)')
disk2data2=$(smartctl --all /dev/sdb | grep '\(SMART overall-health\|SATA Version is\)')
diskname1=$(smartctl --all /dev/sda | grep "Model Family")
diskname2=$(smartctl --all /dev/sdb | grep "Model Family")
cputemp=$(sensors | grep "Core 0")
boardtemp=$(sensors | grep "temp1")
uptime=$(uptime)

cat << EOF > $_filename

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
NAS STATUS by Nx
~~~~~~~~~~~~~~~~~~~~

=== SYSTEM UPTIME
$uptime

=== SYSTEM TEMPS ===

CPU core temp is $cputemp
Chipset temp is $boardtemp

=== HDD 1: $diskname1

$disk1data1
$disk1data2

=== HDD 2: $diskname2

$disk1data1
$disk1data2

=== CHECK FINISHED
$operationdate

EOF


cp $_filename $_backupfile


