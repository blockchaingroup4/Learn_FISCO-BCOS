English / [中文](doc/CONTRIBUTING_CN.md)

# Contributing and Review Guidelines

All contributions are welcome! 

## Branching

Our branching method is [git-flow](https://jeffkreeftmeijer.com/git-flow/)

- **master**: Latest stable branch
- **dev**: Stable branch waiting for release(merge to master)
- **feature-xxxx**: A developing branch of a new feature named xxxx
- **bugfix-xxxx**: A branch to fix the bug named xxxx

## How to

### Issue

Go to [issues page](https://github.com/FISCO-BCOS/spring-boot-starter/issues)

### Fix bugs

1. **Fork** this repo
2. **Create** a new branch named **bugfix-xxxx** forked from your repo's **master** branch
3. **Fix** the bug
4. **Test** the fixed code
5. Make **pull request** back to this repo's **dev** branch 
6. Wait the community to review the code
7. Merged(**Bug fixed**)

### Develop a new feature

1. **Fork** this repo
2. **Create** a new branch named **feature-xxxx** forked from your repo's **dev** branch
3. **Coding** in feature-xxxx
4. **Pull** this repo's dev branch to your feature-xxxx constantly
5. **Test** your code
6. Make **pull request** back to this repo's dev branch
7. Wait the community to review the code
8. Merged !!!!

## Code formatting

The code formatting tool are described by the [google-java-format-gradle-plugin](https://github.com/sherter/google-java-format-gradle-plugin).

Execute the task `googleJavaFormat` to format all *.java files in the project
```
./gradlew goJF
```
Execute the task `verifyGoogleJavaFormat` to verify that all *.java files are formatted properly
```          
./gradlew verGJF
```

## Continous integration

**Continous integration platform**

* travis-ci: [![Build Status](https://travis-ci.org/FISCO-BCOS/spring-boot-starter.svg?branch=master)](https://travis-ci.org/FISCO-BCOS/spring-boot-starter)


**Code quality**

* CodeFactor: [![CodeFactor](https://www.codefactor.io/repository/github/fisco-bcos/spring-boot-starter/badge)](https://www.codefactor.io/repository/github/fisco-bcos/spring-boot-starter)


