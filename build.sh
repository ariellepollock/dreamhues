pip3 install -r requirements.txt

python3 manage.py collectstatic --no-input
python3 manage.py migrate

pip3 install django

pip3 install gunicorn

pip3 install dj-database-url

pip3 install environ