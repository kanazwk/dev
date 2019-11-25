$exec_run_count = 10
$run_count = 1

    do{
        Start-Sleep 1
        write-host $run_count times.
        $run_count++
    }while($run_count -ne $exec_run_count)

exit