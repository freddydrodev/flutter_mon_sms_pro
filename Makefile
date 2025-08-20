.PHONY: help hive-update hive-build hive-watch hive-clean

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

hive-update: ## Update Hive registrar files automatically
	@echo "🔄 Updating Hive registrar files..."
	dart scripts/update_hive_registrar.dart

hive-build: ## Build Hive adapters
	@echo "🔨 Building Hive adapters..."
	flutter pub run build_runner build --delete-conflicting-outputs --build-filter="lib/models/**

hive-watch: ## Watch for changes and rebuild Hive adapters
	@echo "👀 Watching for changes..."
	flutter pub run build_runner watch --delete-conflicting-outputs --build-filter="lib/models/**"

hive-clean: ## Clean build cache
	@echo "🧹 Cleaning build cache..."
	flutter pub run build_runner clean

hive-full: hive-update hive-build ## Update and build Hive adapters

dev: hive-watch ## Start development mode with Hive watching
