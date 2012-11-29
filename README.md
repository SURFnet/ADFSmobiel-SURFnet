# Introduction
Verbetering bruikbaarheid ADFS login scherm ten behoeve van Mobiele gebruikers

Dit project bevat een aanpassing op de standaard distributie van [ADFS](http://technet.microsoft.com/en-us/library/cc736690(v=ws.10).aspx) weaarmee een login pagina gemaakt kan worden welke in geoptimaliseerd voor mobile devices zoals smart phones en tablets.  Hety ontwerp is gebaseerd op het ontwerp van Stroomt welke [hier](https://wiki.surfnetlabs.nl/download/attachments/23560508/Bruikbaarheidsrichlijnen-IdPs-surfederatie-v1.2.pdf) gevonden kan worden.

Zie de handleiding over [Verbetering bruikbaarheid ADFS login scherm ten behoeve van Mobiele gebruikers](https://github.com/SURFnet/ADFSmobiel-SURFnet/blob/master/ADSF2_Mobileforms.pdf). 

# Installation
Alle ADFS2.0 form-bestanden bevinden zich onder c:/inetpub/adfs/ls. Het bestand ls.zip bevat alle benodigde bestanden om het form volgens de richtlijnen "Mobiel vriendelijker" te maken. Pak dit zip-bestand uit in de directory c:/inetpub/adfs of in een tijdelijke directory en kopieer de bestanden in de ls directory met de hand naar c:/inetpub/adfs/ls.

# Customization
web.config

Eindpunt van de aanpassingen ten opzichte van een default install is het bestaande bestand web.config in de c:/inetpub/adfs/ls directory. In dit bestand is gedefinieerd welk aspx-document gebruikt moet worden voor de form based authenticatie. Maak voor je aanpassingen gaat doen in dit bestand een kopie zodat er teruggevallen kan worden op  de originele situatie.
De regel die aangepast moet worden is als volgt te herkennen (gebruik eventueel de zoekfunctie van de editor).

    <localAuthenticationTypes>
      <add name="Forms" page="FormsSignIn.aspx" />

Om de nieuwe layout te gebruiken moet deze laatste regel aangepast worden naar:

      <add name="Forms" page="MobileForm.aspx" />

De nieuwe pagina is hierna zonder herstart van ADFS beschikbaar.


MobileForm.aspx

MobileForm.aspx bevat het formulier, dwz de gebruikersnaam veld, het wachtwoordveld en de eventuele foutmeldingen en is onderdeel van een MasterPage die in de kop van MobileForm.aspx gedefinieerd is:

<%@ Page Language="C#" MasterPageFile="~/MasterPages/MobileMasterPage.master" ...

MobileMasterPage.master

MobileMasterPage.master is een aangepaste versie van de originele MasterPage.master. Dat is te zien aan de header van deze pagina, waarin nog steeds verwezen wordt naar de originele MasterPage.master.cs CodeFile:
<%@ Master Language="C#" AutoEventWireup="true" CodeFile="MasterPage.master.cs" ...

MobileMasterPage.master bevat de basispagina (template) voor het mobiele login form, met verwijzingen naar de verschillende (mobiele) stylesheets, de viewportr en de javascript voor het activeren van het username veld in de header en wat afsluitende tips in de footer.
De regels hieronder zijn uiteindelijk verantwoordelijk voor het includeren van de form content zoals beschreven in MobileForm.aspx

<form id="MainForm" runat="server">
<asp:ContentPlaceHolder ID="ContentPlaceHolder1" runat="server">
</asp:ContentPlaceHolder>
</form>

De inhoud van deze file spreekt verder voor zich. Eventuele aanpassingen in logo en opmaak zullen hier plaatsvinden. Verdere aanpassingen van de kleuren kunnen doorgevoerd worden in de respectievelijke stylesheets zoals vermeld in de header van dit bestand.


Taalbestanden

De voorbeeldpagina bevat een loginscherm voor Engels-, Nederlands- en Duitstalige gebruikers. ADFS heeft geen mogelijkheid de taal door de gebruiker te laten kiezen, maar kijkt naar de Accept-Language header die de browser meestuurt.
Alle tekstvelden in het loginscherm zijn vervangen door variabelen en voor de aanpassingen in deze layout zijn vier nieuwe waarden toegevoegd. Deze variabelen zijn terug te vinden in de respectievelijke files in de directory App_GlobalResources en staan in de MobileResources.xx.resx bestanden. Omdat Engels default is, staan de originele Engelse teksten in de het bestand MobileResources.resx (zonder lokaliteits aanduiding 'nl' of 'de').

De vier nieuwe velden zijn:
•	WelcomeHeader: dit is de aanhef van het loginscherm
•	WelcomeText: dit is de welkomtekst onder de aanhef
•	HelpHeader: de kop voor de helptekst onder de loginvelden
•	HelpText: de helptekst onder de loginvelden

Let op: de MobileResources-bestanden moeten in UTF-8-formaat opgeslagen worden!

# Waarschuwing
De ADFS (Proxy) server is heel kritisch over welke labels en textboxen gebruikt worden en of deze ook voorkomen in de respectievelijke bestanden. Dit is de reden dat bijvoorbeeld.

<!--<asp:Label ID="PageTitleLabel" runat="server"></asp:Label>--> en
<!--<asp:Label ID="STSLabel" runat="server"></asp:Label>-->
tussen commentaartags zijn toegevoegd aan het bestand MobileMasterPage.master. Zonder deze regels stopt de form based authenticatie en wordt een foutmelding gegeven. Het is dus zaak deze te allen tijd te laten staan.

