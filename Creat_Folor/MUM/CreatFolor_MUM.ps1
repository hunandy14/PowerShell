# 暫停
Function Pause(){
    Write-Host -NoNewLine 'Press any key to continue...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
}
# 讀取特定擴展名檔案
Function Read_File($ex_name){
    # $file=Get-ChildItem -Recurse -ErrorAction SilentlyContinue -Filter *$ex_name -Depth $Dep| 
    # Where-Object { $_.Extension -eq $ex_name }
    # $file=Get-ChildItem -include $ex_name -Recurse -ErrorAction SilentlyContinue
    $file=Get-ChildItem -Path $ex_name -ErrorAction SilentlyContinue
    return $file
}
# 讀取目錄項目
Function Read_Dir(){
    return Get-ChildItem -Directory -Recurse -ErrorAction SilentlyContinue
}
# 找番號
Function Number($Dir){
    return $Dir.Name.Substring(4,3)
}
# ----------------------------------------------------------------
# Pause
# 讀取圖片檔名
$img_name = (Read_File "*.jpg") + (Read_File "*.jpeg")
$img_name
# 去重複取得目錄
$Dir_name=$img_name.Name.Substring(0,7) | select -uniq
# 建立資料夾
ForEach($item in $Dir_name){
    ("Create dir : ") + $item
    mkdir $item -ErrorAction SilentlyContinue
}
# 搜索建立的目錄
$Dir=Read_Dir
# 讀取所有檔案(不包含資料夾)
$all_name=Read_File "*.*"
# 以目錄為主去搜尋所有檔案，然後移動
ForEach($item_Dir in $Dir){
    ForEach($item in $all_name){
        if($item.Name.Contains((Number $item_Dir)) -eq 1){
            ($item.Name) + " ----> " + ($item_Dir.Name)
            Move-Item $item.Name $item_Dir.Name
        }
    }
}

# Pause