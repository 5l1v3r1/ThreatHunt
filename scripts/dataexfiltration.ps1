# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  

# Send email
Write-Host "Send e-mail with your O365 account"
$O365user = Read-Host -Prompt 'Your O365 email address username@domain.com'
$O365pw = Read-Host -Prompt 'Your password'
$secpasswd = ConvertTo-SecureString $O365pw -AsPlainText -Force
$To = Read-Host -Prompt 'E-Mail address that will receive log files'
$Subject = Read-Host -Prompt 'Subject line'
$Body = Read-Host -Prompt 'Plain text body'
$mycreds = New-Object System.Management.Automation.PSCredential ($O365user, $secpasswd)
$SMTPServer = "smtp.office365.com"
$SMTPPort = "587"
Send-MailMessage -Credential $mycreds -SmtpServer $SMTPServer -Port $SMTPPort -From $O365user -To $To -Subject $Subject -Body $Body -Attachments "$ThreatBox\logs\logs.zip" -UseSsl
