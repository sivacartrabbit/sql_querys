
-- INTEGER to TEXT
prisma can convert int to text during migration without data lose (we no need to do anything in migration file)
ALTER TABLE "User" ALTER COLUMN "phone" SET DATA TYPE TEXT;

================================================================================================================================================
  
-- INTEGER to BIGINT 
  no need to do anything like int to text
-- AlterTable
ALTER TABLE "User" ALTER COLUMN "phone" SET DATA TYPE BIGINT;

================================================================================================================================================
  
-- TEXT to INTEGER
-- Step 1: Add a new column "new_phone" with the INTEGER data type
ALTER TABLE "User" ADD COLUMN "new_phone" INTEGER;

-- Step 2: Update the "new_phone" column with the existing phone numbers (assuming they are numeric)
-- If your phone numbers contain non-numeric characters, you may need to clean the data before this step.
UPDATE "User"
SET "new_phone" = "phone"::INTEGER;

-- Step 3: Drop the old "phone" column
ALTER TABLE "User" DROP COLUMN "phone";

-- Step 4: Rename the "new_phone" column to "phone"
ALTER TABLE "User" RENAME COLUMN "new_phone" TO "phone";
