@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  todocass startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Add default JVM options here. You can also use JAVA_OPTS and TODOCASS_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-Dlogback.configurationFile=etc/todosolr/logging.xml"

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windowz variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\cassandra-crud-1.0.jar;%APP_HOME%\lib\cassandra-driver-core-2.1.5.jar;%APP_HOME%\lib\cassandra-all-2.1.5.jar;%APP_HOME%\lib\logback-core-1.1.3.jar;%APP_HOME%\lib\logback-classic-1.1.3.jar;%APP_HOME%\lib\slf4j-api-1.7.12.jar;%APP_HOME%\lib\netty-3.9.0.Final.jar;%APP_HOME%\lib\metrics-core-3.0.2.jar;%APP_HOME%\lib\snappy-java-1.0.5.jar;%APP_HOME%\lib\lz4-1.2.0.jar;%APP_HOME%\lib\compress-lzf-0.8.4.jar;%APP_HOME%\lib\commons-cli-1.1.jar;%APP_HOME%\lib\commons-lang3-3.1.jar;%APP_HOME%\lib\commons-math3-3.2.jar;%APP_HOME%\lib\concurrentlinkedhashmap-lru-1.3.jar;%APP_HOME%\lib\antlr-3.5.2.jar;%APP_HOME%\lib\antlr-runtime-3.5.2.jar;%APP_HOME%\lib\jackson-core-asl-1.9.2.jar;%APP_HOME%\lib\jackson-mapper-asl-1.9.2.jar;%APP_HOME%\lib\jline-1.0.jar;%APP_HOME%\lib\json-simple-1.1.jar;%APP_HOME%\lib\high-scale-lib-1.0.6.jar;%APP_HOME%\lib\jbcrypt-0.3m.jar;%APP_HOME%\lib\metrics-core-2.2.0.jar;%APP_HOME%\lib\reporter-config-2.1.0.jar;%APP_HOME%\lib\thrift-server-0.3.7.jar;%APP_HOME%\lib\stream-2.5.2.jar;%APP_HOME%\lib\super-csv-2.1.0.jar;%APP_HOME%\lib\libthrift-0.9.2.jar;%APP_HOME%\lib\cassandra-thrift-2.1.5.jar;%APP_HOME%\lib\jna-4.0.0.jar;%APP_HOME%\lib\jamm-0.3.0.jar;%APP_HOME%\lib\netty-all-4.0.23.Final.jar;%APP_HOME%\lib\ST4-4.0.8.jar;%APP_HOME%\lib\hibernate-validator-4.3.0.Final.jar;%APP_HOME%\lib\disruptor-3.0.1.jar;%APP_HOME%\lib\junit-4.8.1.jar;%APP_HOME%\lib\fastutil-6.5.7.jar;%APP_HOME%\lib\validation-api-1.0.0.GA.jar;%APP_HOME%\lib\jboss-logging-3.1.0.CR2.jar;%APP_HOME%\lib\guava-16.0.jar;%APP_HOME%\lib\snakeyaml-1.12.jar;%APP_HOME%\lib\httpclient-4.2.5.jar;%APP_HOME%\lib\httpcore-4.2.4.jar;%APP_HOME%\lib\commons-logging-1.1.1.jar;%APP_HOME%\lib\commons-codec-1.6.jar

@rem Execute todocass
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %TODOCASS_OPTS%  -classpath "%CLASSPATH%" com.example.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable TODOCASS_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%TODOCASS_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
