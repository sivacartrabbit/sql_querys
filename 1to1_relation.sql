
-- DropForeignKey
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_userId_fkey";

-- DropIndex
DROP INDEX "Profile_userId_unique";

-- AlterTable
ALTER TABLE "Profile" DROP COLUMN "userId";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "profileId" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "User_profileId_unique" ON "User"("profileId");

-- AddForeignKey
ALTER TABLE "User" ADD FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

--------------------------------- TO ----------------------------------------------


-- DropForeignKey
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_userId_fkey";

-- DropIndex
DROP INDEX "Profile_userId_unique";

-- AlterTable
ALTER TABLE "User" ADD COLUMN "profileId" INTEGER;

UPDATE "User"
SET "profileId" = "Profile".id
FROM "Profile"
WHERE "User".id = "Profile"."userId";

ALTER TABLE "User" ALTER COLUMN "profileId" SET NOT NULL;

-- AlterTable
ALTER TABLE "Profile" DROP COLUMN "userId";

-- CreateIndex
CREATE UNIQUE INDEX "User_profileId_unique" ON "User"("profileId");

-- AddForeignKey
ALTER TABLE "User" ADD FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;
