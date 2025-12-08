PowerShell Script to check disk space.
=============================
$Diskspace = get-wmiobject -class "win32_logicaldisk" -Namespace "root\CIMV2"
$Output = foreach($Disk in $Diskspace)
    {
        if ($Disk.Size -gt 0)
          {
            $Size = [math]::round($Disk.Size/1GB, 0)
            $Free = [math]::round($Disk.FreeSpace/1GB, 0)
            [PSCustomObject]@{
                    Drive = $Disk.Name
                    Name = $Disk.VolumeName
                    "Total Disk Space" = $Size
                    "Free Disk Size" = "{0:N0} ({1:P0})" -f $free, ($free/$size)          
                                               }
 
           }

    }
$Output

