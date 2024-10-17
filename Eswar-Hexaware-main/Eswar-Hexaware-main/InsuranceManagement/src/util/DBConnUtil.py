# src/util/DBConnUtil.py
import pyodbc

class DBConnUtil:
    @staticmethod
    def get_connection():
        # Connect to the new database InsuranceDB1
        connection_string = (
            "DRIVER={ODBC Driver 17 for SQL Server};"
            "SERVER=LAPTOP-2JD3H0E6;"
            "DATABASE=InsuranceManagementDB;"
            "Trusted_Connection=yes;"
        )
        return pyodbc.connect(connection_string)
