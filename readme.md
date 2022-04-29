#Каталог

python -m virtualenv venv \
. venv/bin/activate \
pip install -r requirements.txt \
sudo -u postgres psql -c "create user zagibalov;" \
sudo -u postgres psql -c "alter user zagibalov createdb;" \
sudo -u postgres psql -c "create database django_db with owner zagibalov;"\
python3 manage.py runserver




