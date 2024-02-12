CREATE TABLE IF NOT EXISTS rr_times.translated_headlines
(
    id serial PRIMARY KEY,
    title text NOT NULL,
    subtitle text
);

CREATE TABLE IF NOT EXISTS rr_times.issues
(
    id serial PRIMARY KEY,
    issued_at date NOT NULL,
    language char(2),
    country char(2),
    translated_headline_id integer REFERENCES rr_times.translated_headlines (id) ON DELETE RESTRICT,

    FOREIGN KEY (
        language, country
    ) REFERENCES rr_times.locales (language_code, country_code) ON DELETE SET NULL,

    UNIQUE (issued_at, language, country)
);
