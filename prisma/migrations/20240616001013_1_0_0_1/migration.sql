-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "userValidUntil" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Messages" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "descrip" TEXT NOT NULL,
    "clientsPhone" TEXT NOT NULL,
    "clientsName" TEXT NOT NULL,
    "clientsValue" TEXT NOT NULL,
    CONSTRAINT "Messages_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "DispatchLogs" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "messageId" TEXT NOT NULL,
    "contactId" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    CONSTRAINT "DispatchLogs_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "DispatchLogs_messageId_fkey" FOREIGN KEY ("messageId") REFERENCES "Messages" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "MessageLogs" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "messageId" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "descrip" TEXT NOT NULL,
    CONSTRAINT "MessageLogs_messageId_fkey" FOREIGN KEY ("messageId") REFERENCES "Messages" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Messages_id_key" ON "Messages"("id");

-- CreateIndex
CREATE UNIQUE INDEX "DispatchLogs_id_key" ON "DispatchLogs"("id");

-- CreateIndex
CREATE UNIQUE INDEX "MessageLogs_id_key" ON "MessageLogs"("id");
