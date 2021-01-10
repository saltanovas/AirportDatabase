#!/bin/sh
export CLASSPATH=$CLASSPATH:/usr/share/java/postgresql-42.2.5.jar
javac Main.java
javac Connect.java
javac ConsoleUtils.java
javac MyMenu.java
javac MenuController.java
javac MenuItem.java
javac Query.java
javac Statements.java
javac Menu.java
javac Repository.java
java Main
