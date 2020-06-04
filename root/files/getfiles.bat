@echo off

@rem 本バッチファイルの作成にあたり、以下のサイトを参考にしました。
@rem 【Bat】【vim】香り屋Vimをダウンロードしてインストールまでするbatファイル - Qiita
@rem https://qiita.com/koryuohproject/items/beed1a28ad6a1f60256d

setlocal

@rem ZIPファイル名
set zipfilename=Temp.zip

@rem GitHubのZIPパス
@rem set branchName=02-50
@rem set srcUrl=https://github.com/OpenTouryoProject/OpenTouryoTemplates/archive/%branchName%.zip
set srcUrl=https://github.com/OpenTouryoProject/OpenTouryo/archive/master.zip

@rem 解凍ディレクトリ
set extDir=%CD%

@rem 一時ディレクトリ
set tmpDir=Temp

:Download
@rem ダウンロードされたZIPファイルがあるなら解凍
if exist %extDir%\%zipfilename% GOTO Extract

@rem ZIPファイルのダウンロード
@powershell -NoProfile -ExecutionPolicy Bypass -Command "$d=new-object System.Net.WebClient; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; $d.Proxy.Credentials=[System.Net.CredentialCache]::DefaultNetWorkCredentials; $d.DownloadFile('%srcUrl%','%extDir%/%zipfilename%')"

:Extract
@rem 一時ディレクトリがあるならコピーへ
if exist %extDir%\%tmpDir% GOTO Xcopy

@rem ZIPファイルを一時ディレクトリに解凍
@powershell -NoProfile -ExecutionPolicy Bypass -Command "expand-archive %zipfilename%"

:Xcopy
@rem 解凍フォルダをコピー
cd %extDir%
xcopy /Y /E "Temp\OpenTouryo-master\root\files\resource" "resource\"

pause

:EOF
endlocal