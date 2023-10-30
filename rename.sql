ALTER TABLE "Profile" DROP COLUMN "biograpy",
ADD COLUMN  "biography" TEXT NOT NULL;

to

ALTER TABLE "Profile"
RENAME COLUMN "biograpy" TO "biography";
