import Debt from "../models/debt.model";

beforeEach(async () => {
  await Debt.deleteMany({});
});

afterEach(async () => {
  await Debt.deleteMany({});
});
