@echo off
echo Downloading MySQL Connector for BaloShop project...
echo.

set LIB_DIR=web\WEB-INF\lib

echo Creating lib directory...
if not exist "%LIB_DIR%" mkdir "%LIB_DIR%"

echo.
echo Trying to download MySQL Connector from alternative sources...

echo Method 1: Trying Maven Central...
curl -L -o "%LIB_DIR%\mysql-connector-java-8.0.33.jar" "https://search.maven.org/remotecontent?filepath=mysql/mysql-connector-java/8.0.33/mysql-connector-java-8.0.33.jar"

if not exist "%LIB_DIR%\mysql-connector-java-8.0.33.jar" (
    echo Method 1 failed. Trying Method 2...
    curl -L -o "%LIB_DIR%\mysql-connector-java-8.0.33.jar" "https://central.sonatype.com/artifact/mysql/mysql-connector-java/8.0.33/versions"
)

echo.
if exist "%LIB_DIR%\mysql-connector-java-8.0.33.jar" (
    echo Download completed successfully!
    echo MySQL Connector saved to: %LIB_DIR%\mysql-connector-java-8.0.33.jar
) else (
    echo Download failed. Please download manually from:
    echo https://dev.mysql.com/downloads/connector/j/
    echo.
    echo 1. Select "Platform Independent"
    echo 2. Download ZIP file
    echo 3. Extract mysql-connector-java-8.x.x.jar
    echo 4. Copy to: %LIB_DIR%\
)

echo.
echo Next steps:
echo 1. Open project in NetBeans
echo 2. Clean and Build project
echo 3. Run project
echo.
pause
