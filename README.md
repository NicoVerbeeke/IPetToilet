# IPetToilet

Project voor het vak Native apps II : mobile apps voor IOS(TI)
Inzending van Nico Verbeeke (TILE)

Mijn project is gebaseerd op de oefening ivm met de parkeergarages van het schooljaar 2014 - 2015

Mijn versie gaat echter gebruik maken van de dataset uit de datatank van Gent waarin informatie staat over de hondenvoorzieningen 
aanwezig in Gent.

Bij het opstarten krijgt u eerst een titelvenster, als u verdergaat krijgt u een lijst te zien van hondenvoorzieningen per type.
In de lijst zijn zowel het type als een plaatsomschrijving te zien.

Als u een hondenvoorziening kiest dan wordt u verdergebracht naar een detailvenster 
waarin alle details over een hondenvoorziening worden weergegeven.

Vanuit dit venster kan u terugkeren naar de lijst met hondenvoorzieningen.

De volgende details worden weergegeven in het detailvenster:
- soort
- plaatsomschrijving
- Gemeente + postcode
- plaats -> wordt weergegeven door een speld op een kaart

Het project bevat een NavigationController en 2 TableViews.

Eén van deze tableviews wordt gebruikt om de lijst met hondenvoorzieningen weer te geven.

De andere wordt gebruikt om een layout te verkrijgen waarin de details van een hondenvoorziening worden weergegeven.

Het project maakt gebruik van de MapKit om de kaart weer te geven in het detailvenster.

Een verdere uitbreiding zal zijn het weergeven van de afstand tussen u huidige positie en de geselecteerde hondenvoorziening.
