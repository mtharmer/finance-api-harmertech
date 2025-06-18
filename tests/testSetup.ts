import "reflect-metadata";
import { Debt } from "../src/entity/Debt";
import { db } from "../src/app.config";

beforeEach(async () => {
  if (!db.isInitialized) await db.initialize();
  await db.manager.deleteAll(Debt);
});

afterEach(async () => {
  if (!db.isInitialized) await db.initialize();
  await db.manager.deleteAll(Debt);
});
