.PHONY: docs sdk-generate docs-dev

# Generate API docs and run the docs server
docs: sdk-generate docs-dev

# Generate API documentation
sdk-generate:
	@echo "Generating API documentation..."
	python generators/generate_api_docs.py --source ./python/composio --output ./fern/sdk
	bun run typedoc --plugin typedoc-plugin-markdown js/src/index.ts js/src/sdk/index.ts --out ./fern/sdk/composio/js --skipErrorChecking

# Run the docs development server (with generation)
docs-dev: sdk-generate
	@echo "Starting documentation server..."
	fern docs dev

# Help target
help:
	@echo "Available targets:"
	@echo "  docs          - Generate API docs and run the docs server"
	@echo "  sdk-generate  - Generate API documentation only"
	@echo "  docs-dev      - Generate docs and run the docs server" 