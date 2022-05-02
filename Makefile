Region ?= us-east-1

deploy:
	@echo Creando la infraestructura para el sitio web estatico ...
	aws cloudformation deploy \
		--template-file static-website.yaml \
		--stack-name utilapis-static-website-${Region}-cfn \
		--region ${Region}

	aws cloudformation describe-stacks \
		--stack-name utilapis-static-website-${Region}-cfn \
		--region ${Region} \
		--query 'Stacks[*].Outputs[*]'

subir:
	@echo Subiendo el sitio web estatico ...
	aws s3 sync . s3://utilapis.com --acl public-read

invalidar:
	@echo Invalidando la cache de CloudFront ...
	aws cloudfront create-invalidation \
		--distribution-id E3KZZREI7UR27R \
		--paths /index.html /styles.css '/images/*'

eliminar:
	@echo Borrando la infraestructura para el sitio web estatico ...
	@echo Asegurarse de que no hay ningún objeto en el bucket ...
	aws cloudformation delete-stack \
		--region ${Region} \
		--stack-name utilapis-static-website-${Region}-cfn
