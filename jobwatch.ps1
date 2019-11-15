# Windowsでバッググラウンドジョブの実行状況を監視するスクリプト
# 引数 -h で実行すると、get-jobの結果を出力せず、実行ジョブ数のみ表示する。

# 監視の実行間隔は以下の数値を修正する。※デフォルト5秒間隔
##### 実行間隔設定 #####
$v_SLEEPSEC = 5
####################### 

$v_DATE = (Get-Date -Format "yyyy/MM/dd HH:mm")
$exec_run_count = (get-job -State Running).count
$v_SLEEPSEC = 5
$v_OPT = $Args[0] 

    do{
        $run_count = (get-job -State Running).count
        write-host "================================================="
        write-host " $v_DATE　：　実行中ジョブ数： "$run_count  /  $exec_run_count
        write-host "================================================="

        if( $v_OPT -ne "-h"){
        get-job -State Running
        }

        write-host 
        Start-Sleep $v_SLEEPSEC 
        }while($run_count -ne 0)

write-host "実行中ジョブ数" $run_count  /  $exec_run_count 

Write-Host "終了するには何かキーを押してください..."
$host.UI.RawUI.ReadKey()

return 0
