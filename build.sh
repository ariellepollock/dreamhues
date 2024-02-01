pip3 install -r requirements.txt

python3 manage.py collectstatic --no-input
python3 manage.py migrate

pip3 install django
