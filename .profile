export ORCHESTRATOR_CONFIG_URL=file:~/Dropbox/Dev/Sonar/Files/orchestrator.properties
export SONAR_IT_SOURCES=/Users/julienlancelot/Dev/Sources/it-sources
export SONAR_RUNNER_DIR=/Users/julienlancelot/Dev/Utils/sonar-scanner-2.5.1
#export SONAR_RUNNER_OPTS=-XX:MaxPermSize=128m

export ARTIFACTORY_PRIVATE_USERNAME=private-reader
export ARTIFACTORY_PRIVATE_PASSWORD=8pqY5vaTmeT6utt4

export NO_SONARQUBE=1

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

export JAVA_OPTIONS=-Djava.awt.headless=true

export GITHUB_TOKEN=68730cb6a396f9fff1bf3a4c35bf31ddd0ef0820

export M2_HOME=/opt/apache-maven
export M2=$M2_HOME/bin

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home

#export MAVEN_OPTS="-Xms128m -Xmx1024m -XX:MaxPermSize=128m -Duser.language=en -Duser.country=EN"
export MAVEN_OPTS="-Xms128m -Xmx1024m -Duser.language=en -Duser.country=EN"

#export DOTFILES=/Users/julienlancelot/Dev/Utils/dotfiles
export GIT_PUSH=/Users/julienlancelot/Dev/Sources/sonar-developer-toolset/git

export PATH=/usr/local/bin:$PATH:$SONAR_RUNNER_DIR/bin:$JAVA_HOME/bin:$M2:$DOTFILES/bin:$GIT_PUSH:/Users/julienlancelot/Dev/Utils/apache-ant-1.9.4/bin:/Library/PostgreSQL/9.5/bin


alias ll='ls -l'
alias la='ls -lA'
alias l='ls -F'
#alias ls='ls'
#alias grep='grep –color=auto'

alias cdSonar='cd /Users/julienlancelot/Dev/Sources/sonarqube'
alias cdSonarSandbox='cd /Users/julienlancelot/Dropbox/Dev/Sonar/Sandbox'

alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

alias gitInstall='git pull --rebase && mvn clean install -DskipTests=true'
alias gitMergeBranch='git merge origin/branch-5.1 --no-ff -s recursive -Xrename-threshold=100 -Xpatience'
alias mvnCoverage='mvn clean org.jacoco:jacoco-maven-plugin:prepare-agent install -B -e -V -Pcoverage-per-test'
alias mvnCoverageFix='mvn clean org.jacoco:jacoco-maven-plugin:0.7.4.201502262128:prepare-agent install -B -e -V -Pcoverage-per-testmvn sonar'

alias mvnci='mvn clean install -B -e -V -T0.5C -DforkCount=0.5C -Pdev'
alias mvnjqb='mvn install -B -e -V -T0.5C -DforkCount=0.5C -DskipTests=true -Dmaven.test.skip=true -Dsource.skip=true -Denforcer.skip=true -Pdev -pl \!:sonar-web'
alias mvnqb='mvn clean install -B -e -V -T0.5C -DforkCount=0.5C -DskipTests=true -Dmaven.test.skip=true -Dsource.skip=true -Denforcer.skip=true -Pdev'
alias mvnweb='mvn clean install -B -e -V -T0.5C -DforkCount=0.5C -DskipTests=true -Dmaven.test.skip=true -Dsource.skip=true -Denforcer.skip=true -Pdev -pl :sonar-web -amd'
alias mvnserver='mvn clean install -B -e -V -T0.5C -DforkCount=0.5C -DskipTests=true -Dmaven.test.skip=true -Dsource.skip=true -Denforcer.skip=true -Pdev -pl :server -amd'
alias mvnsserver='mvn clean install -B -e -V -T0.5C -DforkCount=0.5C -DskipTests=true -Dmaven.test.skip=true -Dsource.skip=true -Denforcer.skip=true -Pdev -pl :sonar-server -amd'
alias mvnfullsserver='mvn clean install -B -e -V -T0.5C -DforkCount=0.5C -Denforcer.skip=true -Pdev -pl :sonar-server -amd'

alias cpGov='cp ~/.m2/repository/com/sonarsource/governance/sonar-governance-plugin/1.1-SNAPSHOT/sonar-governance-plugin-1.1-SNAPSHOT.jar ~/Dev/Utils/sonarqube-5.6/extensions/downloads/'

alias lowestVol='osascript -e "set Volume 0.01"'


#### GIT ##### 

source /Users/julienlancelot/Dev/Utils/liquidprompt/liquidprompt

# Git bach completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u@mbp \w$(__git_ps1)]\$ '


# For Docker
#eval "$(docker-machine env default)"


# curl -u admin:admin -F report=@/users/julienlancelot/Dev/temp/clang-report.zip http://localhost:9000/api/ce/submit\?projectKey\=clang
# 

rebaseToMaster() {
	git checkout master && git pull && git checkout $1 && git rebase master
    
}
alias rebase=rebaseToMaster

rebaseInteractifToMaster() {
	git checkout master && git pull && git checkout $1 && git rebase -i master
    
}
alias rebaseI=rebaseInteractifToMaster

