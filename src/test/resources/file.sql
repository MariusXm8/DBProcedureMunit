CREATE TABLE persone(
	personaid INT,
    nome VARCHAR(25),
    cognome VARCHAR(25),
    eta INT
    );

--INSERT INTO persone (personaid, nome, cognome, eta) VALUES (1,'mario','pipa',15), (2,'cancro','giugno',20); 
INSERT INTO persone (personaid, nome, cognome, eta) SELECT * FROM CSVREAD('classpath:persone.csv');


CREATE ALIAS aggiungi AS $$
void aggiungi(Connection conn, int id, String nome, String cognome, int eta) throws SQLException {
    String sql = "INSERT INTO public.persone (personaid, NOME, COGNOME, ETA) VALUES (?, ?, ?, ?)";
    try (PreparedStatement Input = conn.prepareStatement(sql)) {
        Input.setInt(1, id);
        Input.setString(2, nome);
        Input.setString(3, cognome);
        Input.setInt(4, eta);
        Input.executeUpdate();
    }
}
$$;

CREATE ALIAS modifica AS $$
void modifica(Connection conn, int id, String nome) throws SQLException {
    String sql = "UPDATE public.persone SET NOME= ? WHERE personaid= ?";
    try (PreparedStatement Input = conn.prepareStatement(sql)) {
        Input.setString(1, nome);
        Input.setInt(2, id);
        Input.executeUpdate();
    }
}
$$;

CREATE ALIAS cancella AS $$
void cancella(Connection conn, int id)throws SQLException{
	String sql="DELETE FROM public.persone WHERE personaid= ?";
	try (PreparedStatement Input = conn.prepareStatement(sql)) {
        Input.setInt(1, id);
        Input.executeUpdate();
    }
}
$$;


















