#Каталог

Как запустить проект:

python -m virtualenv venv \
. venv/bin/activate \
pip install -r requirements.txt \
sudo -u postgres psql -c "create user zagibalov with encrypted password '120101ded'" \
sudo -u postgres psql -c "alter user zagibalov createdb;" \
sudo -u postgres psql -c "create database django_db with owner zagibalov;"\
sudo -u postgres psql -c "grant all privileges on database django_db to zagibalov;" \
./manage.py migrate \
./manage.py loaddata db.json \

Запуск для prod окружения:\
$ DJANGO_SETTINGS_MODULE=djangoProject.settings.production \
./manage.py runserver\

Запуск для dev окружения:\
$ DJANGO_SETTINGS_MODULE=djangoProject.settings.development \
./manage.py runserver