# dao/UserServiceImpl.py
import pyodbc
from src.entity.User import User
from src.util.DBConnUtil import DBConnUtil

class UserServiceImpl:
    def __init__(self):
        self.conn = DBConnUtil.get_connection()

    def createUser(self, user):
        cursor = self.conn.cursor()
        query = "INSERT INTO Users (username, password, role) VALUES (?, ?, ?)"
        cursor.execute(query, user.get_username(), user.get_password(), user.get_role())
        self.conn.commit()
        return True

    def getUser(self, userId):
        cursor = self.conn.cursor()
        query = "SELECT * FROM Users WHERE userId = ?"
        cursor.execute(query, userId)
        result = cursor.fetchone()
        if result:
            return User(userId=result.userId, username=result.username, password=result.password, role=result.role)
        else:
            return None

    def getAllUsers(self):
        cursor = self.conn.cursor()
        query = "SELECT * FROM Users"
        cursor.execute(query)
        users = []
        for row in cursor.fetchall():
            user = User(userId=row.userId, username=row.username, password=row.password, role=row.role)
            users.append(user)
        return users

    def updateUser(self, user):
        cursor = self.conn.cursor()
        query = "UPDATE Users SET username = ?, password = ?, role = ? WHERE userId = ?"
        cursor.execute(query, user.get_username(), user.get_password(), user.get_role(), user.get_userId())
        self.conn.commit()
        return True

    def deleteUser(self, userId):
        cursor = self.conn.cursor()
        query = "DELETE FROM Users WHERE userId = ?"
        cursor.execute(query, userId)
        self.conn.commit()
        return True
