

If @OSVersion == "WIN_7" Then
   Sleep(3000)
			   ;Filewriteline($LogName, "20:" & @TAB & $LogTime & "周任未重启系统")
			   Run("shutdown -r")
			Else
			   MsgBox(4096,'',' 系统：'&@OSVersion&' ?版本： '&@OSBuild&' ?服务包： ?'&@OSServicePack)
		EndIf