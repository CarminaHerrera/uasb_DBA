--Crea la tabla album 

CREATE TABLE album(
  albumid integer PRIMARY KEY, 
  title text,
  artistid integer, REFERENCES artist (artistid) MATCH SIMPLE
);

--Crea la tabla artist 
CREATE TABLE artist(
  artistid integer PRIMARY KEY,
  name text
);

--Crea la tabla mediatype 
CREATE TABLE mediatype
(
  mediatypeid integer PRIMARY KEY,
  name text
);

--Crea la tabla genre 
CREATE TABLE genre
(
  genreid integer PRIMARY KEY,
  name text
);

--Crea la tabla album 
CREATE TABLE playlist
(
  playlistid integer PRIMARY KEY,
  name text
);

--Crea la tabla playlisttrack 
CREATE TABLE playlisttrack
(
  playlistid integer REFERENCES playlist (playlistid),
  trackid integer  REFERENCES track (trackid)
);

--Crea la tabla track 
CREATE TABLE track
(
  trackid integer PRIMARY KEY,
  name text,
  albumid integer REFERENCES album(albumid),
  mediatypeid integer REFERENCES mediatype(mediatypeid),
  genreid integer REFERENCES genre(genreid),
  composer text,
  milliseconds integer,
  bytes integer,
  unitprice numeric(10,2)
);

--Crea la tabla employee 
CREATE TABLE employee(
    employeeid integer PRIMARY KEY,
    lastname text,
    firstname text,
    title text,
    reportsto integer,
    birthdate timestamp,
    hiredate timestamp,
    address text,
    city text, 
    state text, 
    country text,
    postalcode text,
    phone text,
    fax text,
    email text
);

--Crea la tabla customer 
CREATE TABLE customer
(
  customerid integer PRIMARY KEY,
  firstname text,
  lastname text,
  company text,
  address text,
  city text,
  state text,
  country text,
  postalcode text,
  phone text,
  fax text,
  email text,
  supportrepid integer REFERENCES employee (employeeid)
);

--Crea la tabla invoice 
CREATE TABLE invoice(
    invoiceid integer PRIMARY KEY,
    customerid integer REFERENCES customer(customerid),
    invoicedate timestamp,
    billingaddress text,
    billingcity text,
    billingstate text,
    billingcountry text,
    billingpostalcode text,
    total numeric(10,2)
);

--Crea la tabla  invoiceline
CREATE TABLE invoiceline(
    invocelineid integer PRIMARY KEY,
    invoiceid integer REFERENCES invoice(invoiceid),
    trackid integer REFERENCES track(trackid),
    unitprice numeric (10,2),
    quantity integer
);
