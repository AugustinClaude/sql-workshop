CREATE SCHEMA rr_times;

CREATE TABLE IF NOT EXISTS rr_times.locales
(
    language_code char(2) NOT NULL,
    country_code char(2) NOT NULL,
    name varchar(50) NOT NULL UNIQUE,
    PRIMARY KEY (language_code, country_code)
);

CREATE TABLE IF NOT EXISTS rr_times.translated_articles
(
    id serial PRIMARY KEY,
    title text NOT NULL,
    body text NOT NULL
);
