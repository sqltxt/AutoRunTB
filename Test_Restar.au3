

If @OSVersion == "WIN_7" Then
   Sleep(3000)
			   ;Filewriteline($LogName, "20:" & @TAB & $LogTime & "����δ����ϵͳ")
			   Run("shutdown -r")
			Else
			   MsgBox(4096,'',' ϵͳ��'&@OSVersion&' ?�汾�� '&@OSBuild&' ?������� ?'&@OSServicePack)
		EndIf