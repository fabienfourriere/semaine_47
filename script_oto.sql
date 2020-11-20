CREATE DATABASE Oto;

USE Oto;

CREATE TABLE Client(
   num_client INT,
   nom_client VARCHAR(50) NOT NULL,
   prenom_client VARCHAR(50),
   adresse_client VARCHAR(200),
   PRIMARY KEY(num_client)
);

CREATE TABLE Service(
   num_service INT,
   nom_service VARCHAR(50),
   vente_service BOOLEAN NOT NULL,
   PRIMARY KEY(num_service)
);

CREATE TABLE Salarie(
   num_salarie INT,
   nom_salarie VARCHAR(50),
   prenom_salarie VARCHAR(50),
   PRIMARY KEY(num_salarie)
);

CREATE TABLE Accessoire(
   num_accessoire INT,
   nom_accessoire VARCHAR(50),
   vente_accessoire BOOLEAN NOT NULL,
   PRIMARY KEY(num_accessoire)
);

CREATE TABLE Marque(
   num_marque INT,
   nom_marque VARCHAR(50),
   PRIMARY KEY(num_marque)
);

CREATE TABLE Modele(
   num_modele INT,
   nom_modele VARCHAR(50),
   mod_num_marque INT NOT NULL,
   PRIMARY KEY(num_modele),
   KEY(mod_num_marque)
);

CREATE TABLE Commande(
   num_commande INT,
   date_commande DATE NOT NULL,
   com_num_salarie INT NOT NULL,
   com_num_client INT NOT NULL,
   PRIMARY KEY(num_commande),
   KEY (com_num_client),
   KEY (com_num_salarie)
);

CREATE TABLE Vehicule(
   num_vehicule INT,
   nom_vehicule VARCHAR(50),
   vente_vehicule BOOLEAN NOT NULL,
   veh_num_modele INT NOT NULL,
   PRIMARY KEY(num_vehicule),
   KEY(veh_num_modele)
);

CREATE TABLE LigneDeCommande(
   li_num_commande INT,
   qte INT,
   li_num_accessoire INT,
   li_num_service INT,
   li_num_vehicule INT,
   li_com_num_commande INT NOT NULL,
   PRIMARY KEY(li_num_commande),
   KEY(li_num_accessoire),
   KEY(li_num_service),
   KEY(li_num_vehicule),
   KEY(li_com_num_commande)
);

ALTER TABLE Modele
 ADD CONSTRAINT fk_mod_num_marque FOREIGN KEY (mod_num_marque) REFERENCES Marque(num_marque);

ALTER TABLE Commande
 ADD CONSTRAINT fk_com_num_client FOREIGN KEY (com_num_client) REFERENCES Client(num_client),
 ADD CONSTRAINT fk_com_num_salarie FOREIGN KEY (com_num_salarie) REFERENCES Salarie(num_salarie);

ALTER TABLE Vehicule
 ADD CONSTRAINT fk_veh_num_modele FOREIGN KEY (veh_num_modele) REFERENCES Modele(num_modele);

ALTER TABLE LigneDeCommande
 ADD CONSTRAINT fk_li_num_accessoire FOREIGN KEY (li_num_accessoire) REFERENCES Accessoire(num_accessoire),
 ADD CONSTRAINT fk_li_num_service FOREIGN KEY (li_num_service) REFERENCES Service(num_service),
 ADD CONSTRAINT fk_li_num_vehicule FOREIGN KEY (li_num_vehicule) REFERENCES Vehicule(num_vehicule),
 ADD CONSTRAINT fk_li_com_num_commande FOREIGN KEY (li_com_num_commande) REFERENCES Commande(num_commande);


