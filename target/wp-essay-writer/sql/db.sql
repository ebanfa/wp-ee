DROP TABLE IF EXISTS dispute;
DROP TABLE IF EXISTS disputestatus;
DROP TABLE IF EXISTS disputetype;
DROP TABLE IF EXISTS accounttransaction;
DROP TABLE IF EXISTS accounttransactionstatus;
DROP TABLE IF EXISTS accounttransactiontype;
DROP TABLE IF EXISTS contentorderfile;
DROP TABLE IF EXISTS contentorder;
DROP TABLE IF EXISTS paymentstatus;
DROP TABLE IF EXISTS contentorderstatus;
DROP TABLE IF EXISTS contentordertype;
DROP TABLE IF EXISTS contentclassification;
DROP TABLE IF EXISTS contentfile;
DROP TABLE IF EXISTS content;
DROP TABLE IF EXISTS contenttype;
DROP TABLE IF EXISTS contentcategory;
DROP TABLE IF EXISTS classification;
DROP TABLE IF EXISTS classificationtype;
DROP TABLE IF EXISTS partyreview;
DROP TABLE IF EXISTS partysubject;
DROP TABLE IF EXISTS partyeducation;
DROP TABLE IF EXISTS writingstyle;
DROP TABLE IF EXISTS subject;
DROP TABLE IF EXISTS subjectareaimage;
DROP TABLE IF EXISTS subjectarea;
DROP TABLE IF EXISTS urgency;
DROP TABLE IF EXISTS noofpages;
DROP TABLE IF EXISTS documenttype;
DROP TABLE IF EXISTS academiclevel;
DROP TABLE IF EXISTS qualificationtype;
DROP TABLE IF EXISTS contactrequest;
DROP TABLE IF EXISTS socialmediaaccount;
DROP TABLE IF EXISTS socialmediaaccounttype;
DROP TABLE IF EXISTS partyfile;
DROP TABLE IF EXISTS partyimage;
DROP TABLE IF EXISTS billingaccount;
DROP TABLE IF EXISTS partyprofile;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS partygroup;
DROP TABLE IF EXISTS partyrole;
DROP TABLE IF EXISTS party;
DROP TABLE IF EXISTS roletype;
DROP TABLE IF EXISTS partytype;
DROP TABLE IF EXISTS partycategory;
DROP TABLE IF EXISTS business;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS currency;


CREATE TABLE currency  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
	symbol   		varchar(70) NOT NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE country  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE business  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
   	currency   int(11) NOT NULL,
	user_name   		varchar(70) NOT NULL,
	name   		varchar(70) NOT NULL,
	pin   		INT(6) NOT NULL,
	tel_no   		varchar(70) NOT NULL,
	account_notify_email   		varchar(35) NOT NULL,
	orders_notify_email   		varchar(35) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (currency) REFERENCES currency (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE partycategory  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE partytype  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	party_category   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (party_category) REFERENCES partycategory (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE roletype  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE party  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	party_type   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	user_name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (party_type) REFERENCES partytype (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE partyrole  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	party_role_party   int(11) NOT NULL,
   	party_role_type   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (party_role_party) REFERENCES party (id), 
 	FOREIGN KEY (party_role_type) REFERENCES roletype (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE partygroup  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
   	group_party   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	date_created   		date NOT NULL,
 	FOREIGN KEY (group_party) REFERENCES party (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE person  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
   	person_party   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	first_name   		varchar(70) NOT NULL,
	last_name   		varchar(70) NOT NULL,
	gender   		varchar(35) NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (person_party) REFERENCES party (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE partyprofile  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
   	profile_party   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	display_name   		varchar(70) NOT NULL,
	date_created   		date NULL,
	profile_status   		varchar(35) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (profile_party) REFERENCES party (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE billingaccount  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
   	b_account_party   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	balance   		decimal(38,0) NULL,
	date_created   		date NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (b_account_party) REFERENCES party (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE partyimage  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	file_party   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	file_url   		varchar(255) NOT NULL,
	file_size   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (file_party) REFERENCES party (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE partyfile  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	file_party   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	file_url   		varchar(255) NOT NULL,
	file_size   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (file_party) REFERENCES party (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE socialmediaaccounttype  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE socialmediaaccount  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	soc_account_type   int(11) NOT NULL,
   	soc_party   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	user_name   		varchar(70) NOT NULL,
	token_id   		varchar(35) NOT NULL,
	token_code   		varchar(35) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (soc_account_type) REFERENCES socialmediaaccounttype (id), 
 	FOREIGN KEY (soc_party) REFERENCES party (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE contactrequest  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
	name   		varchar(70) NOT NULL,
	email   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE qualificationtype  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE academiclevel  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE documenttype  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE noofpages  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE urgency  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	date_value   		varchar(70) NOT NULL,
	date_unit   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE subjectarea  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE subjectareaimage  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	file_subject_area   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	file_url   		varchar(255) NOT NULL,
	file_size   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (file_subject_area) REFERENCES subjectarea (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE subject  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
   	parent_area   int(11) NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (parent_area) REFERENCES subjectarea (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE writingstyle  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE partyeducation  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
   	education_party   int(11) NOT NULL,
   	qualification_type   int(11) NOT NULL,
   	qualification_sub   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	qualification_date   		date NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (education_party) REFERENCES party (id), 
 	FOREIGN KEY (qualification_type) REFERENCES qualificationtype (id), 
 	FOREIGN KEY (qualification_sub) REFERENCES subject (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE partysubject  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
   	subject_party   int(11) NOT NULL,
   	target_subject   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (subject_party) REFERENCES party (id), 
 	FOREIGN KEY (target_subject) REFERENCES subject (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE partyreview  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	reviewed_party   int(11) NOT NULL,
   	reviewed_by   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	rating   		INT(6) NOT NULL,
	review_date   		date NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (reviewed_party) REFERENCES party (id), 
 	FOREIGN KEY (reviewed_by) REFERENCES party (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE classificationtype  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE classification  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	class_type   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (class_type) REFERENCES classificationtype (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE contentcategory  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE contenttype  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	content_category   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (content_category) REFERENCES contentcategory (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE content  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	content_type   int(11) NOT NULL,
   	content_party   int(11) NOT NULL,
   	content_tutor   int(11) NOT NULL,
   	content_subject   int(11) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (content_type) REFERENCES contenttype (id), 
 	FOREIGN KEY (content_party) REFERENCES party (id), 
 	FOREIGN KEY (content_tutor) REFERENCES party (id), 
 	FOREIGN KEY (content_subject) REFERENCES subject (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE contentfile  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	file_of_content   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	file_url   		varchar(255) NOT NULL,
	file_size   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (file_of_content) REFERENCES content (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE contentclassification  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	class_content   int(11) NOT NULL,
   	content_class   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (class_content) REFERENCES content (id), 
 	FOREIGN KEY (content_class) REFERENCES classification (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE contentordertype  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE contentorderstatus  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE paymentstatus  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE contentorder  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
   	order_type   int(11) NOT NULL,
   	order_status   int(11) NOT NULL,
   	payment_status   int(11) NOT NULL,
   	order_content   int(11) NULL,
   	order_party   int(11) NOT NULL,
   	order_tutor   int(11) NULL,
   	academic_level   int(11) NOT NULL,
   	document_type   int(11) NOT NULL,
   	numpages   int(11) NOT NULL,
   	subject   int(11) NOT NULL,
   	urgency   int(11) NOT NULL,
   	writing_style   int(11) NOT NULL,
	order_date   		date NULL,
	total   		decimal(38,0) NULL,
	amount_paid   		decimal(38,0) NULL,
	post_question   		INT(6) NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (order_type) REFERENCES contentordertype (id), 
 	FOREIGN KEY (order_status) REFERENCES contentorderstatus (id), 
 	FOREIGN KEY (payment_status) REFERENCES paymentstatus (id), 
 	FOREIGN KEY (order_content) REFERENCES content (id), 
 	FOREIGN KEY (order_party) REFERENCES party (id), 
 	FOREIGN KEY (order_tutor) REFERENCES party (id), 
 	FOREIGN KEY (academic_level) REFERENCES academiclevel (id), 
 	FOREIGN KEY (document_type) REFERENCES contenttype (id), 
 	FOREIGN KEY (numpages) REFERENCES noofpages (id), 
 	FOREIGN KEY (subject) REFERENCES subject (id), 
 	FOREIGN KEY (urgency) REFERENCES urgency (id), 
 	FOREIGN KEY (writing_style) REFERENCES writingstyle (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE contentorderfile  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	file_content_order   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	file_url   		varchar(255) NOT NULL,
	file_size   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (file_content_order) REFERENCES contentorder (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE accounttransactiontype  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE accounttransactionstatus  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE accounttransaction  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NOT NULL,
   	acct_txn_type   int(11) NOT NULL,
   	transaction_status   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	txn_date   		date NOT NULL,
   	billing_account   int(11) NOT NULL,
   	transaction_order   int(11) NOT NULL,
	amount   		decimal(38,0) NULL,
	db_cr_fg   		varchar(70) NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (acct_txn_type) REFERENCES accounttransactiontype (id), 
 	FOREIGN KEY (transaction_status) REFERENCES accounttransactionstatus (id), 
 	FOREIGN KEY (billing_account) REFERENCES billingaccount (id), 
 	FOREIGN KEY (transaction_order) REFERENCES contentorder (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE disputetype  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE disputestatus  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
	name   		varchar(70) NOT NULL,
	description   		varchar(255) NOT NULL,
	PRIMARY KEY( id )
)ENGINE=INNODB;

CREATE TABLE dispute  ( 
	id   	int(11) AUTO_INCREMENT NOT NULL,
	entity_code   		varchar(35) NULL,
   	dispute_type   int(11) NOT NULL,
   	dispute_status   int(11) NOT NULL,
   	dispute_order   int(11) NOT NULL,
   	dispute_owner   int(11) NOT NULL,
	name   		varchar(70) NOT NULL,
	created_date   		date NOT NULL,
	description   		varchar(255) NOT NULL,
 	FOREIGN KEY (dispute_status) REFERENCES disputestatus (id), 
 	FOREIGN KEY (dispute_order) REFERENCES contentorder (id), 
 	FOREIGN KEY (dispute_owner) REFERENCES party (id), 
	PRIMARY KEY( id )
)ENGINE=INNODB;