;ʱ���
;����
;1:	[08:41:00]		TB����
;2:	[08:42:00]		TB��¼
;3:	[08:53:00]		��������
;4:	[08:54:00]		�������
;5:	[15:35:00]		�������й�����
;6:	[15:36:00]		�رռ��
;7:	[15:37:00]		ֹͣ�����Զ�����
;8:	[15:58:00]		�ر�TB
;ҹ��
;1:	[20:41:00]		TB����
;2:	[20:42:00]		TB��¼
;3:	[20:53:00]		��������
;4:	[20:54:00]		�������
;5:	[02:35:00]		�������й�����
;6:	[02:36:00]		�رռ��
;7:	[02:37:00]		ֹͣ�����Զ�����
;8:	[02:58:00]		�ر�TB
;���������
;0:	[08:40:00]		������ɱ
;9:	[08:49:00]		�������
;10:[08:50:00]		�˻���¼
;11:[08:51:00]		��¼ʧ��

;��־�ļ�����һ�����£�
;�������		1��2��3��4��5��6��7��8
;�ǽ�����		1��2��10��11��8
;�������		1��2��9��8
;�ֶ���¼		1��2��10��3��4��5��6��7��8
;��ĩ����		20

#include <Date.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <Constants.au3>
#include <WinAPIFiles.au3>

Global $TBloginName		=	"gentle"
Global $TBloginPassword	=	"iamanoth1977OK"
Global $TBInstallPath	=	"C:\Users\Administrator\Documents\tbv5321_x64_portable"
Global $ExpirationDate  =	"2018/01/01";ע���ʽΪ��YYYY/MM/DD��
Global $LogName
Global $LogTime
Global $Week[7] = ['����', '��һ', '�ܶ�', '����', '����', '����', '����']
Global $s = 0
;������������ʱ������һ��ҹ��ʱ������һ��
;If ProcessExists("Test_AutoRun_64_5321.exe")  Then	;����ǰ������
                ;ProcessClose("Test_AutoRun_64_5321.exe")		;�ر�TB
;EndIf
While 1
	    Sleep(6000); ִ��һ��ͣ600��
        $LogName			=	$TBInstallPath  & "\LOG_" & @YEAR & @MON & @MDAY & "_"& $Week[@WDAY - 1]&".txt"
        $LogTime			=	"[" & @HOUR & ":" & @MIN & ":" & @SEC & "]" & @TAB & @TAB
		TradeLog()
WEnd
;�������30����ȡ���׼�¼
Func TradeLog()
		 $TradeName			=	$TBInstallPath &"\AutoTrade\" & @YEAR & @MON & @MDAY & ".log"
		 MsgBox(0, "�ļ�", $TradeName)
		 if FileExists ($TradeName) Then
			MsgBox(0, "2", "2")
			$TradeLog			=	FileOpen($TradeName)
			MsgBox(0, "3", "3")
			If $TradeLog = -1 Then
			   MsgBox(0, "����", "�޷����ļ�.")
			   Filewriteline($LogName, "30:" & @TAB & $LogTime & "����,�޷����ļ�." & $TradeName)
			   ;Exit
			EndIf
			$size=FileGetSize($TradeName)
			MsgBox(0, "", "λ��3: " & "$size=" &  $size & "$s=" & $s)
			If $size<>$s Then
			   Local $n = FileSetPos($TradeLog, $s, $FILE_BEGIN)
			   Filewriteline($LogName, "30:" & @TAB & $LogTime & FileRead($TradeLog))
			   MsgBox(0, "", "λ��4: " & "$size=" &  $size & "$s=" & $s)
			   $s=$size
			EndIf
			FileClose($TradeLog)
		 EndIf
EndFunc
