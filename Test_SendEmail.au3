   #include <Process.au3>

   Local $SendEmail		=	"C:\Users\Administrator\Documents\tbv5331_x64_portable" 	;SendEmail·��
   Local $FromAddress	=	"Gentle_TB@163.com"											;������
   Local $ToAddress		=	"sqltxt@qq.com"												;�ռ���
   Local $SmtpServer	=	"smtp.163.com"												;SMTP������
   Local $UserName		=	"Gentle_TB"													;�˻���
   Local $Password		=	"nhh109620"													;����
   Local $Subject		=	"test�ʼ�����"												;�ʼ�����
   Local $filename		=	""
   Local $Body			=	"�ʼ����� ������������"										;�ʼ�����

   _RunDos($SendEmail&"\SendEmail.exe -f "&$FromAddress&" -t "&$ToAddress&" -s "&$SmtpServer&" -xu "&$UserName&" -xp "&$Password&" -u "&$Subject&" -m "&$Body&" -o message-charset=GBK")

   Sleep(10000)



;SendEmail�������£�
;-f ��ʾfrom�������˵�ַ
;-t ��ʾto���ռ��˵�ַ
;-s mail����������
;-u �ʼ�����
;-xu �û�����@֮ǰ�ģ�
;-xp �û�����
;-m �ʼ�����
;-o message-file=/root/..

;-o message-charset=utf8             �ʼ����ݵı���
;-o message-content-type=html        �ʼ����ݵĸ�ʽ
;-o message-file=a.txt               ���ļ��������ʼ����ķ���

;-a ���͸��� ��-m,-o,-a����ͬʱʹ�ã�