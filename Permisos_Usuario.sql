GRANT SELECT ON album To uasb_user;
GRANT SELECT ON artist To uasb_user;
GRANT SELECT ON customer To uasb_user;
GRANT SELECT ON employee To uasb_user;
GRANT SELECT ON genre To uasb_user;
GRANT SELECT ON invoice To uasb_user;
GRANT SELECT ON invoiceline To uasb_user;
GRANT SELECT ON mediatype To uasb_user;
GRANT SELECT ON playlist To uasb_user;
GRANT SELECT ON playlisttrack To uasb_user;
GRANT SELECT ON track To uasb_user;

GRANT INSERT, UPDATE, DELETE ON track To operator_user;
GRANT INSERT, UPDATE, DELETE  ON artist To operator_user;
GRANT INSERT, UPDATE, DELETE  ON customer To operator_user;
GRANT INSERT, UPDATE, DELETE  ON employee To operator_user;
GRANT INSERT, UPDATE, DELETE  ON genre To operator_user;
GRANT INSERT, UPDATE, DELETE  ON invoice To operator_user;
GRANT INSERT, UPDATE, DELETE  ON invoiceline To operator_user;
GRANT INSERT, UPDATE, DELETE  ON mediatype To operator_user;
GRANT INSERT, UPDATE, DELETE  ON playlist To operator_user;
GRANT INSERT, UPDATE, DELETE  ON playlisttrack To operator_user;
GRANT INSERT, UPDATE, DELETE  ON track To operator_user;


GRANT SELECT ON vista_tracks_mas_vendidos TO admin_user;
GRANT SELECT ON vista_tracks_mas_comprados TO admin_user;
GRANT SELECT ON vista_Mayor_Duracion TO admin_user;
GRANT SELECT ON vista_total_ventas_mes_vendedor TO admin_user;

GRANT SELECT ON TABLE vista_tracks_mas_vendidos TO test_user;
GRANT SELECT ON TABLE vista_tracks_mas_comprados TO test_user;
GRANT SELECT ON TABLE vista_Mayor_Duracion TO test_user;
GRANT SELECT ON TABLE vista_total_ventas_mes_vendedor TO test_user;

