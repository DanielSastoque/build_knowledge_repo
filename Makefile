info:
	@echo Select a choice

regenerate_db:
	PGPASSWORD=postgres psql -h localhost -U postgres -d postgres -p 5433 --file sql/regenerate_db.sql

fix_post_issue:
	PGPASSWORD=postgres psql -h localhost -U postgres -d postgres -p 5433 --file sql/fix_post_issue.sql

docker_image:
	docker build -f Dockerfile -t knowledge_repo .

docker_container:
	docker run -d --name knowledge_repo -p 7001:7001 knowledge_repo

all: docker_image docker_container fix_post_issue

clean: regenerate_db
	docker rm --force knowledge_repo
	docker image rm knowledge_repo
