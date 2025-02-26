
# Makefile for managing the Helm chart
CHART_NAME=redis-cluster
NAMESPACE=redis-ns

.PHONY: install uninstall upgrade test lint package clean

# Install the Helm chart
install:
	helm install $(CHART_NAME) .

# Uninstall the Helm chart
uninstall:
	helm uninstall $(CHART_NAME) --namespace $(NAMESPACE)

# Upgrade the Helm chart
upgrade:
	helm upgrade $(CHART_NAME) .

# Run tests (if defined in the chart)
test:
	helm test $(CHART_NAME) --namespace $(NAMESPACE)

# Lint the Helm chart
lint:
	helm lint .

# Package the Helm chart
package:
	helm package .

# Clean up generated files
clean:
	rm -rf *.tgz
