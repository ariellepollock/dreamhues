pip3 install -r requirements.txt

python3 manage.py collectstatic --no-input
python3 manage.py migrate

pip3 install django

pip3 install gunicorn

pip3 install dj-database-url

pip3 install django-environ

pip3 install psycopg2-binary

pip3 install whitenoise

pip3 install boto3