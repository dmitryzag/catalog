#Каталог

Как запустить проект:

python -m virtualenv venv \
. venv/bin/activate \
pip install -r requirements.txt \
sudo -u postgres psql -c "create user zagibalov with encrypted password '120101ded'" \
sudo -u postgres psql -c "alter user zagibalov createdb;" \
sudo -u postgres psql -c "create database django_db with owner zagibalov;"\
sudo -u postgres psql -c "grant all privileges on database django_db to zagibalov;" \

psql django_db < dump_data.sql

python3 manage.py runserver
