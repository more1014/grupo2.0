
-- tabla authority
create table proyecto01.authority(
	name varchar(40) primary key
);

insert into proyecto01.authority values ('carlos_lopez')
insert into proyecto01.authority  values ('lucas_sedano')
insert into proyecto01.authority  values ('juan_more')
insert into proyecto01.authority values ('andre_carrillo')
insert into proyecto01.authority  values ('andrey_cardenas')
select * from  proyecto01.authority

--tabla login_
create table proyecto01.login_(
	id int4 primary key,
	password_ varchar(60)not null,
	email varchar(250)not null,
	marca varchar(40)not null,
	color varchar(40)not null,
	placa int not null,
	constraint login unique (id,password_,placa,email)

);

insert into proyecto01.login_ values (01,'crlop','carlopez@gmail_com','hyundai','negro',5164)
insert into  proyecto01.login_ values (02,'luca02','luka001@gmail_com','chevrolet','rojo',9654)
insert into  proyecto01.login_ values (03,'jmore42','jumo42@gmail_com','pulsar','blanca',3214)
insert into  proyecto01.login_ values (04,'carrian85','carrillo09@gmail_com','pulsar','azul',2013)
insert into proyecto01.login_ values (05,'andry856','andrey20@gmail_com','akt','morado',4562)

select * from  proyecto01.login_


-- tabla user authority
create table proyecto01.user_authority(
	name_rol varchar(50),
	id_login_ int4,
	constraint fk_aut_user foreign key (name_rol) references proyecto01.authority (name),
	constraint fk_sys_user foreign key (id_login_) references proyecto01.login_ (id),
	constraint pk_user primary key (name_rol,id_login_)
);

insert into proyecto01.user_authority values ('carlos_lopez', 01)
insert into proyecto01.user_authority values ('lucas_sedano', 02)
insert into proyecto01.user_authority values ('juan_more', 03)
insert into proyecto01.user_authority values ('andre_carrillo', 04)
insert into proyecto01.user_authority values ('andrey_cardenas', 05)

select * from proyecto01.user_authority  

-- tabla document type
create table proyecto01.document_type(
	id int4 primary key,
	sigla varchar(10)not null,
	document_name varchar(100)not null,
	condition varchar(40)not null,
	constraint uk_document_type unique (sigla,document_name)
);

insert into proyecto01.document_type values (01,'cc','cedula_ciudadania','activo')
insert into proyecto01.document_type values (02,'ce','cedula_extrangeria','activo')
insert into  proyecto01.document_type values (03,'pas','pasaporte','activo ')
insert into  proyecto01.document_type values (04,'pep','permiso_permanencia','activo')
insert into proyecto01.document_type values (05,'ti','terjeta_identidad','activo')

select * from proyecto01.document_type

-- tabla cliente
create table proyecto01.client(
	id int4 primary key,
	id_document_type int4 not null,
	document_number int4 not null,   
	first_name varchar(40)not null,
	second_name varchar(40),
	first_last_name varchar(40)not null,
	second_last_name varchar(40),	
	id_login_ int not null,
	constraint fk_sys_cli foreign key (id_login_) references proyecto01.login_ (id),
	constraint fk_typ_cli foreign key (id_document_type) references proyecto01.document_type (id),
	constraint uk_cliente unique (id_document_type,document_number,id_login_)
);

insert into proyecto01.client values (01,01,78362,'carlos',null,'lopez',null,01)
insert into proyecto01.client values (02,02,12909,'lucas',null,'sedano',null,02)
insert into proyecto01.client values (03,03,78935,'juan',null,'more',null,03)
insert into proyecto01.client values (04,04,66946,'andre',null,'carrillo',null,04)
insert into proyecto01.client values (05,05,98535,'andrey',null,'cardenas',null,05)

select * from proyecto01.client


6
create table proyecto01.log_error_(
	id int4 primary key,
	log_name varchar(400)not null,
	message varchar(400)not null,
	fecha date not null,
	id_client int4 not null,
	constraint fk_clie_log_erro foreign key (id_client) references proyecto01.client (id)
);
insert into proyecto01.log_error_ values (01,'carlos','error','23/03/2021',01)
insert into proyecto01.log_error_ values (02,'juan','error','25/06/2021',02)
insert into proyecto01.log_error_ values (03,'andrey','error','01/01/2021',03)
insert into proyecto01.log_error_ values (04,'nicolas','error','04/10/2021',04)
insert into proyecto01.log_error_ values (05,'lucas','error','09/07/2021',05)

select * from proyecto01.log_error_

create table proyecto01.log_audit(
	id int4 primary key,
	log_name varchar(400)not null,
	message varchar(400)not null,
	fecha date not null,
	id_client int4 not null,
	constraint fk_clie_log_audi foreign key (id_client) references proyecto01.client (id)
);
insert into proyecto01.log_audit values (01,'carlos','audit','03/03/2021',01)
insert into proyecto01.log_audit values (02,'lucas','audit','09/06/2021',02)
insert into proyecto01.log_audit values (03,'juan','audit','01/08/2021',03)
insert into proyecto01.log_audit values (04,'andre','audit','08/10/2021',04)
insert into proyecto01.log_audit values (05,'andrey','audit','10/01/2021',05)

select * from proyecto01.log_audit
8
create table proyecto01.service_type(
	id int4 primary key,
	visitante int4 not null,
	emoleado int4 not null,
	proveedor  int4 not null
);

insert into proyecto01.service_type values (01,01,01,33245)
insert into proyecto01.service_type values (02,12,02,07845)
insert into proyecto01.service_type values (03,04,03,85215)
insert into proyecto01.service_type values (04,11,04,38163)
insert into proyecto01.service_type values (05,14,05,10394)

select * from proyecto01.service_type

9
create table proyecto01.vehicle_type(
	id int4 primary key ,
	id_service_type int4 not null,
	vehicle_person varchar(40) not null,
	placas  int  not null,
	color varchar(20),
	marca varchar(40),
	carta_propiedad int4 not null,
	constraint fk_ser_vety foreign key (id_service_type) references proyecto01.service_type (id),
	constraint uk_vehicle_type unique (id_service_type,vehicle_person,carta_propiedad)
);

insert into proyecto01.vehicle_type values (01,01,'carro',5164,'negro','hyundai',990987543)
insert into proyecto01.vehicle_type values (02,02,'carro',9654,'rojo','chevrolet',234871920)
insert into proyecto01.vehicle_type values (03,03,'moto',3214,'blanco','pulsar',10093621)
insert into proyecto01.vehicle_type values (04,04,'moto',2013,'azul','pulsar',10098662)
insert into proyecto01.vehicle_type values (05,05,'moto ',4562,'morado','akt',1927666212)

select * from proyecto01.vehicle_type


10
create table proyecto01.person(
	id int4 primary key,
	id_service_type int4 not null,
	id_vehicle_type int4 not null,
	name_person varchar(40) not null,
	id_client int4 not null,
	vehicle_type varchar(10)not null,
	property_card int4 not null,
	constraint fk_ser_per foreign key (id_service_type) references proyecto01.service_type (id),
	constraint fk_vety_per foreign key (id_vehicle_type) references proyecto01.vehicle_type (id),
	constraint fk_cli_per foreign key (id_client) references proyecto01.client (id),
	constraint uk_person unique (id_service_type,id_client,property_card,id_vehicle_type)
);
insert into proyecto01.person values (01,01,01,'carlos',01,'sedan',134596049)
insert into proyecto01.person values (02,02,02,'lucas',02,'coupe',28840602)
insert into proyecto01.person values (03,03,03,'juan',03,'enduro',29940500)
insert into proyecto01.person values (04,04,04,'andre',04,'pista',1234500099)
insert into proyecto01.person values (05,05,05,'andrey',05,'nkd',283945222)

select * from proyecto01.person



11
create table proyecto01.parking(
	id int4 primary key,
	place_visitant varchar (40),
	place_employee varchar (40),
	place_supplier varchar (40),
	id_person int4 not null,
	unique_parking varchar(10) ,
	constraint fk_per_par foreign key (id_person) references proyecto01.person (id),
	constraint uk_parking unique (unique_parking)
);

insert into proyecto01.parking values (01,'segun_piso',null,null,01,null)
insert into proyecto01.parking values (02,null,'segundo_piso',null,02,null)
insert into proyecto01.parking values (03,null,null,'sotano',03,null)
insert into proyecto01.parking values (04,null,null,'primer_piso',04,null)
insert into proyecto01.parking values (05,'segundo_piso',null,null,05,null)

select * from proyecto01.parking


12
create table proyecto01.turn(
	id int4 primary key,
	turn varchar (10) not null,
	constraint uk_turn unique (id)
);

insert into proyecto01.turn values (01,'morning')
insert into proyecto01.turn values (02,'afternoon')
insert into proyecto01.turn values (03,'night')
insert into proyecto01.turn values (04,'morning')
insert into proyecto01.turn values (05,'afternoon')

select * from proyecto01.turn

13
create table proyecto01.register_input_and_output(
	id int4 primary key,
	id_turn int4 not null,
	condition varchar(40)not null,
	start_time varchar(10) not null,
	end_time varchar(10) not null,
	day date not null,
	id_parking int4 not null,
	constraint fki_par_reino foreign key (id_parking) references proyecto01.parking (id),
	constraint fk_turn_reino foreign key (id_turn) references proyecto01.turn (id),
	constraint uk_regis unique (id_parking,start_time,end_time,condition)
);	

insert into proyecto01.register_input_and_output values (01,03,'buen estado','4:00pm','6:00pm','02/05/2021',01)
insert into proyecto01.register_input_and_output values (02,05,'buen estado','2:00am','1:00pm','13/07/2021',03)
insert into proyecto01.register_input_and_output values (03,04,'con rallones','10:00am','12:00pm','10/09/2021',05)
insert into proyecto01.register_input_and_output values (04,02,'sin un espejo','4:00pm','8:00pm','07/10/2021',04)
insert into proyecto01.register_input_and_output values (05,01,'buen estado','3:00am','11:00pm','01/12/2021',02)

select * from proyecto01.register_input_and_output

14
create table proyecto01.person_type(
	id int4 primary key,
	id_client int4 not null,
	id_service_type int4 not null,
	id_register_input_and_output int4 not null,
	constraint fk_cli_pety foreign key (id_client) references proyecto01.client (id),
	constraint fk_sety_pety foreign key (id_service_type) references proyecto01.service_type (id),
	constraint fk_reino_pety foreign key (id_register_input_and_output) references proyecto01.register_input_and_output (id),
	constraint uk_pety unique (id_client,id_service_type,id_register_input_and_output)
);


insert into proyecto01.person_type values (01,01,01,01)
insert into proyecto01.person_type values (02,02,02,02)
insert into proyecto01.person_type values (03,03,03,03)
insert into proyecto01.person_type values (04,04,04,04)
insert into proyecto01.person_type values (05,05,05,05)

select * from proyecto01.person_type 


select email,password_,placa,document_number from proyecto01.login_ inner join proyecto01.client on  proyecto01.login_. id=proyecto01.client. id_login_ 
select document_number,first_name,fecha,message from proyecto01.client inner join proyecto01.log_audit on proyecto01.client. id=proyecto01.log_audit. id_client
select marca,carta_propiedad,placas,name_person from proyecto01.vehicle_type inner join  proyecto01.person on proyecto01.vehicle_type. id=proyecto01.person. id_vehicle_type
select condition,start_time,end_time,id_service_type from proyecto01.register_input_and_output inner join proyecto01.person_type on proyecto01.register_input_and_output. id=proyecto01.person_type . id_register_input_and_output
select proveedor,visitante,id_register_input_and_output from proyecto01.service_type inner join  proyecto01.person_type on proyecto01.service_type . id= proyecto01.person_type. id_service_type
select first_name,document_number,id_service_type,id_register_input_and_output from proyecto01.client inner join proyecto01.person_type on proyecto01.client . id=proyecto01.person_type . id_client 
select turn,start_time,end_time from proyecto01.turn inner join proyecto01.register_input_and_output on proyecto01.turn . id= proyecto01.register_input_and_output . id_turn
select vehicle_person,color,marca,property_card,name_person from proyecto01.vehicle_type inner join proyecto01.person on proyecto01.vehicle_type. id=proyecto01.person . id_vehicle_type
select second_last_name,document_number,message ,log_name from proyecto01.client inner join proyecto01.log_error_ on proyecto01.client . id=  proyecto01.log_error_ . id_client
select document_number,message,fecha,log_name from proyecto01.client inner join proyecto01.log_audit on proyecto01.client . id=proyecto01.log_audit . id_client



