first-deploy: build-deploy build-deploy

build-deploy: build deploy

deploy: check-env
	terraform -chdir=terraform init; \
	terraform -chdir=terraform apply -auto-approve

	webapp_access_key=$$(terraform -chdir=terraform output --raw webapp_access_key); \
	webapp_storage_account_name=$$(terraform -chdir=terraform output --raw webapp_storage_account_name); \
	az storage blob upload-batch --overwrite --account-name $$webapp_storage_account_name -s webapp/build/ -d '$$web' --account-key $$webapp_access_key

	webapp_endpoint=$$(terraform -chdir=terraform output --raw webapp_endpoint); \
	echo "Browse to $$webapp_endpoint"

build: build-functions build-webapp

build-functions:
	cd functions && npm i && func pack --javascript

build-webapp:
	api_url=$$(terraform -chdir=terraform output -raw api_url); \
	cd webapp; \
	npm install; \
	REACT_APP_API_URL=$$api_url npm run build

check-env:
	@for var in terraform az func npm; do \
		if ! command -v $$var &> /dev/null; then \
			echo "$$var could not be found"; \
			exit 1; \
		fi; \
	done

destroy:
	terraform -chdir=terraform init; \
	terraform -chdir=terraform destroy -auto-approve
