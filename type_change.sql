-- Change the type of the 'biography' column to TEXT (when no data is there)
ALTER TABLE "Profile"
ALTER COLUMN "biography" TYPE TEXT;



-- Step 1: Add a new column "new_phone" with the TEXT data type
ALTER TABLE "User" ADD COLUMN "new_phone" TEXT;

-- Step 2: Update the "new_phone" column with the existing phone numbers
-- This step converts the INTEGER values to TEXT.
UPDATE "User"
SET "new_phone" = "phone"::TEXT;

-- Step 3: Drop the old "phone" column
ALTER TABLE "User" DROP COLUMN "phone";

-- Step 4: Rename the "new_phone" column to "phone"
ALTER TABLE "User" RENAME COLUMN "new_phone" TO "phone";
