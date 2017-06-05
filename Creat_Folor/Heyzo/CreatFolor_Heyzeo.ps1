# 暫停
Function Pause(){
    Write-Host -NoNewLine 'Press any key to continue...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
}
# 讀取特定擴展名檔案
Function Read_File($ex_name, $Dep=0){
    $file=Get-ChildItem -Recurse -ErrorAction SilentlyContinue -Filter *$ex_name -Depth $Dep| 
    Where-Object { $_.Extension -eq $ex_name }
    return $file
}
# 讀取目錄項目
Function Read_Dir(){
    return Get-ChildItem -Directory -Recurse -ErrorAction SilentlyContinue
}
# 找番號
Function Number($Dir){
    return $Dir.Name.Substring(6,4)
}
# ----------------------------------------------------------------
Pause
# 讀取圖片檔名
$img_name=Read_File '.jpg'
# 複製圖片至資料夾內
ForEach($item in $img_name){
    mkdir $item.BaseName -ErrorAction SilentlyContinue
    Move-Item $item.Name $item.BaseName
}
# 目錄名稱
$Dir=Read_Dir
# 讀取圖片番號
ForEach($item in $Dir){
    $Num=Number $item
}
# 讀取影像檔名
$video_name=Read_File '.mp4'
# 以目錄為主去搜尋影片，然後移動
ForEach($item_Dir in $Dir){
    ForEach($item in $video_name){
        if($item.Name.Contains((Number $item_Dir)) -eq 1){
            ($item.Name) + " ----> " + ($item_Dir.Name)
            Move-Item $item.Name $item_Dir.Name
        }
    }
}

Pause