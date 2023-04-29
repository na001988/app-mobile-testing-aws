#!/usr/bin/env bash
echo "Check if hub is ready"

java -cp selenium-test.jar:selenium-test-tests.jar:libs/* org.testng.TestNG testng.xml