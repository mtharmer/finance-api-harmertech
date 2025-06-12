import "reflect-metadata";
import { Debt } from "../entity/Debt";
// import { DataSource } from "typeorm";
import { db } from "../app.config";

// jest.mock('../app.config', () => ({
//   ...jest.requireActual("../app.config"),
//   db: mockedDb,
// }));


beforeEach(async () => {
  if (!db.isInitialized) await db.initialize();
  await db.manager.deleteAll(Debt);
});

afterEach(async () => {
  // if (!db.isInitialized) await db.initialize();
  await db.manager.deleteAll(Debt);
});
