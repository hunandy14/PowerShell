# ----------------------------------------------------------------
# �禡
# ----------------------------------------------------------------
# �D�X���w���ɦW�çR��
Function pickExtenName($extenName = ' ���ƥ�', $deepNum=3){
    # Ū���ɮ�
    $file=Get-ChildItem -File -Depth $deepNum
    # �}�l��
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
# �D�{���}�l
# ----------------------------------------------------------------
# ���]���ɦW
# �s��r���.txt.txt ���ƥ�
echo start
pickExtenName '.mp4 ���ƥ�'
# ----------------------------------------------------------------