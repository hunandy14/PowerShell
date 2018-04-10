# ----------------------------------------------------------------
# 函式
# ----------------------------------------------------------------
# 挑出指定副檔名並刪除
Function pickExtenName($extenName = ' 的副本', $deepNum=3){
    # 讀取檔案
    $file=Get-ChildItem -File -Depth $deepNum
    # 開始修
    ForEach($Item_File in $file){
        if($Item_File.Extension.Contains($extenName)){
            $Item_File.FullName
            $newNames = $Item_File.DirectoryName + '\' + $Item_File.BaseName
            $newNames
            Rename-Item -Path $Item_File.FullName -NewName $newNames
        }
    }
}



# ----------------------------------------------------------------
# 主程式開始
# ----------------------------------------------------------------
# 重設副檔名
# 新文字文件.txt.txt 的副本
echo start
pickExtenName '.mp4 的副本'
# ----------------------------------------------------------------