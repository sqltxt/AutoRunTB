   #include <Process.au3>

   Local $SendEmail		=	"C:\Users\Administrator\Documents\tbv5331_x64_portable" 	;SendEmail路径
   Local $FromAddress	=	"Gentle_TB@163.com"											;发件箱
   Local $ToAddress		=	"sqltxt@qq.com"												;收件箱
   Local $SmtpServer	=	"smtp.163.com"												;SMTP服务器
   Local $UserName		=	"Gentle_TB"													;账户名
   Local $Password		=	"nhh109620"													;密码
   Local $Subject		=	"test邮件标题"												;邮件主题
   Local $filename		=	""
   Local $Body			=	"邮件内容 啦啦啦啦啦啦"										;邮件正文

   _RunDos($SendEmail&"\SendEmail.exe -f "&$FromAddress&" -t "&$ToAddress&" -s "&$SmtpServer&" -xu "&$UserName&" -xp "&$Password&" -u "&$Subject&" -m "&$Body&" -o message-charset=GBK")

   Sleep(10000)



;SendEmail参数如下：
;-f 表示from，发件人地址
;-t 表示to，收件人地址
;-s mail服务器域名
;-u 邮件主题
;-xu 用户名（@之前的）
;-xp 用户密码
;-m 邮件正文
;-o message-file=/root/..

;-o message-charset=utf8             邮件内容的编码
;-o message-content-type=html        邮件内容的格式
;-o message-file=a.txt               把文件内容以邮件正文发出

;-a 发送附件 （-m,-o,-a可以同时使用）