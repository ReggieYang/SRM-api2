node {
    stage('scm'){
        git 'https://github.com/ReggieYang/Demo2.git'
    }

    stage('qa') {
        sh 'sonar-scanner'
    }

    stage('build') {
        def mvnHome = tool 'Maven3'
        sh "${mvnHome}/bin/mvn clean scala:compile compile package"
    }

    stage('deploy') {
        sh 'docker stop my || true'
        sh 'docker rm my || true'
        sh 'docker run --name my -p 11111:8080 -d tomcat'
        sh 'docker cp target/SRM2.war my:/usr/local/tomcat/webapps'
    }

}
