import mysql.connector

try:
    conn = mysql.connector.connect(user='root', password='', host='localhost', database='Ecole')
    cursor = conn.cursor()

    def insert_eleve():
        try:
            cursor.execute("INSERT INTO eleves (nom, prenom, age, numero_classe) VALUES ('Doe', 'John', 25, 1)")
            conn.commit()
        except Exception as e:
            print(f"Erreur lors de l'insertion : {e}")

    def jointure():
        try:
            cursor.execute("""
                SELECT * FROM eleves 
                JOIN enseignants 
                ON eleves.numero_classe = enseignants.numero_classe
            """)
            data = cursor.fetchall()
            for row in data:
                print(row)
        except Exception as e:
            print(f"Erreur lors de la jointure : {e}")

    def select_eleve():
        try:
            cursor.execute("SELECT * FROM eleves")
            data = cursor.fetchall()
            for row in data:
                print(row)
        except Exception as e:
            print(f"Erreur lors de la sélection des élèves : {e}")

    def compteeleve():
        try:
            cursor.execute("""
                SELECT enseignants.nom, count(*) 
                FROM eleves 
                JOIN enseignants 
                ON eleves.numero_classe = enseignants.numero_classe 
                GROUP BY enseignants.nom
            """)
            data = cursor.fetchall()
            for row in data:
                print(f"Enseignant: {row[0]}, Nombre d'élèves : {row[1]}")
        except Exception as e:
            print(f"Erreur lors du comptage : {e}")

    def eleveduprof():
        try:
            cursor.execute("""
                SELECT eleves.prenom, eleves.nom 
                FROM eleves 
                JOIN enseignants 
                ON eleves.numero_classe = enseignants.numero_classe 
                WHERE enseignants.nom = 'Salk'
            """)
            data = cursor.fetchall()
            eleveduprof1 = [row for row in data]
            for row in eleveduprof1:
                print(f"Élève : {row[0]} {row[1]}")
            return eleveduprof1
        except Exception as e:
            print(f"Erreur lors de la récupération des élèves du professeur : {e}")
            return []

    insert_eleve()
    jointure()
    select_eleve()
    compteeleve()
    eleveduprof()

except mysql.connector.Error as err:
    print(f"Erreur de connexion à la base de données : {err}")

finally:
    if conn.is_connected():
        cursor.close()
        conn.close()
        print("Connexion à la base de données fermée.")
