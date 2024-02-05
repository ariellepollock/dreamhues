pip3 install --upgrade pip3
pip3 install --force-reinstall -U setuptools

pip3 install boto3
pip3 install django
pip3 install django-environ
pip3 install dj-database-url
pip3 install gunicorn
pip3 install psycopg2
pip3 install python-dotenv
pip3 install requests
pip3 install whitenoise
pip3 install -r requirements.txt

python3 manage.py collectstatic --no-input
python3 manage.py migrate