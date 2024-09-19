import mysql.connector
conn = mysql.connector.connect(user='root', password='', host='localhost',database='Ecole')
cursor = conn.cursor()

def insert_eleve():
    cursor.execute("INSERT INTO eleves (nom, prenom, age, numero_classe) VALUES ('Doe', 'John', 25, 1)")
    conn.commit()

def jointure():
    cursor.execute("SELECT * FROM eleves join enseignants on eleves.numero_classe = enseignants.numero_classe")
    data = cursor.fetchall()
    for row in data:
        print(row)

def select_eleve():
    cursor.execute("SELECT * FROM eleves")
    data = cursor.fetchall()
    for row in data:
        print(row)

def compteeleve():
    cursor.execute("SELECT enseignants.nom, count(*) FROM eleves join enseignants on eleves.numero_classe = enseignants.numero_classe group by enseignants.nom")
    data = cursor.fetchall()
    for row in data:
        print(row)
eleveduprof1 = []

def eleveduprof():
    cursor.execute("SELECT eleves.prenom, eleves.nom FROM eleves join enseignants on eleves.numero_classe = enseignants.numero_classe where enseignants.nom = 'Salk'")
    data = cursor.fetchall()
    for row in data:
        eleveduprof1.append(row)
        print(row)
    return eleveduprof1



for i in eleveduprof():
    print(i)


cursor.close()
conn.close()

