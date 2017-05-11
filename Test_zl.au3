#include <Constants.au3>
#include <Date.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>

Global $s1
While 1
   Local $f=FileOpen("C:\1\1.txt")
   If $f = -1 Then
	  MsgBox(0, "错误", "无法打开文件.")
	  Exit
   EndIf
Global $s=FileGetSize("C:\1\1.txt")

		 ;MsgBox(0, "", "位置2: " & " $s= " & $s & @CRLF  & " $s1= " & $s1)
	 $l=FileRead($f)
	 ;MsgBox(0, "", "位置1: " & @CRLF & $l)
   If $s<>$s1 Then
	   ; 设置当前文件坐标.
	  Local $n = FileSetPos($f, $s1, $FILE_BEGIN)
	  ;读取当前文件坐标内容
	  MsgBox(0, "", "位置3: " & FileGetPos($f) & @CRLF & "数据: " & @CRLF & FileRead($f))
	  $s1 = $s
	  MsgBox(0, "", "位置4: " & " $s= " & $s & @CRLF  & " $s1= " & $s1)
   EndIf
	 FileClose($f)
   Sleep(12000)
  WEnd