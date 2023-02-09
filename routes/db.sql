DROP TABLE IF EXISTS bookmark;
DROP TABLE IF EXISTS category;

CREATE TABLE category (
  id SERIAL PRIMARY KEY,
  name VARCHAR (100)
);
CREATE TABLE bookmark (
  id SERIAL PRIMARY KEY,
  name VARCHAR (100) unique,
  url VARCHAR (100) unique,
  "categoryId" INTEGER REFERENCES category(id)
);

INSERT INTO category (name) VALUES ('search');
INSERT INTO category (name) VALUES ('code');
INSERT INTO category (name) VALUES ('jobs');

INSERT INTO bookmark (name, url, "categoryId") VALUES ('Google','https://www.google.com/',(
  SELECT id
  FROM category
  WHERE name = 'search'
));
INSERT INTO bookmark (name, url, "categoryId") VALUES ('Stack Overflow','https://www.stackoverflow.com/',(
  SELECT id
  FROM category
  WHERE name = 'code'
));
INSERT INTO bookmark (name, url, "categoryId") VALUES ('Bing','https://www.bing.com/',(
  SELECT id
  FROM category
  WHERE name = 'search'
));
INSERT INTO bookmark (name, url, "categoryId") VALUES ('LinkedIn','https://www.linkedin.com/',(
  SELECT id
  FROM category
  WHERE name = 'jobs'
));
INSERT INTO bookmark (name, url, "categoryId") VALUES ('Indeed','https://www.indeed.com/',(
  SELECT id
  FROM category
  WHERE name = 'jobs'
));
INSERT INTO bookmark (name, url, "categoryId") VALUES ('MDN','https://developer.mozilla.org/en-US/',(
  SELECT id
  FROM category
  WHERE name = 'code'
));
