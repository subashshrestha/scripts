# Tomcat auto-start
    # http://key2start.wordpress.com/2011/10/07/automatic-starting-tomcat-on-ubuntu/
    # description: Auto-starts tomcat
    # processname: tomcat
    # pidfile: /var/run/tomcat.pid

    export JAVA_HOME=/usr/lib/jvm/java-6-sun

    case $1 in
    start)
            sh /usr/local/tomcat/bin/startup.sh
            ;;
    stop)
            sh /usr/local/tomcat/bin/shutdown.sh
            ;;
    restart)
            sh /usr/local/tomcat/bin/shutdown.sh
            sh /usr/local/tomcat/bin/startup.sh
            ;;
    esac
    exit 0

