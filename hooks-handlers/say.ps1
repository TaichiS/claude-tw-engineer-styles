#!/usr/bin/env pwsh
# Windows 相容版本的 say 指令
# 使用 PowerShell 的 System.Speech 進行語音合成

param(
    [Parameter(Mandatory=$true, Position=0, ValueFromRemainingArguments=$true)]
    [string[]]$Text
)

# 合併所有參數為一個字串
$message = $Text -join " "

if ([string]::IsNullOrWhiteSpace($message)) {
    Write-Error "錯誤：請提供要朗讀的文字"
    exit 1
}

try {
    # 載入 System.Speech 組件
    Add-Type -AssemblyName System.Speech -ErrorAction Stop

    # 建立語音合成器
    $synthesizer = New-Object System.Speech.Synthesis.SpeechSynthesizer

    # 嘗試設定中文語音（如果可用）
    $chineseVoice = $synthesizer.GetInstalledVoices() |
        Where-Object { $_.VoiceInfo.Culture.TwoLetterISOLanguageName -eq "zh" } |
        Select-Object -First 1

    if ($chineseVoice) {
        $synthesizer.SelectVoice($chineseVoice.VoiceInfo.Name)
    }

    # 執行語音合成
    $synthesizer.Speak($message)

    # 釋放資源
    $synthesizer.Dispose()

    exit 0
}
catch {
    Write-Error "語音合成失敗：$($_.Exception.Message)"
    exit 1
}
