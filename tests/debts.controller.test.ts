import supertest from "supertest";
import app from '../app';
import Debt from "../models/debt.model";

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
  const debtList = await Debt.find({});
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

  describe ('GET /debts/:id', () => {
    it('should return 404 if the debt is not found', async () => {
      const response = await request.get('/debts/6849a2264b3e5f7c12de0f2b');
      expect(response.status).toBe(404);
      expect(response.body).toEqual({"error": "Debt could not be found"})
    });

    it('should return 200 with the debt if found', async () => {
      const debt = await Debt.create({userId: userId, name: 'some debt', originalBalance: 500, minimumPayment: 50});
      const response = await request.get(`/debts/${debt._id}`);
      expect(response.status).toBe(200);
      expect(`${response.body._id}`).toEqual(`${debt._id}`)
    });
  });

  describe('POST /debt/', () => {
    it('should error if the debt is invalid', async () => {
      const debt = {name: null, originalBalance: 500, minimumPayment: 25};
      const response = await request.post('/debts/new').send(debt);
      expect(response.status).toBe(500);
    });

    it('returns the debt on success', async () => {
      const debt = {name: 'new debt', originalBalance: 500, minimumPayment: 25};
      const response = await request.post('/debts/new').send(debt);
      expect(response.status).toBe(200);
      expect(`${response.body.name}`).toEqual(`${debt.name}`);
    });
  });

  describe('PUT /debts/update/:id', () => {
    it('should error if the debt is not found', async () => {
      const response = await request.put('/debts/update/6849a2264b3e5f7c12de0f2b');
      expect(response.status).toBe(404);
    });

    it('should error on failed validation', async () => {
      const debt = await Debt.create({userId: userId, name: 'another debt', originalBalance: 500, minimumPayment: 25});
      const newDebt = {_id: debt._id, name: null, originalBalance: 500, minimumPayment: 25};
      const response = await request.put(`/debts/update/${debt._id}`).send(newDebt);
      expect(response.status).toBe(500);
    });

    it('should return 200 with the debt on success', async () => {
      const debt = await Debt.create({userId: userId, name: 'original debt', originalBalance: 500, minimumPayment: 25});
      const newDebt = {_id: debt._id, name: 'new name', originalBalance: 500, minimumPayment: 25};
      const response = await request.put(`/debts/update/${debt._id}`).send(newDebt);
      expect(response.status).toBe(200);
    });
  });

  describe('DELETE /debts/delete/:id', () => {
    it('should error if the debt is not found', async () => {
      const response = await request.delete('/debts/delete/6849a2264b3e5f7c12de0f2b');
      expect(response.status).toBe(404);
    });

    it('should return success', async () => {
      const originalDebtsList = await getDebtLength();
      const debt = await Debt.create({userId: userId, name: 'delete me', originalBalance: 250, minimumPayment: 30});
      const response = await request.delete(`/debts/delete/${debt._id}`);
      expect(response.status).toBe(200);
      const currentDebtList = await getDebtLength();
      expect(originalDebtsList).toBe(currentDebtList);
    })
  });
});
