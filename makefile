LOGS_DIR = ./logs
TESTS_DIR = robot/tests/

TAGS = regressivo

.PHONY: run-local-android run-local-ios

run-local-android:
	robot -v PLATFORM_NAME:android \
	      -v ENVIRONMENT:local \
	      -d $(LOG_DIR) \
	      -i ${TAGS} \
	      $(TESTS_DIR)

run-local-ios:
	robot -v PLATFORM_NAME:ios \
	      -v ENVIRONMENT:local \
	      -d $(LOG_DIR) \
	      -i ${TAGS} \
	      $(TESTS_DIR)

run-bs-android:
	robot -v PLATFORM_NAME:android \
	      -v ENVIRONMENT:bs \
	      -d $(LOG_DIR) \
	      -i ${TAGS} \
	      $(TESTS_DIR)

run-bs-ios:
	robot -v PLATFORM_NAME:ios \
	      -v ENVIRONMENT:bs \
	      -d $(LOG_DIR) \
	      -i ${TAGS} \
	      $(TESTS_DIR)
