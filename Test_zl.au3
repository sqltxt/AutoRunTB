#include <Constants.au3>
#include <Date.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>

Global $s1
While 1
   Local $f=FileOpen("C:\1\1.txt")
   If $f = -1 Then
	  MsgBox(0, "����", "�޷����ļ�.")
	  Exit
   EndIf
Global $s=FileGetSize("C:\1\1.txt")

		 ;MsgBox(0, "", "λ��2: " & " $s= " & $s & @CRLF  & " $s1= " & $s1)
	 $l=FileRead($f)
	 ;MsgBox(0, "", "λ��1: " & @CRLF & $l)
   If $s<>$s1 Then
	   ; ���õ�ǰ�ļ�����.
	  Local $n = FileSetPos($f, $s1, $FILE_BEGIN)
	  ;��ȡ��ǰ�ļ���������
	  MsgBox(0, "", "λ��3: " & FileGetPos($f) & @CRLF & "����: " & @CRLF & FileRead($f))
	  $s1 = $s
	  MsgBox(0, "", "λ��4: " & " $s= " & $s & @CRLF  & " $s1= " & $s1)
   EndIf
	 FileClose($f)
   Sleep(12000)
  WEnd