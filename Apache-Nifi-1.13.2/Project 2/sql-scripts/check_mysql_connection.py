import mysql.connector
from mysql.connector import Error

def check_mysql_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='Hoabeo@890',
            database='youtube_search_results'
        )
        if connection.is_connected():
            print("Connected to MySQL database")
    except Error as e:
        print("Error while connecting to MySQL", e)
    finally:
        if connection.is_connected():
            connection.close()

check_mysql_connection()
