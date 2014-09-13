import syslog

syslog.openlog("kern_scripts")

syslog.syslog(syslog.LOG_ALERT, "such scripts")
