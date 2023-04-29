echo "Start java app"

java -cp selenium-test.jar:selenium-test-tests.jar:libs/* org.testng.TestNG testng.xml
