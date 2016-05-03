--Creacion de las Vistas
--Vista 1, Lista el top 5 de las canciones más vendidas por genero

CREATE VIEW vista_tracks_mas_vendidos AS
SELECT contador as posicion, genero, pista, count AS cant_ventas FROM (
SELECT *, row_number() over (partition by genero ) AS contador
FROM (SELECT count(t.trackid),t.name AS pista, g.name AS genero 
FROM invoiceline il
JOIN track t on t.trackid=il.trackid 
JOIN invoice i on i.invoiceid=il.invoiceid 
JOIN genre g on g.genreid=t.genreid 
GROUP BY t.name, g.name
ORDER BY genero, count DESC) AS ct) aux 
WHERE contador < 6 ;

--Vista 2, Lista los 3 clientes que han comprado más canciones

CREATE VIEW vista_tracks_mas_comprados AS
SELECT 	c.firstname, 
	c.lastname,
	c.phone, 
	c.email, 
	count(c.customerid) AS compras
FROM invoice i
JOIN invoiceline il ON il.invoiceid=i.invoiceid
JOIN customer c ON c.customerid=i.customerid
GROUP BY c.firstname,c.lastname,c.phone, c.email
ORDER BY compras desc
LIMIT 3;


--Vista 3, Lista las 20 canciones que tienen mayor duración agrupados por tipo de medio 


CREATE view vista_Mayor_Duracion as
SELECT numerador, media, track, milliseconds 
FROM ( SELECT *, row_number() over (partition by media ) as numerador 
FROM ( SELECT m.name as media, t.name as track, t.milliseconds FROM track t 
	JOIN mediatype m on m.mediatypeid=t.mediatypeid 
	ORDER BY m.name, milliseconds desc) 
	AS aux) 
AS aux2
WHERE numerador<21;



--Vista 4, Lista el total de ventas por mes agrupadas por el vendedor

CREATE VIEW vista_total_ventas_mes_vendedor AS
SELECT anio, mes, lastname, firstname, sum(total) AS total 
FROM ( SELECT extract(year from invoicedate) AS anio, extract(month 
	FROM invoicedate) AS mes, total, e.lastname, e.firstname 
		FROM invoice i 
JOIN customer c on c.customerid=i.customerid
JOIN employee e on e.employeeid=c.supportrepid
ORDER BY anio, mes, e.lastname, e.firstname
) AS aux
GROUP BY anio,mes, lastname, firstname;
