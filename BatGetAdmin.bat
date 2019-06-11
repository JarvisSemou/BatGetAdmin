@echo off
@rem 判断是否需要管理员权限的常量，如果为 true 则脚本需要管理员权限，false 反之
set IS_NEED_ADMIN=true
if "%~2"=="" (
	if “%IS_NEED_ADMIN%”=="true" (
		mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 void main ::","","runas",1)(window.close)
		if "%errorlevel%" neq 0 (
			setlocal enableDelayedExpansion
			goto initStaticValue
		)
		exit
	)
	setlocal enableDelayedExpansion
	goto initStaticValue
)
if "%~2"=="main" (
	setlocal enableDelayedExpansion
	goto initStaticValue
)
:methodBrach
if "%~2"=="" goto main
if "%~2"=="main" goto main

goto eof

:initStaticValue

goto methodBrach

@rem 脚本入口
:main

goto eof

:eof