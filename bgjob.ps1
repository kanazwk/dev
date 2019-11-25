$functions = {
  function Output-Message {
    param (
      [string]$message,
      [string]$name
    )
    sleep 5
    echo "$message : $name"
  }
}

$job = Start-Job -InitializationScript $functions -ScriptBlock {
  param (
    [string]$m,
    [string]$n
  )
  Output-Message $m $n # 変更点
} -ArgumentList "Hello World", "kirishima"

# 待機後に結果出力
Wait-Job $job
Write-Host (Receive-Job -Job $job)
Remove-Job $job
