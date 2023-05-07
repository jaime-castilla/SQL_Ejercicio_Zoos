create sequence seq_zoos start 100;
create table zoos(
id_zoo serial,
nombre varchar(60) not null,
ciudad varchar(60) not null,
pais varchar(60) not null,
tamaño integer,
presupuesto_anual integer,
constraint pk_zoos primary key (id_zoo)
);


create sequence seq_especie start 100;
create table especie(
id_especie serial,
nombre_cientifico varchar(60) not null,
nombre_vulgar varchar(60) not null,
familia varchar(60) not null,
peligro_extincion boolean,
constraint pk_especie primary key (id_especie)
);


create sequence seq_animales start 100;
create table animales(
id_num_identificacion serial,
id_especie serial,
id_zoo serial,
sexo varchar(60) not null,
ano_nacimiento integer not null,
pais_origen varchar(60) not null,
continente varchar(60) not null,
constraint pk_animales primary key (id_num_identificacion),
constraint fk_animales_zoos foreign key (id_zoo)
	references zoos(id_zoo),
constraint fk_animales_especie foreign key (id_especie)
	references especie(id_especie)
	on update cascade on delete cascade
);