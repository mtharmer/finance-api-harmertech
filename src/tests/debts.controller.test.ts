import "reflect-metadata";
import supertest from "supertest";
import app from '../app';
import { Debt } from "../entity/Debt";
import { db } from "../app.config";

const request = supertest(app);

const userId = 'someuser';

jest.mock('../middleware/validateSession', () => ({
    __esModule: true,
    default: () => jest.fn((_req, _res, next) => next())
}))

jest.mock('../util/session', () => ({
  __esModule: true,
  userIdFromReq: () => userId
}))

const getDebtLength = async () => {
  const debtList = await db.manager.find(Debt);
  return Array(debtList).length;
}

beforeEach(() => {
  jest.clearAllMocks();
});

describe('Debts Controller', () => {
  // it('GET /debts should return 401 when unauthorized', async () => {
  //   const response = await request.get('/debts');
  //   expect(response.status).toBe(401);
  // });
  describe('GET /debts', () => {
    it('GET /debts should return an array when authorized', async () => {
      const response = await request.get('/debts');
      expect(response.status).toBe(200);
    });
  });

  describe('GET /debts/:id', () => {
    it('should return 404 if the debt is not found', async () => {
      const response = await request.get('/debts/123');
      expect(response.status).toBe(404);
    });

    it('should return 200 with the debt if found', async () => {
      const debt = await db.manager.save(Debt, {userId: userId, name: 'some debt', originalBalance: 500, minimumPayment: 50});
      const response = await request.get(`/debts/${debt.id}`);
      expect(response.status).toBe(200);
      expect(`${response.body.id}`).toEqual(`${debt.id}`)
    });
  });

  describe('POST /debt/new', () => {
    it('returns the debt on success', async () => {
      const debt = {name: 'new debt', originalBalance: 500, minimumPayment: 25};
      const response = await request.post('/debts/new').send(debt);
      expect(response.status).toBe(200);
    });
  });

  describe('PUT /debts/update/:id', () => {
    it('should return 200 with the debt on success', async () => {
      const debt = await db.manager.save(Debt, {userId: userId, name: 'original debt', originalBalance: 500, minimumPayment: 25});
      const newDebt = {id: debt.id, name: 'new name', originalBalance: 500, minimumPayment: 25};
      const response = await request.put(`/debts/update/${debt.id}`).send(newDebt);
      expect(response.status).toBe(200);
    });
  });

  describe('DELETE /debts/delete/:id', () => {
    it('should return success', async () => {
      const originalDebtsList = await getDebtLength();
      const debt = await db.manager.save(Debt, {userId: userId, name: 'delete me', originalBalance: 250, minimumPayment: 30});
      const response = await request.delete(`/debts/delete/${debt.id}`);
      expect(response.status).toBe(200);
      const currentDebtList = await getDebtLength();
      expect(originalDebtsList).toBe(currentDebtList);
    });
  });
});
