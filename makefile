LOGS_DIR = ./logs
TESTS_DIR = robot/tests/

TAGS ?= regressivo
APP_FILE ?=

.PHONY: run-local-android run-local-ios run-bs-android run-bs-ios upload-bs-android upload-bs-ios run-parallel-bs run-parallel-local

run-local-android:
	robot -v PLATFORM_NAME:android \
	      -v ENVIRONMENT:local \
	      -d $(LOGS_DIR) \
	      -i $(TAGS) \
	      $(TESTS_DIR)

run-local-ios:
	robot -v PLATFORM_NAME:ios \
	      -v ENVIRONMENT:local \
	      -d $(LOGS_DIR) \
	      -i $(TAGS) \
	      $(TESTS_DIR)

run-bs-android:
	robot -v PLATFORM_NAME:android \
	      -v ENVIRONMENT:bs \
	      -d $(LOGS_DIR) \
	      -i $(TAGS) \
	      $(TESTS_DIR)

run-bs-ios:
	robot -v PLATFORM_NAME:ios \
	      -v ENVIRONMENT:bs \
	      -d $(LOGS_DIR) \
	      -i $(TAGS) \
	      $(TESTS_DIR)

# Paralelo Android + iOS (Windows: use o python abaixo se não tiver make)
run-parallel-bs:
	python scripts/run_parallel_platforms.py --env bs --include $(TAGS) --suite $(TESTS_DIR)

run-parallel-local:
	python scripts/run_parallel_platforms.py --env local --include $(TAGS) --suite $(TESTS_DIR)

# Ex.: make upload-bs-android APP_FILE=./app/app-cert-release.apk
# Windows: use python scripts/bs_upload_app.py (nao use python -m ...)
upload-bs-android:
	python scripts/bs_upload_app.py --file "$(APP_FILE)" --platform android --update-env

# Ex.: make upload-bs-ios APP_FILE=./app/Runner.ipa
upload-bs-ios:
	python scripts/bs_upload_app.py --file "$(APP_FILE)" --platform ios --update-env
