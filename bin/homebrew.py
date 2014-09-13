import subprocess
import Foundation
import objc
import AppKit
import sys
import os
import syslog

def notify(title, subtitle, info_text, delay=0, userInfo={}):
        NSUserNotification = objc.lookUpClass('NSUserNotification')
        NSUserNotificationCenter = objc.lookUpClass('NSUserNotificationCenter')

        notification = NSUserNotification.alloc().init()
        notification.setTitle_(title)
        notification.setSubtitle_(subtitle)
        notification.setInformativeText_(info_text)
        notification.setUserInfo_(userInfo)
        notification.setDeliveryDate_(Foundation.NSDate.dateWithTimeInterval_sinceDate_(delay, Foundation.NSDate.date()))
        NSUserNotificationCenter.defaultUserNotificationCenter().scheduleNotification_(notification)

brew = "/usr/local/bin/brew"

syslog.openlog("homebrew.py")

if os.system(brew + " update"):
    syslog.syslog(syslog.LOG_ALERT, "Problem updating homebrew")
    raise SystemExit

if subprocess.check_output(brew + " outdated", shell=True):
    notify("homebrew", "Updates available", "Please update your formulae!")

if not os.system(brew + " cleanup"):
    syslog.syslog(syslog.LOG_ALERT, "Can't cleanup homebrew")
