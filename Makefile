bootstrap_development:
	$(MAKE) capture_staging_db
	$(MAKE) download_staging_db
	$(MAKE) clone_downloaded_db_to_development

capture_staging_db:
	heroku pg:backups capture -a red-docente-staging

download_staging_db:
	curl -o tmp/latest.dump `heroku pg:backups public-url -a red-docente-staging`

clone_downloaded_db_to_development:
	heroku local:run bin/rails db:environment:set RAILS_ENV=development
	heroku local:run bin/rails db:drop db:create
	! pg_restore --verbose --clean --no-acl --no-owner -h localhost -d red_docente_development tmp/latest.dump
	heroku local:run bin/rails db:migrate
