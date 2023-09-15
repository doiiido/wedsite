install:
	@pip install -r requirements.txt
	@make create-key
	@make migrate
create-key:
	$(shell echo "DJANGO_SECRET_KEY='$(shell python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())')'" >> .env)
run:
#	Remembert to run:
#	echo "DEBUG=True" >> .env
#	for HTTP only environment
	@python manage.py runserver

shell:
	@python manage.py shell

#deploy-stage:
#	@git push stage master
#	@heroku run python manage.py migrate --remote stage

#deploy-prod:
#	@git push prod master
#	@heroku run python manage.py migrate --remote prod

#deploy-full:
#	@git push stage master
#	@heroku run python manage.py migrate --remote stage
#	@git push prod master
#	@heroku run python manage.py migrate --remote prod
#	@python manage.py runserver

migrate:
	@python manage.py makemigrations
	@python manage.py migrate