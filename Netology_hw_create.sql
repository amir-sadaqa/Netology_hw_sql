-- Создание таблицы Genre
CREATE TABLE IF NOT EXISTS Genre(
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(255) NOT NULL
);

-- Cоздание таблицы Performer
CREATE TABLE IF NOT EXISTS Performer(
	performer_id SERIAL PRIMARY KEY,
	performer_name VARCHAR(255) NOT NULL
);

-- Создание таблицы Performer_Genre
CREATE TABLE IF NOT EXISTS Performer_Genre(
	performer_genre_id SERIAL PRIMARY KEY,
	performer_id INTEGER NOT NULL,
	genre_id INTEGER NOT NULL,
	CONSTRAINT fk_performer FOREIGN KEY(performer_id) REFERENCES Performer(performer_id) ON DELETE CASCADE, 
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES Genre(genre_id) ON DELETE CASCADE
);

-- Создание таблицы Album
CREATE TABLE IF NOT EXISTS Album(
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(255) NOT NULL,
	album_year INTEGER NOT NULL) -- не знаю, насколько указанный тип данных оправдывает хранение года выпуска альбома в таблице, т.к. в таком случае альбом условного 1992 года можно хранить 
	-- со значением 1992, а можно просто 92, что нецелесообразно не только с точки зрения эстетики, но и с точки зрения возможных вычислений. Например, если потребуется посчитать,
	-- сколько лет прошло с момента выхода самого старого хранимого альбома до выхода самого нового. Однако универсальное решение не нашел и воспользовался советом эксперта использовать
	-- тип данных INTEGER
;

-- Создание таблицы Album_Performer
CREATE TABLE IF NOT EXISTS Album_Performer(
	album_performer_id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL,
	performer_id INTEGER NOT NULL,
	CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES Album(album_id) ON DELETE CASCADE,
	CONSTRAINT fk_performer FOREIGN KEY(performer_id) REFERENCES Performer(performer_id)  ON DELETE CASCADE
);

-- Создание таблицы Track
CREATE TABLE IF NOT EXISTS Track(
	track_id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL,
	track_name VARCHAR(255) NOT NULL,
	track_length DECIMAL (6, 2) NOT NULL, -- здесь тоже есть сомнения в отношении верного типа данных для хранения длины трека. Наверно, можно было бы использовать просто VARCHAR
	CONSTRAINT fk_album_2 FOREIGN KEY(album_id) REFERENCES Album(album_id) ON DELETE CASCADE
);

-- Создание таблицы Collection
CREATE TABLE IF NOT EXISTS Collection(
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(255) NOT NULL,
	collection_year INTEGER NOT NULL
);

-- Создание таблицы Collection_Track
CREATE TABLE IF NOT EXISTS Collection_Track(
	collection_id INTEGER NOT NULL,
	track_id INTEGER NOT NULL,
	CONSTRAINT fk_collection FOREIGN KEY(collection_id) REFERENCES Collection(collection_id) ON DELETE CASCADE,
	CONSTRAINT fk_track FOREIGN KEY(track_id) REFERENCES Track(track_id) ON DELETE CASCADE,
	CONSTRAINT pk_2 PRIMARY KEY (collection_id, track_id)
);

-- Важное уточнение: в последнем примере ('Cоздание Collection_Trak') попытался создать альтернативное решение, реализующее связь 'многие ко многим', а именно:
-- не стал создавать первичный ключ collection_track_id, как это было сделано в других отношениях со связью 'многие ко многим', а вместо этого создал ограничение
-- первичного ключа на связку collection_id-track_id, чтобы такая связка не встречалась в таблице более одного раза. То же самое можно было бы сделать и для всех
-- других отношений, созданных выше, т.к. во всех них связка id по логике не может встречаться более одного раза. Если моя логика или реализация ошибочна, ожидаю ОС.
