1. PostgrSQL installieren:

    $ sudo apt-get install postgresql


2. Datebanknutzer anlegen: 

    $ sudo su postgres
    $ createuser -s $username
    $ exit

    $username sollte euer standard nutzername sein


3. DB anlegen: 
    
    $ cd ~/../recipes/
    $ createdb recipes
    $ psql -d recipes -f recipes.sql


4. RVM installieren: 

    siehe: http://rvm.io/rvm/install  (ein wenig runterscrollen für asuführliche anleitung) 


5. gems installieren:
    
    $ cd ~/../recipes/
    $ bundle install


6. DB nutzer eintragen:

    $ cd ~/../recipes/config/
    $ vim database.yml

    in Zeile 20 username auf euren DB username (siehe schritt 2) setzen


7. Rails starten: 

    $ cd ~/../recipes/
    $ rails s


8. Anschauen:

    Browser öfnen und localhost:3000 als URL eingeben


9. OPTIONAL: FSWE rezpte einlesen:

    $ psql -d recipes -f FSWE.sql

    Ich hab schon mal ein paar FSWE rezepte angelegt damit ihr auch seht wie das ein wenig gefüllt aussieht. 
    
