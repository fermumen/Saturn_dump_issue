$env:Path += ';C:\Program Files (x86)\Atkins\SATURN\XEXES 11.4.07H MC X7'

$p1x_codes = Import-Csv 'names_p1xdump.csv'

$codes = $p1x_codes.code
$ufs = '.\Epsom98oba.UFS'
$n = 9
$iters = $codes.Count/$n

for ($i = 0; $i -lt $iters; $i++) {
    $start = $n*$i
    $end = $start + $n - 1
    if ($end -gt $codes.Count) {
        $end = $codes.Count
    }
    #"$start, $end"
    $codes_iter = $codes[$start..$end]
    
    #($ufs, "/DUMP", ('export'+ $i + '.csv'), $codes_iter, "`$L")
    p1x $ufs "/DUMP" ('export'+ $i + '.csv') $codes_iter "`$L"

}

