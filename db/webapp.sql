-- Создание базы данных
CREATE DATABASE WebRequests;
GO

USE WebRequests;
GO

-- Справочник пользователей
CREATE TABLE Users (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NULL
);
GO

-- Таблица заявок
CREATE TABLE Requests (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    Title NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Status NVARCHAR(50) NOT NULL DEFAULT N'Открыта',
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    CONSTRAINT FK_Requests_Users
        FOREIGN KEY (UserId) REFERENCES Users(Id)
);
GO