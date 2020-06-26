CREATE TABLE training.USER_ROLE(
	role_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name varchar UNIQUE NOT NULL
);

CREATE TABLE training.APP_USER (
	user_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	username varchar UNIQUE NOT NULL,
	password varchar NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	role_id int REFERENCES training.USER_ROLE(role_id)
);

CREATE TABLE training.STUDY_SET (
	study_set_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name varchar UNIQUE NOT NULL,
	owner_id int REFERENCES training.APP_USER(user_id)
);

CREATE TABLE training.CATEGORY (
	category_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name varchar UNIQUE NOT NULL
);

CREATE TABLE training.FLASHCARD (
	flashcard_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	question varchar UNIQUE NOT NULL,
	answer varchar NOT NULL,
	category_id int REFERENCES training.CATEGORY(category_id)
);

CREATE TABLE training.STUDY_SET_CARD (
	study_set_id int REFERENCES training.STUDY_SET(study_set_id),
	flashcard_id int REFERENCES training.FLASHCARD(flashcard_id),
	PRIMARY KEY(study_set_id, flashcard_id)
);