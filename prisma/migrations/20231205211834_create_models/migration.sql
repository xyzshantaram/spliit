PRAGMA foreign_keys = ON;

-- CreateTable
CREATE TABLE "Group" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "Group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" SERIAL NOT NULL,
    "grouping" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Participant" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "groupId" TEXT NOT NULL,
    CONSTRAINT "Participant_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "Group"("id"),
    CONSTRAINT "Participant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Expense" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "amount" DECIMAL(65,30) NOT NULL,
    "paidById" TEXT NOT NULL,
    "splitMode" "STRING" NOT NULL DEFAULT 'EVENLY',
    "expenseDate" DATE NOT NULL DEFAULT CURRENT_DATE,
    groupId "STRING" NOT NULL,
    "categoryId" INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT "Expense_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "Expense_paidById_fkey" FOREIGN KEY ("paidById") REFERENCES "Participant"("id"),
    CONSTRAINT "Expense_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ExpensePaidFor" (
    "expenseId" TEXT NOT NULL,
    "participantId" TEXT NOT NULL,
    CONSTRAINT "ExpensePaidFor_pkey" PRIMARY KEY ("expenseId","participantId"),
    CONSTRAINT "ExpensePaidFor_expenseId_fkey" FOREIGN KEY ("expenseId") REFERENCES "Expense"("id"),
    CONSTRAINT "ExpensePaidFor_participantId_fkey" FOREIGN KEY ("participantId") REFERENCES "Participant"("id")
);