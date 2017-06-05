# �Ȱ�
Function Pause(){
    Write-Host -NoNewLine 'Press any key to continue...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
}
# Ū���S�w�X�i�W�ɮ�
Function Read_File($ex_name){
    # $file=Get-ChildItem -Recurse -ErrorAction SilentlyContinue -Filter *$ex_name -Depth $Dep| 
    # Where-Object { $_.Extension -eq $ex_name }
    # $file=Get-ChildItem -include $ex_name -Recurse -ErrorAction SilentlyContinue
    $file=Get-ChildItem -Path $ex_name -ErrorAction SilentlyContinue
    return $file
}
# Ū���ؿ�����
Function Read_Dir(){
    return Get-ChildItem -Directory -Recurse -ErrorAction SilentlyContinue
}
# ��f��
Function Number($Dir){
    return $Dir.Name.Substring(4,3)
}
# ----------------------------------------------------------------
# Pause
# Ū���Ϥ��ɦW
$img_name = (Read_File "*.jpg") + (Read_File "*.jpeg")
$img_name
# �h���ƨ��o�ؿ�
$Dir_name=$img_name.Name.Substring(0,7) | select -uniq
# �إ߸�Ƨ�
ForEach($item in $Dir_name){
    ("Create dir : ") + $item
    mkdir $item -ErrorAction SilentlyContinue
}
# �j���إߪ��ؿ�
$Dir=Read_Dir
# Ū���Ҧ��ɮ�(���]�t��Ƨ�)
$all_name=Read_File "*.*"
# �H�ؿ����D�h�j�M�Ҧ��ɮסA�M�Ჾ��
ForEach($item_Dir in $Dir){
    ForEach($item in $all_name){
        if($item.Name.Contains((Number $item_Dir)) -eq 1){
            ($item.Name) + " ----> " + ($item_Dir.Name)
            Move-Item $item.Name $item_Dir.Name
        }
    }
}

# Pause