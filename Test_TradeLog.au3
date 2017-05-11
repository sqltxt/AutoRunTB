;时间表
;早盘
;1:	[08:41:00]		TB启动
;2:	[08:42:00]		TB登录
;3:	[08:53:00]		交易启动
;4:	[08:54:00]		监控启动
;5:	[15:35:00]		保存所有工作区
;6:	[15:36:00]		关闭监控
;7:	[15:37:00]		停止所有自动交易
;8:	[15:58:00]		关闭TB
;夜盘
;1:	[20:41:00]		TB启动
;2:	[20:42:00]		TB登录
;3:	[20:53:00]		交易启动
;4:	[20:54:00]		监控启动
;5:	[02:35:00]		保存所有工作区
;6:	[02:36:00]		关闭监控
;7:	[02:37:00]		停止所有自动交易
;8:	[02:58:00]		关闭TB
;不正常清况
;0:	[08:40:00]		进程自杀
;9:	[08:49:00]		程序过期
;10:[08:50:00]		账户登录
;11:[08:51:00]		登录失败

;日志文件流程一览如下：
;正常情况		1、2、3、4、5、6、7、8
;非交易日		1、2、10、11、8
;程序过期		1、2、9、8
;手动登录		1、2、10、3、4、5、6、7、8
;周末重启		20

#include <Date.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <Constants.au3>
#include <WinAPIFiles.au3>

Global $TBloginName		=	"gentle"
Global $TBloginPassword	=	"iamanoth1977OK"
Global $TBInstallPath	=	"C:\Users\Administrator\Documents\tbv5321_x64_portable"
Global $ExpirationDate  =	"2018/01/01";注意格式为“YYYY/MM/DD”
Global $LogName
Global $LogTime
Global $Week[7] = ['周日', '周一', '周二', '周三', '周四', '周五', '周六']
Global $s = 0
;开机后在早盘时间启动一次夜盘时间启动一次
;If ProcessExists("Test_AutoRun_64_5321.exe")  Then	;动作前提条件
                ;ProcessClose("Test_AutoRun_64_5321.exe")		;关闭TB
;EndIf
While 1
	    Sleep(6000); 执行一次停600秒
        $LogName			=	$TBInstallPath  & "\LOG_" & @YEAR & @MON & @MDAY & "_"& $Week[@WDAY - 1]&".txt"
        $LogTime			=	"[" & @HOUR & ":" & @MIN & ":" & @SEC & "]" & @TAB & @TAB
		TradeLog()
WEnd
;动作编号30：读取交易记录
Func TradeLog()
		 $TradeName			=	$TBInstallPath &"\AutoTrade\" & @YEAR & @MON & @MDAY & ".log"
		 MsgBox(0, "文件", $TradeName)
		 if FileExists ($TradeName) Then
			MsgBox(0, "2", "2")
			$TradeLog			=	FileOpen($TradeName)
			MsgBox(0, "3", "3")
			If $TradeLog = -1 Then
			   MsgBox(0, "错误", "无法打开文件.")
			   Filewriteline($LogName, "30:" & @TAB & $LogTime & "错误,无法打开文件." & $TradeName)
			   ;Exit
			EndIf
			$size=FileGetSize($TradeName)
			MsgBox(0, "", "位置3: " & "$size=" &  $size & "$s=" & $s)
			If $size<>$s Then
			   Local $n = FileSetPos($TradeLog, $s, $FILE_BEGIN)
			   Filewriteline($LogName, "30:" & @TAB & $LogTime & FileRead($TradeLog))
			   MsgBox(0, "", "位置4: " & "$size=" &  $size & "$s=" & $s)
			   $s=$size
			EndIf
			FileClose($TradeLog)
		 EndIf
EndFunc
